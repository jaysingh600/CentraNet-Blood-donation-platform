package com.blooddonation.controller;

import com.blooddonation.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private DonorRepository donorRepository;

    @Autowired
    private RequesterRepository requesterRepository;

    @Autowired
    private HospitalRepository hospitalRepository;

    @Autowired
    private BloodInventoryRepository inventoryRepository;

    @Autowired
    private DonationRequestRepository donationRequestRepository;
    
    @Autowired
    private BloodRequestRepository bloodRequestRepository;
    
    @Autowired
    private com.blooddonation.service.EmailService emailService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        long totalDonors = donorRepository.count();
        long totalRequesters = requesterRepository.count();
        long totalHospitals = hospitalRepository.count();
        
        long pendingDonations = donationRequestRepository.findByStatus("PENDING").size();
        long pendingRequests = bloodRequestRepository.findByStatus("PENDING").size();

        model.addAttribute("totalDonors", totalDonors);
        model.addAttribute("totalRequesters", totalRequesters);
        model.addAttribute("totalHospitals", totalHospitals);
        model.addAttribute("pendingDonations", pendingDonations);
        model.addAttribute("pendingRequests", pendingRequests);
        
        // Also fetch inventory summary for the dashboard
        model.addAttribute("inventory", inventoryRepository.findAll());

        return "admin/dashboard";
    }

    @GetMapping("/donors")
    public String manageDonors(Model model) {
        model.addAttribute("donors", donorRepository.findAll());
        return "admin/manage-donors";
    }

    @GetMapping("/hospitals")
    public String manageHospitals(Model model) {
        model.addAttribute("hospitals", hospitalRepository.findAll());
        return "admin/manage-hospitals";
    }
    
    @GetMapping("/inventory")
    public String viewInventory(Model model) {
        model.addAttribute("inventory", inventoryRepository.findAll());
        return "admin/inventory";
    }

    @GetMapping("/donations")
    public String manageDonations(Model model) {
        model.addAttribute("donations", donationRequestRepository.findAll());
        model.addAttribute("hospitals", hospitalRepository.findAll());
        return "admin/manage-donations";
    }

    @PostMapping("/donations/approve")
    public String approveDonation(@RequestParam("id") Long id, 
                                  @RequestParam("hospitalId") Long hospitalId,
                                  @RequestParam("reportingDate") String reportingDate,
                                  @RequestParam("reportingTime") String reportingTime,
                                  @RequestParam("instructions") String instructions) {
        var req = donationRequestRepository.findById(id).orElse(null);
        var hosp = hospitalRepository.findById(hospitalId).orElse(null);
        if (req != null && hosp != null) {
            req.setStatus("APPROVED");
            req.setAssignedHospital(hosp);
            req.setReportingDate(java.time.LocalDate.parse(reportingDate));
            req.setReportingTime(reportingTime);
            req.setInstructions(instructions);
            donationRequestRepository.save(req);
            
            // Send Email
            String emailBody = String.format("Dear %s,\n\nYour donation request has been APPROVED.\nPlease report to %s at %s.\n\nInstructions: %s\n\nThank you for saving lives!",
                req.getDonor().getName(), hosp.getHospitalName(), reportingDate + " " + reportingTime, instructions);
            emailService.sendEmail(req.getDonor().getUser().getEmail(), "Donation Request Approved", emailBody);
        }
        return "redirect:/admin/donations";
    }

    @PostMapping("/donations/reject")
    public String rejectDonation(@RequestParam("id") Long id, @RequestParam("reason") String reason) {
        var req = donationRequestRepository.findById(id).orElse(null);
        if (req != null) {
            req.setStatus("REJECTED");
            req.setRejectionReason(reason);
            donationRequestRepository.save(req);
            
            // Send Email
            String emailBody = String.format("Dear %s,\n\nWe regret to inform you that your donation request has been REJECTED.\nReason: %s\n\nThank you for your understanding.",
                req.getDonor().getName(), reason);
            emailService.sendEmail(req.getDonor().getUser().getEmail(), "Donation Request Rejected", emailBody);
        }
        return "redirect:/admin/donations";
    }

    @GetMapping("/requests")
    public String manageRequests(Model model) {
        model.addAttribute("requests", bloodRequestRepository.findAll());
        model.addAttribute("hospitals", hospitalRepository.findAll());
        return "admin/manage-requests";
    }

    @PostMapping("/requests/approve")
    public String approveRequest(@RequestParam("id") Long id, 
                                 @RequestParam("hospitalId") Long hospitalId,
                                 @RequestParam("instructions") String instructions) {
        var req = bloodRequestRepository.findById(id).orElse(null);
        var hosp = hospitalRepository.findById(hospitalId).orElse(null);
        if (req != null && hosp != null) {
            req.setStatus("APPROVED");
            req.setAssignedHospital(hosp);
            req.setInstructions(instructions);
            bloodRequestRepository.save(req);
            
            // Send Email
            String emailBody = String.format("Dear %s,\n\nYour blood request has been APPROVED.\nHospital assigned: %s.\n\nInstructions: %s\n\nTake care!",
                req.getRequester().getName(), hosp.getHospitalName(), instructions);
            emailService.sendEmail(req.getRequester().getUser().getEmail(), "Blood Request Approved", emailBody);
        }
        return "redirect:/admin/requests";
    }

    @PostMapping("/requests/reject")
    public String rejectRequest(@RequestParam("id") Long id, @RequestParam("reason") String reason) {
        var req = bloodRequestRepository.findById(id).orElse(null);
        if (req != null) {
            req.setStatus("REJECTED");
            req.setRejectionReason(reason);
            bloodRequestRepository.save(req);
            
            // Send Email
            String emailBody = String.format("Dear %s,\n\nWe regret to inform you that your blood request has been REJECTED.\nReason: %s\n\nIf you need further assistance, please contact the admin.",
                req.getRequester().getName(), reason);
            emailService.sendEmail(req.getRequester().getUser().getEmail(), "Blood Request Rejected", emailBody);
        }
        return "redirect:/admin/requests";
    }
}
