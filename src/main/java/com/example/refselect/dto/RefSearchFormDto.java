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
public class RefSearchFormDto {
    private String txtRefNm;
    private String txtRefKn;
    private String telno;
    private String urlAheadSearch;
    private List<Integer> rgonCheck;
}
