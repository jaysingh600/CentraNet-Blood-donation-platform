package com.blooddonation.repository;

import com.blooddonation.entity.Donor;
import com.blooddonation.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DonorRepository extends JpaRepository<Donor, Long> {
    Optional<Donor> findByUser(User user);
}
