package com.blooddonation.repository;

import com.blooddonation.entity.DonationRequest;
import com.blooddonation.entity.Donor;
import com.blooddonation.entity.Hospital;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRequestRepository extends JpaRepository<DonationRequest, Long> {
    List<DonationRequest> findByDonor(Donor donor);
    List<DonationRequest> findByAssignedHospital(Hospital hospital);
    List<DonationRequest> findByStatus(String status);
}
