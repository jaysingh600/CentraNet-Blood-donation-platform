package com.blooddonation.repository;

import com.blooddonation.entity.Requester;
import com.blooddonation.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RequesterRepository extends JpaRepository<Requester, Long> {
    Optional<Requester> findByUser(User user);
}
