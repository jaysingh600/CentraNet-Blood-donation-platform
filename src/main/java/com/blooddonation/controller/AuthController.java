package com.blooddonation.controller;

import com.blooddonation.dto.UserRegistrationDto;
import com.blooddonation.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("userDto", new UserRegistrationDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUserAccount(@Valid @ModelAttribute("userDto") UserRegistrationDto userDto,
                                      BindingResult result,
                                      Model model) {
        if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
            result.rejectValue("confirmPassword", null, "Passwords do not match");
        }
        
        if (userService.emailExists(userDto.getEmail())) {
            result.rejectValue("email", null, "There is already an account registered with that email");
        }
        
        if ("HOSPITAL".equals(userDto.getRole()) && userService.hospitalRegExists(userDto.getRegistrationNumber())) {
            result.rejectValue("registrationNumber", null, "Registration number already exists");
        }

        if (result.hasErrors()) {
            return "register";
        }

        userService.registerNewUserAccount(userDto);
        return "redirect:/login?success";
    }
}
