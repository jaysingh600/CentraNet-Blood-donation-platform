package com.blooddonation.repository;

import com.blooddonation.entity.Hospital;
import com.blooddonation.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface HospitalRepository extends JpaRepository<Hospital, Long> {
    Optional<Hospital> findByUser(User user);
    boolean existsByRegistrationNumber(String registrationNumber);
}
