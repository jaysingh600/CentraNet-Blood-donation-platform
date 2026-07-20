package com.blooddonation.controller;

import com.blooddonation.entity.Hospital;
import com.blooddonation.entity.User;
import com.blooddonation.repository.BloodRequestRepository;
import com.blooddonation.repository.DonationRequestRepository;
import com.blooddonation.repository.HospitalRepository;
import com.blooddonation.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

    @Autowired
    private HospitalRepository hospitalRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DonationRequestRepository donationRequestRepository;

    @Autowired
    private BloodRequestRepository bloodRequestRepository;

    private Hospital getLoggedInHospital() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(auth.getName()).orElse(null);
        if (user != null) {
            return hospitalRepository.findByUser(user).orElse(null);
        }
        return null;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Hospital hospital = getLoggedInHospital();
        if (hospital != null) {
            long assignedDonors = donationRequestRepository.findByAssignedHospital(hospital).size();
            long assignedRequesters = bloodRequestRepository.findByAssignedHospital(hospital).size();
            
            model.addAttribute("hospital", hospital);
            model.addAttribute("assignedDonorsCount", assignedDonors);
            model.addAttribute("assignedRequestersCount", assignedRequesters);
        }
        return "hospital/dashboard";
    }
    
    @GetMapping("/assigned-donors")
    public String assignedDonors(Model model) {
        Hospital hospital = getLoggedInHospital();
        if (hospital != null) {
            model.addAttribute("donations", donationRequestRepository.findByAssignedHospital(hospital));
        }
        return "hospital/assigned-donors";
    }
    
    @GetMapping("/assigned-requesters")
    public String assignedRequesters(Model model) {
        Hospital hospital = getLoggedInHospital();
        if (hospital != null) {
            model.addAttribute("requests", bloodRequestRepository.findByAssignedHospital(hospital));
        }
        return "hospital/assigned-requesters";
    }

    @Autowired
    private com.blooddonation.repository.BloodInventoryRepository inventoryRepository;

    @PostMapping("/donations/complete")
    public String completeDonation(@org.springframework.web.bind.annotation.RequestParam("id") Long id,
                                   @org.springframework.web.bind.annotation.RequestParam("unitsCollected") Integer unitsCollected) {
        var req = donationRequestRepository.findById(id).orElse(null);
        if (req != null && "APPROVED".equals(req.getStatus())) {
            req.setStatus("COMPLETED");
            req.setUnitsCollected(unitsCollected);
            donationRequestRepository.save(req);

            // Increase Inventory
            var inventory = inventoryRepository.findByBloodGroup(req.getBloodGroup())
                    .orElse(new com.blooddonation.entity.BloodInventory());
            if (inventory.getId() == null) {
                inventory.setBloodGroup(req.getBloodGroup());
                inventory.setAvailableUnits(0);
            }
            inventory.setAvailableUnits(inventory.getAvailableUnits() + unitsCollected);
            inventoryRepository.save(inventory);
        }
        return "redirect:/hospital/assigned-donors";
    }

    @PostMapping("/requests/issue")
    public String issueBlood(@org.springframework.web.bind.annotation.RequestParam("id") Long id,
                             @org.springframework.web.bind.annotation.RequestParam("unitsDelivered") Integer unitsDelivered) {
        var req = bloodRequestRepository.findById(id).orElse(null);
        if (req != null && "APPROVED".equals(req.getStatus())) {
            req.setStatus("COMPLETED");
            req.setUnitsDelivered(unitsDelivered);
            bloodRequestRepository.save(req);

            // Decrease Inventory
            var inventory = inventoryRepository.findByBloodGroup(req.getBloodGroup()).orElse(null);
            if (inventory != null) {
                inventory.setAvailableUnits(inventory.getAvailableUnits() - unitsDelivered);
                inventoryRepository.save(inventory);
            }
        }
        return "redirect:/hospital/assigned-requesters";
    }
}
