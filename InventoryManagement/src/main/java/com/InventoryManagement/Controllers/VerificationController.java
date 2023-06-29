package com.InventoryManagement.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.InventoryManagement.repository.UserRepo;

@Controller
public class VerificationController {
    
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/verify")
    public String verifyUser(@RequestParam("email") String email, @RequestParam("token") String token) {
        com.InventoryManagement.entities.User user = userRepo.findByEmailAndVerificationToken(email, token);

        if (user != null) {
            // Delete the verification token from the user entity
            user.setVerificationToken(null);
            userRepo.save(user);

            // Redirect to the login page 
            return "redirect:http://localhost:3000/login?verified=true";
        } else {
            return "redirect:http://localhost:3000/login?verified=false";
        }
    }

}