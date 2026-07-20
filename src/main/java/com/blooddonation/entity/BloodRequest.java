package com.blooddonation.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "blood_requests")
public class BloodRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "requester_id", nullable = false)
    private Requester requester;

    @ManyToOne
    @JoinColumn(name = "blood_group_id", nullable = false)
    private BloodGroup bloodGroup;

    @ManyToOne
    @JoinColumn(name = "hospital_id")
    private Hospital assignedHospital;

    @Column(name = "units_required", nullable = false)
    private Integer unitsRequired;

    @Column(columnDefinition = "TEXT")
    private String reason;

    @Column(name = "patient_name", nullable = false)
    private String patientName;

    @Column(name = "patient_age")
    private Integer patientAge;

    @Column(name = "hospital_preference")
    private String hospitalPreference;

    @Column(name = "medical_report_upload")
    private String medicalReportUpload;

    @Column(name = "emergency_contact")
    private String emergencyContact;

    @Column(name = "required_date")
    private LocalDate requiredDate;

    private String status; // PENDING, APPROVED, REJECTED, COMPLETED

    @Column(name = "rejection_reason", columnDefinition = "TEXT")
    private String rejectionReason;

    @Column(name = "instructions", columnDefinition = "TEXT")
    private String instructions;
    
    @Column(name = "units_delivered")
    private Integer unitsDelivered;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    // Getters and Setters
    
    public BloodRequest() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Requester getRequester() {
        return requester;
    }

    public void setRequester(Requester requester) {
        this.requester = requester;
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

    public Integer getUnitsRequired() {
        return unitsRequired;
    }

    public void setUnitsRequired(Integer unitsRequired) {
        this.unitsRequired = unitsRequired;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Integer getPatientAge() {
        return patientAge;
    }

    public void setPatientAge(Integer patientAge) {
        this.patientAge = patientAge;
    }

    public String getHospitalPreference() {
        return hospitalPreference;
    }

    public void setHospitalPreference(String hospitalPreference) {
        this.hospitalPreference = hospitalPreference;
    }

    public String getMedicalReportUpload() {
        return medicalReportUpload;
    }

    public void setMedicalReportUpload(String medicalReportUpload) {
        this.medicalReportUpload = medicalReportUpload;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public LocalDate getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(LocalDate requiredDate) {
        this.requiredDate = requiredDate;
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

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public Integer getUnitsDelivered() {
        return unitsDelivered;
    }

    public void setUnitsDelivered(Integer unitsDelivered) {
        this.unitsDelivered = unitsDelivered;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
