package com.example.refselect.repository;

import com.example.refselect.entity.RgonEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RgonRepository extends JpaRepository<RgonEntity, Integer> {
    
    /**
     * Finds all regions that are not deleted and have a specific use type, ordered by display order.
     * SQL LOGIC:
     * WHERE DELETE_FLG = '0' AND RGON_USE_TYP = '1' ORDER BY DISP_ORDER
     */
    List<RgonEntity> findByDeleteFlgAndRgonUseTypOrderByDispOrder(String deleteFlg, String rgonUseTyp);
}
