package com.blooddonation.repository;

import com.blooddonation.entity.BloodRequest;
import com.blooddonation.entity.Hospital;
import com.blooddonation.entity.Requester;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BloodRequestRepository extends JpaRepository<BloodRequest, Long> {
    List<BloodRequest> findByRequester(Requester requester);
    List<BloodRequest> findByAssignedHospital(Hospital hospital);
    List<BloodRequest> findByStatus(String status);
}
