package com.blooddonation.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "blood_inventory")
public class BloodInventory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "blood_group_id", nullable = false, unique = true)
    private BloodGroup bloodGroup;

    @Column(name = "available_units", nullable = false)
    private Integer availableUnits = 0;

    // Getters and Setters

    public BloodInventory() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BloodGroup getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(BloodGroup bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public Integer getAvailableUnits() {
        return availableUnits;
    }

    public void setAvailableUnits(Integer availableUnits) {
        this.availableUnits = availableUnits;
    }
}
