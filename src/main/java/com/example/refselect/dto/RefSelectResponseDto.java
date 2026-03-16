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
public class RefSelectResponseDto {
    private boolean success;
    private String messageId;
    private List<RefSearchResultDto> selectedData;
}
