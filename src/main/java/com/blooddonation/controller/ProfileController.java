package com.blooddonation.controller;

import com.blooddonation.entity.User;
import com.blooddonation.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
public class ProfileController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/profile")
    public String showProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(auth.getName()).orElse(null);
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/profile/upload-image")
    public String uploadProfileImage(@RequestParam("image") MultipartFile multipartFile) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(auth.getName()).orElse(null);

        if (user != null && !multipartFile.isEmpty()) {
            try {
                String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
                // Create a unique filename
                String uniqueFileName = user.getId() + "_" + fileName;
                
                String uploadDir = "./uploads/profile-images/";
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                Path filePath = uploadPath.resolve(uniqueFileName);
                Files.copy(multipartFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                
                user.setProfileImage("/uploads/profile-images/" + uniqueFileName);
                userRepository.save(user);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return "redirect:/profile?success";
    }
}
