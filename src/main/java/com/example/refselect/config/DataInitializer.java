package com.example.refselect.config;

import com.example.refselect.entity.ContactEntity;
import com.example.refselect.entity.PrefEntity;
import com.example.refselect.entity.RgonEntity;
import com.example.refselect.entity.UrlEntity;
import com.example.refselect.repository.ContactRepository;
import com.example.refselect.repository.PrefRepository;
import com.example.refselect.repository.RgonRepository;
import com.example.refselect.repository.UrlRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
@RequiredArgsConstructor
public class DataInitializer {

    @Bean
    public CommandLineRunner initData(
            RgonRepository rgonRepository,
            PrefRepository prefRepository,
            ContactRepository contactRepository,
            UrlRepository urlRepository) {
        return args -> {
            if (rgonRepository.count() == 0) {
                // Initial Regions
                RgonEntity kanto = RgonEntity.builder()
                        .rgonCd(1).rgonNm("Kanto").deleteFlg("0").rgonUseTyp("1").dispOrder(1).build();
                RgonEntity kansai = RgonEntity.builder()
                        .rgonCd(2).rgonNm("Kansai").deleteFlg("0").rgonUseTyp("1").dispOrder(2).build();
                rgonRepository.saveAll(List.of(kanto, kansai));

                // Initial Prefectures
                PrefEntity tokyo = PrefEntity.builder().prefCd(13).prefNm("Tokyo").deleteFlg("0").build();
                PrefEntity osaka = PrefEntity.builder().prefCd(27).prefNm("Osaka").deleteFlg("0").build();
                prefRepository.saveAll(List.of(tokyo, osaka));

                // Initial Contacts
                ContactEntity contact1 = ContactEntity.builder()
                        .contactCd("CD001").contactNm("Cong ty Nhat A").contactKn("コンパニーA")
                        .telNo("09011112222").prefCd(13).rgonCd(1).deleteFlg("0").build();
                ContactEntity contact2 = ContactEntity.builder()
                        .contactCd("CD002").contactNm("Cong ty Nhat B").contactKn("コンパニーB")
                        .telNo("09033334444").prefCd(27).rgonCd(2).deleteFlg("0").build();
                contactRepository.saveAll(List.of(contact1, contact2));

                // Initial URLs
                UrlEntity url1 = UrlEntity.builder().contactCd("CD001").urlAddr("https://companyA.jp").deleteFlg("0").build();
                UrlEntity url2 = UrlEntity.builder().contactCd("CD001").urlAddr("https://support.companyA.jp").deleteFlg("0").build();
                urlRepository.saveAll(List.of(url1, url2));

                System.out.println(">>> Sample data initialized successfully!");
            }
        };
    }
}
