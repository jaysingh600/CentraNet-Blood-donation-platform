package com.blooddonation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.blooddonation.entity.User;
import com.blooddonation.entity.BloodGroup;
import com.blooddonation.repository.UserRepository;
import com.blooddonation.repository.BloodGroupRepository;
import java.util.Arrays;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.blooddonation.entity")
@EnableJpaRepositories(basePackages = "com.blooddonation.repository")
public class BloodDonationApplication {

	public static void main(String[] args) {
		SpringApplication.run(BloodDonationApplication.class, args);
	}

    @Bean
    public CommandLineRunner dataSeeder(UserRepository userRepository, 
                                        BloodGroupRepository bloodGroupRepository,
                                        PasswordEncoder passwordEncoder) {
        return args -> {
            // Seed Blood Groups
            if (bloodGroupRepository.count() == 0) {
                Arrays.asList("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-").forEach(bg -> {
                    BloodGroup group = new BloodGroup();
                    group.setGroupName(bg);
                    bloodGroupRepository.save(group);
                });
            }

            // Seed Admin User
            if (userRepository.findByEmail("admin@blooddrop.com").isEmpty()) {
                User admin = new User();
                admin.setEmail("admin@blooddrop.com");
                admin.setPassword(passwordEncoder.encode("admin123"));
                admin.setRole(com.blooddonation.entity.Role.ROLE_ADMIN);
                admin.setActive(true);
                userRepository.save(admin);
            }
        };
    }
}
