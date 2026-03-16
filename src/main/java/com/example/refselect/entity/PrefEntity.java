package com.example.refselect.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PREF_M")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PrefEntity {

    @Id
    @Column(name = "PREF_CD")
    private Integer prefCd;

    @Column(name = "PREF_NM", length = 40)
    private String prefNm;

    @Column(name = "DELETE_FLG", length = 1)
    private String deleteFlg;
}
