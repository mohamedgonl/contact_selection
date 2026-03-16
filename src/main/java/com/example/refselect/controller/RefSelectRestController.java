package com.example.refselect.controller;

import com.example.refselect.dto.LoadOutDto;
import com.example.refselect.dto.RefLoadFormDto;
import com.example.refselect.dto.RefSearchFormDto;
import com.example.refselect.dto.RefSearchResponseDto;
import com.example.refselect.dto.RefSelectFormDto;
import com.example.refselect.dto.RefSelectResponseDto;
import com.example.refselect.service.RefSelectService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/purchase/event_entry/event_info/ajax")
@RequiredArgsConstructor
public class RefSelectRestController {

    private final RefSelectService refSelectService;

    @PostMapping("/ref_select_load")
    public ResponseEntity<LoadOutDto> load(@RequestBody RefLoadFormDto request) {
        LoadOutDto response = refSelectService.load(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/ref_select_search")
    public ResponseEntity<RefSearchResponseDto> search(@RequestBody RefSearchFormDto request) {
        RefSearchResponseDto response = refSelectService.search(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/ref_select_confirm")
    public ResponseEntity<RefSelectResponseDto> select(@RequestBody RefSelectFormDto request) {
        RefSelectResponseDto response = refSelectService.select(request);
        return ResponseEntity.ok(response);
    }
}
