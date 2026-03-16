package com.example.refselect.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "URL_M")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UrlEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "CONTACT_CD", length = 20)
    private String contactCd;

    @Column(name = "URL_ADDR", length = 256)
    private String urlAddr;

    @Column(name = "DELETE_FLG", length = 1)
    private String deleteFlg;
}
