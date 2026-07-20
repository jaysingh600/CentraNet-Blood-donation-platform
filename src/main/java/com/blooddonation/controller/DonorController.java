package com.blooddonation.controller;

import com.blooddonation.entity.BloodGroup;
import com.blooddonation.entity.DonationRequest;
import com.blooddonation.entity.Donor;
import com.blooddonation.entity.User;
import com.blooddonation.repository.BloodGroupRepository;
import com.blooddonation.repository.DonationRequestRepository;
import com.blooddonation.repository.DonorRepository;
import com.blooddonation.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
@RequestMapping("/donor")
public class DonorController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DonorRepository donorRepository;

    @Autowired
    private DonationRequestRepository donationRequestRepository;

    @Autowired
    private BloodGroupRepository bloodGroupRepository;

    private Donor getLoggedInDonor() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(auth.getName()).orElse(null);
        if (user != null) {
            return donorRepository.findByUser(user).orElse(null);
        }
        return null;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Donor donor = getLoggedInDonor();
        model.addAttribute("donor", donor);
        model.addAttribute("donations", donationRequestRepository.findByDonor(donor));
        return "donor/dashboard";
    }

    @GetMapping("/donate")
    public String showDonationForm(Model model) {
        model.addAttribute("donor", getLoggedInDonor());
        model.addAttribute("bloodGroups", bloodGroupRepository.findAll());
        return "donor/donate-form";
    }

    @PostMapping("/donate")
    public String submitDonationForm(@RequestParam("bloodGroupId") Long bloodGroupId,
                                     @RequestParam("availableDate") String availableDate,
                                     @RequestParam("preferredHospital") String preferredHospital,
                                     @RequestParam("healthStatus") String healthStatus,
                                     @RequestParam("medicalRemarks") String medicalRemarks,
                                     @RequestParam("unitsExpected") Integer unitsExpected,
                                     @RequestParam("emergencyContact") String emergencyContact) {
        
        Donor donor = getLoggedInDonor();
        BloodGroup group = bloodGroupRepository.findById(bloodGroupId).orElse(null);
        
        if (donor != null && group != null) {
            DonationRequest request = new DonationRequest();
            request.setDonor(donor);
            request.setBloodGroup(group);
            request.setAvailableDate(LocalDate.parse(availableDate));
            request.setPreferredHospital(preferredHospital);
            request.setHealthStatus(healthStatus);
            request.setMedicalRemarks(medicalRemarks);
            request.setUnitsExpected(unitsExpected);
            request.setEmergencyContact(emergencyContact);
            request.setStatus("PENDING");
            
            donationRequestRepository.save(request);
        }
        
        return "redirect:/donor/dashboard?success=true";
    }
}
