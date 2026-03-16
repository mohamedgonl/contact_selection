package com.example.refselect.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RgonInfoDto {
    private Integer rgonCd;
    private String rgonNm;
}
