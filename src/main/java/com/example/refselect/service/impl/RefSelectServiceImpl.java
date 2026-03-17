package com.example.refselect.service.impl;

import com.example.refselect.dto.LoadOutDto;
import com.example.refselect.dto.RgonInfoDto;
import com.example.refselect.dto.RefLoadFormDto;
import com.example.refselect.dto.RefSearchFormDto;
import com.example.refselect.dto.RefSearchResponseDto;
import com.example.refselect.dto.RefSearchResultDto;
import com.example.refselect.dto.RefSelectFormDto;
import com.example.refselect.dto.RefSelectResponseDto;
import com.example.refselect.entity.RgonEntity;
import com.example.refselect.entity.ContactEntity;
import com.example.refselect.entity.UrlEntity;
import com.example.refselect.repository.RgonRepository;
import com.example.refselect.repository.ContactRepository;
import com.example.refselect.service.RefSelectService;
import com.example.refselect.constant.AppConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;

@Service
@RequiredArgsConstructor
public class RefSelectServiceImpl implements RefSelectService {

    private final RgonRepository rgonRepository;
    private final ContactRepository contactRepository;

    @Override
    public LoadOutDto load(RefLoadFormDto request) {
        // 2 Query region list from database
        // Condition: DELETE_FLG = '0' AND RGON_USE_TYP = '1', ORDER BY DISP_ORDER
        List<RgonEntity> entities = rgonRepository.findByDeleteFlgAndRgonUseTypOrderByDispOrder(
                AppConstants.DELETE_FLG_OFF, AppConstants.RGON_USE_TYP_ACTIVE);

        // 3 Map results into List<RgonInfoDto>
        List<RgonInfoDto> rgonInfoDtos = entities.stream()
                .map(entity -> RgonInfoDto.builder()
                        .rgonCd(entity.getRgonCd())
                        .rgonNm(entity.getRgonNm())
                        .build())
                .collect(Collectors.toList());

        // 4 Create response LoadOutDto
        // 5 Set region list
        // 6 Set refSelectHTML as empty string
        return LoadOutDto.builder()
                .rgonInfoDto(rgonInfoDtos)
                .refSelectHTML("")
                .build();
    }

    @Override
    public RefSearchResponseDto search(RefSearchFormDto request) {
        Specification<ContactEntity> spec = (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            // Basic condition: not deleted
            predicates.add(cb.equal(root.get("deleteFlg"), AppConstants.DELETE_FLG_OFF));

            // Forward match for name
            if (request.getTxtRefNm() != null && !request.getTxtRefNm().isEmpty()) {
                predicates.add(cb.like(root.get("contactNm"), request.getTxtRefNm() + "%"));
            }

            // Forward match for kana
            if (request.getTxtRefKn() != null && !request.getTxtRefKn().isEmpty()) {
                predicates.add(cb.like(root.get("contactKn"), request.getTxtRefKn() + "%"));
            }

            // Forward match for phone
            if (request.getTelno() != null && !request.getTelno().isEmpty()) {
                predicates.add(cb.like(root.get("telNo"), request.getTelno() + "%"));
            }

            // In list for regions
            if (request.getRgonCheck() != null && !request.getRgonCheck().isEmpty()) {
                predicates.add(root.get("rgonCd").in(request.getRgonCheck()));
            }

            // Partial match for URL (joins with URL_M)
            if (request.getUrlAheadSearch() != null && !request.getUrlAheadSearch().isEmpty()) {
                Join<ContactEntity, UrlEntity> urlJoin = root.join("urls");
                predicates.add(cb.equal(urlJoin.get("deleteFlg"), AppConstants.DELETE_FLG_OFF));
                predicates.add(cb.like(urlJoin.get("urlAddr"), "%" + request.getUrlAheadSearch() + "%"));
                query.distinct(true);
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };

        long totalCountLong = contactRepository.count(spec);
        int totalCount = (int) totalCountLong;

        // Check count for message IDs
        String messageId = null;
        if (totalCount == 0) {
            messageId = AppConstants.MSG_ERROR_NO_RESULTS;
        } else if (totalCount > AppConstants.SEARCH_LIMIT) {
            messageId = AppConstants.MSG_WARN_LIMIT_EXCEEDED;
        }

        List<ContactEntity> entities = new ArrayList<>();
        if (totalCount > 0) {
            entities = contactRepository.findAll(spec);
        }

        // Map results
        List<RefSearchResultDto> results = entities.stream()
                .map(entity -> {
                    // Combine URLs with " / "
                    String combinedUrls = "";
                    if (entity.getUrls() != null) {
                        combinedUrls = entity.getUrls().stream()
                                .filter(u -> AppConstants.DELETE_FLG_OFF.equals(u.getDeleteFlg()))
                                .map(UrlEntity::getUrlAddr)
                                .collect(Collectors.joining(AppConstants.URL_SEPARATOR));
                    }

                    return RefSearchResultDto.builder()
                            .refCd(entity.getContactCd())
                            .refNm(entity.getContactNm())
                            .refKn(entity.getContactKn())
                            .telno(entity.getTelNo())
                            .prefecture(entity.getPrefecture() != null ? entity.getPrefecture().getPrefNm() : "")
                            .rgonNm(entity.getRegion() != null ? entity.getRegion().getRgonNm() : "")
                            .urlAhead(combinedUrls)
                            .build();
                })
                .collect(Collectors.toList());

        return RefSearchResponseDto.builder()
                .count(totalCount)
                .refList(results)
                .messageId(messageId)
                .build();
    }

    @Override
    public RefSelectResponseDto select(RefSelectFormDto request) {
        // (1) Validation for selection
        // Rule: If multiple selected in non-bulk mode (kindRef == 0), show error
        // SE4102_00166
        if (request.getContactCds() != null && request.getContactCds().size() > 1
                && Integer.valueOf(AppConstants.KIND_REF_SINGLE).equals(request.getKindRef())) {
            return RefSelectResponseDto.builder()
                    .success(false)
                    .messageId(AppConstants.MSG_ERROR_SINGLE_SELECT_ONLY)
                    .build();
        }

        // Fetch details for selected codes
        List<ContactEntity> entities = contactRepository.findAllById(request.getContactCds());

        // Map to results
        List<RefSearchResultDto> selectedData = entities.stream()
                .map(entity -> {
                    String combinedUrls = "";
                    if (entity.getUrls() != null) {
                        combinedUrls = entity.getUrls().stream()
                                .filter(u -> AppConstants.DELETE_FLG_OFF.equals(u.getDeleteFlg()))
                                .map(UrlEntity::getUrlAddr)
                                .collect(Collectors.joining(AppConstants.URL_SEPARATOR));
                    }

                    return RefSearchResultDto.builder()
                            .refCd(entity.getContactCd())
                            .refNm(entity.getContactNm())
                            .refKn(entity.getContactKn())
                            .telno(entity.getTelNo())
                            .prefecture(entity.getPrefecture() != null ? entity.getPrefecture().getPrefNm() : "")
                            .rgonNm(entity.getRegion() != null ? entity.getRegion().getRgonNm() : "")
                            .urlAhead(combinedUrls)
                            .build();
                })
                .collect(Collectors.toList());

        return RefSelectResponseDto.builder()
                .success(true)
                .selectedData(selectedData)
                .build();
    }
}
