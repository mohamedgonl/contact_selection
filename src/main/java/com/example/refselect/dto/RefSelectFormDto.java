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
public class RefSelectFormDto {
    private Integer kindRef;
    private List<String> contactCds;
}
