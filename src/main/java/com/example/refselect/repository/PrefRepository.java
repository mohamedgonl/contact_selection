package com.example.refselect.repository;

import com.example.refselect.entity.PrefEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrefRepository extends JpaRepository<PrefEntity, Integer> {
}
