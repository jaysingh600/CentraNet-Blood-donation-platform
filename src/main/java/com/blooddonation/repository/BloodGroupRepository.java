package com.blooddonation.repository;

import com.blooddonation.entity.BloodGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BloodGroupRepository extends JpaRepository<BloodGroup, Long> {
    Optional<BloodGroup> findByGroupName(String groupName);
}
