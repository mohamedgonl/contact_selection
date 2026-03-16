package com.example.refselect.repository;

import com.example.refselect.entity.UrlEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UrlRepository extends JpaRepository<UrlEntity, Long> {
    List<UrlEntity> findByContactCdAndDeleteFlg(String contactCd, String deleteFlg);
}
