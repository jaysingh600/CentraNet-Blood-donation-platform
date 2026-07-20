package com.blooddonation.controller;

import com.blooddonation.entity.BloodGroup;
import com.blooddonation.entity.BloodRequest;
import com.blooddonation.entity.Requester;
import com.blooddonation.entity.User;
import com.blooddonation.repository.BloodGroupRepository;
import com.blooddonation.repository.BloodRequestRepository;
import com.blooddonation.repository.RequesterRepository;
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
@RequestMapping("/requester")
public class RequesterController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RequesterRepository requesterRepository;

    @Autowired
    private BloodRequestRepository bloodRequestRepository;

    @Autowired
    private BloodGroupRepository bloodGroupRepository;

    private Requester getLoggedInRequester() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(auth.getName()).orElse(null);
        if (user != null) {
            return requesterRepository.findByUser(user).orElse(null);
        }
        return null;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Requester requester = getLoggedInRequester();
        model.addAttribute("requester", requester);
        model.addAttribute("requests", bloodRequestRepository.findByRequester(requester));
        return "requester/dashboard";
    }

    @GetMapping("/request-blood")
    public String showRequestForm(Model model) {
        model.addAttribute("requester", getLoggedInRequester());
        model.addAttribute("bloodGroups", bloodGroupRepository.findAll());
        return "requester/request-form";
    }

    @PostMapping("/request-blood")
    public String submitRequestForm(@RequestParam("bloodGroupId") Long bloodGroupId,
                                    @RequestParam("unitsRequired") Integer unitsRequired,
                                    @RequestParam("reason") String reason,
                                    @RequestParam("patientName") String patientName,
                                    @RequestParam("patientAge") Integer patientAge,
                                    @RequestParam("hospitalPreference") String hospitalPreference,
                                    @RequestParam("emergencyContact") String emergencyContact,
                                    @RequestParam("requiredDate") String requiredDate) {
        
        Requester requester = getLoggedInRequester();
        BloodGroup group = bloodGroupRepository.findById(bloodGroupId).orElse(null);
        
        if (requester != null && group != null) {
            BloodRequest request = new BloodRequest();
            request.setRequester(requester);
            request.setBloodGroup(group);
            request.setUnitsRequired(unitsRequired);
            request.setReason(reason);
            request.setPatientName(patientName);
            request.setPatientAge(patientAge);
            request.setHospitalPreference(hospitalPreference);
            request.setEmergencyContact(emergencyContact);
            request.setRequiredDate(LocalDate.parse(requiredDate));
            request.setStatus("PENDING");
            
            bloodRequestRepository.save(request);
        }
        
        return "redirect:/requester/dashboard?success=true";
    }
}
