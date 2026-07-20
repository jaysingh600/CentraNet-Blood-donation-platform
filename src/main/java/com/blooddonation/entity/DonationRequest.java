package com.blooddonation.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "donation_requests")
public class DonationRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "donor_id", nullable = false)
    private Donor donor;

    @ManyToOne
    @JoinColumn(name = "blood_group_id", nullable = false)
    private BloodGroup bloodGroup;

    @ManyToOne
    @JoinColumn(name = "hospital_id")
    private Hospital assignedHospital;

    @Column(name = "available_date")
    private LocalDate availableDate;

    @Column(name = "preferred_hospital")
    private String preferredHospital;

    @Column(name = "health_status", columnDefinition = "TEXT")
    private String healthStatus;

    @Column(name = "medical_remarks", columnDefinition = "TEXT")
    private String medicalRemarks;

    @Column(name = "units_expected")
    private Integer unitsExpected;

    @Column(name = "emergency_contact")
    private String emergencyContact;

    private String status; // PENDING, APPROVED, REJECTED, COMPLETED

    @Column(name = "rejection_reason", columnDefinition = "TEXT")
    private String rejectionReason;

    @Column(name = "reporting_date")
    private LocalDate reportingDate;

    @Column(name = "reporting_time")
    private String reportingTime;

    @Column(name = "instructions", columnDefinition = "TEXT")
    private String instructions;
    
    @Column(name = "units_collected")
    private Integer unitsCollected;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    // Getters and Setters
    
    public DonationRequest() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Donor getDonor() {
        return donor;
    }

    public void setDonor(Donor donor) {
        this.donor = donor;
    }

    public BloodGroup getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(BloodGroup bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public Hospital getAssignedHospital() {
        return assignedHospital;
    }

    public void setAssignedHospital(Hospital assignedHospital) {
        this.assignedHospital = assignedHospital;
    }

    public LocalDate getAvailableDate() {
        return availableDate;
    }

    public void setAvailableDate(LocalDate availableDate) {
        this.availableDate = availableDate;
    }

    public String getPreferredHospital() {
        return preferredHospital;
    }

    public void setPreferredHospital(String preferredHospital) {
        this.preferredHospital = preferredHospital;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public String getMedicalRemarks() {
        return medicalRemarks;
    }

    public void setMedicalRemarks(String medicalRemarks) {
        this.medicalRemarks = medicalRemarks;
    }

    public Integer getUnitsExpected() {
        return unitsExpected;
    }

    public void setUnitsExpected(Integer unitsExpected) {
        this.unitsExpected = unitsExpected;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRejectionReason() {
        return rejectionReason;
    }

    public void setRejectionReason(String rejectionReason) {
        this.rejectionReason = rejectionReason;
    }

    public LocalDate getReportingDate() {
        return reportingDate;
    }

    public void setReportingDate(LocalDate reportingDate) {
        this.reportingDate = reportingDate;
    }

    public String getReportingTime() {
        return reportingTime;
    }

    public void setReportingTime(String reportingTime) {
        this.reportingTime = reportingTime;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public Integer getUnitsCollected() {
        return unitsCollected;
    }

    public void setUnitsCollected(Integer unitsCollected) {
        this.unitsCollected = unitsCollected;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
