package com.blooddonation.service;

import com.blooddonation.dto.UserRegistrationDto;
import com.blooddonation.entity.*;
import com.blooddonation.repository.DonorRepository;
import com.blooddonation.repository.HospitalRepository;
import com.blooddonation.repository.RequesterRepository;
import com.blooddonation.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private DonorRepository donorRepository;
    
    @Autowired
    private RequesterRepository requesterRepository;
    
    @Autowired
    private HospitalRepository hospitalRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }
    
    public boolean hospitalRegExists(String regNo) {
        return hospitalRepository.existsByRegistrationNumber(regNo);
    }

    @Transactional
    public User registerNewUserAccount(UserRegistrationDto registrationDto) {
        User user = new User();
        user.setEmail(registrationDto.getEmail());
        user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
        user.setRole(Role.valueOf("ROLE_" + registrationDto.getRole().toUpperCase()));
        
        user = userRepository.save(user);

        if ("DONOR".equalsIgnoreCase(registrationDto.getRole())) {
            Donor donor = new Donor();
            donor.setUser(user);
            donor.setName(registrationDto.getName());
            donor.setPhone(registrationDto.getPhone());
            donor.setAge(registrationDto.getAge());
            donor.setGender(registrationDto.getGender());
            donor.setBloodGroup(registrationDto.getBloodGroup());
            donor.setWeight(registrationDto.getWeight());
            donorRepository.save(donor);
        } else if ("REQUESTER".equalsIgnoreCase(registrationDto.getRole())) {
            Requester requester = new Requester();
            requester.setUser(user);
            requester.setName(registrationDto.getName());
            requester.setPhone(registrationDto.getPhone());
            requesterRepository.save(requester);
        } else if ("HOSPITAL".equalsIgnoreCase(registrationDto.getRole())) {
            Hospital hospital = new Hospital();
            hospital.setUser(user);
            hospital.setHospitalName(registrationDto.getName());
            hospital.setPhone(registrationDto.getPhone());
            hospital.setRegistrationNumber(registrationDto.getRegistrationNumber());
            hospital.setCity(registrationDto.getCity());
            hospital.setState(registrationDto.getState());
            hospitalRepository.save(hospital);
        }
        
        return user;
    }
}
