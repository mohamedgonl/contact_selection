package com.example.refselect.repository;

import com.example.refselect.entity.ContactEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends JpaRepository<ContactEntity, String>, JpaSpecificationExecutor<ContactEntity> {
}
