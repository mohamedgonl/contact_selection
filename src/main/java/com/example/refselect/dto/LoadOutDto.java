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
public class LoadOutDto {
    private List<RgonInfoDto> rgonInfoDto;
    private String refSelectHTML;
}
