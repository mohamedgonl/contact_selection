package com.example.refselect.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RefSearchResultDto {
    private String refCd;
    private String refNm;
    private String refKn;
    private String telno;
    private String prefecture;
    private String rgonNm;
    private String urlAhead;
}
