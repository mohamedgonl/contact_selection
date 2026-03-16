package com.example.refselect.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RefSearchResponseDto {
    private Integer count;
    private List<RefSearchResultDto> refList;
    private String messageId; // For SE4101_00040 or SI4101_00063
}
