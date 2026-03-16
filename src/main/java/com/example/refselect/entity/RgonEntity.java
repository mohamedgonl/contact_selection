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
@Table(name = "RGON_M")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RgonEntity {

    @Id
    @Column(name = "RGON_CD")
    private Integer rgonCd;

    @Column(name = "RGON_NM", length = 40)
    private String rgonNm;

    @Column(name = "DELETE_FLG", length = 1)
    private String deleteFlg;

    @Column(name = "RGON_USE_TYP", length = 1)
    private String rgonUseTyp;

    @Column(name = "DISP_ORDER")
    private Integer dispOrder;
}
