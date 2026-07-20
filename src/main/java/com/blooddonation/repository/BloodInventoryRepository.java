package com.blooddonation.repository;

import com.blooddonation.entity.BloodGroup;
import com.blooddonation.entity.BloodInventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BloodInventoryRepository extends JpaRepository<BloodInventory, Long> {
    Optional<BloodInventory> findByBloodGroup(BloodGroup bloodGroup);
}
