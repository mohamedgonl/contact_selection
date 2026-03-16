package com.example.refselect.entity;

import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "CONTACT_M")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ContactEntity {

    @Id
    @Column(name = "CONTACT_CD", length = 20)
    private String contactCd;

    @Column(name = "CONTACT_NM", length = 100)
    private String contactNm;

    @Column(name = "CONTACT_KN", length = 200)
    private String contactKn;

    @Column(name = "TEL_NO", length = 13)
    private String telNo;

    @Column(name = "PREF_CD")
    private Integer prefCd;

    @Column(name = "RGON_CD")
    private Integer rgonCd;

    @Column(name = "DELETE_FLG", length = 1)
    private String deleteFlg;

    @ManyToOne
    @JoinColumn(name = "PREF_CD", referencedColumnName = "PREF_CD", insertable = false, updatable = false)
    private PrefEntity prefecture;

    @ManyToOne
    @JoinColumn(name = "RGON_CD", referencedColumnName = "RGON_CD", insertable = false, updatable = false)
    private RgonEntity region;

    @jakarta.persistence.OneToMany
    @JoinColumn(name = "CONTACT_CD", referencedColumnName = "CONTACT_CD", insertable = false, updatable = false)
    private List<UrlEntity> urls;
}
