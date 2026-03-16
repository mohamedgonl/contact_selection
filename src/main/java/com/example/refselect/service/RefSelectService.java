package com.example.refselect.service;

import com.example.refselect.dto.LoadOutDto;
import com.example.refselect.dto.RefLoadFormDto;
import com.example.refselect.dto.RefSearchFormDto;
import com.example.refselect.dto.RefSearchResponseDto;
import com.example.refselect.dto.RefSelectFormDto;
import com.example.refselect.dto.RefSelectResponseDto;

public interface RefSelectService {
    LoadOutDto load(RefLoadFormDto request);
    RefSearchResponseDto search(RefSearchFormDto request);
    RefSelectResponseDto select(RefSelectFormDto request);
}
