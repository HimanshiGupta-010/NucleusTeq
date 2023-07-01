//Controllers are used to handle incoming HTTP requests and provides responses to the clients
package com.InventoryManagement.Controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.InventoryManagement.Payloads.Userdatatransfer;
import com.InventoryManagement.Services.EmailService;
import com.InventoryManagement.Services.UserService;
import com.InventoryManagement.entities.User;
import com.InventoryManagement.repository.UserRepo;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class UserController {
   
	@Autowired
	private  PasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	@Autowired
	private  UserRepo userRepo;
	@Autowired
	private final EmailService emailService;
	
	public UserController(UserRepo userRepo,EmailService emailService,PasswordEncoder passwordEncoder)
	{
		this.userRepo=userRepo;
		 this.passwordEncoder = passwordEncoder;
		 this.emailService = emailService;
	}
	
	//Register Method
	@PostMapping("/Register")
	public ResponseEntity<Userdatatransfer> createUser(@Validated @RequestBody Userdatatransfer userDto){
		Userdatatransfer createdUserDto=this.userService.CreateUser(userDto);
		// Generating verification and saving that token in database
        String verificationToken = UUID.randomUUID().toString();
        User user = userRepo.findByEmail(createdUserDto.getEmail());
        user.setVerificationToken(verificationToken);
        userRepo.save(user);

        String verificationLink = generateVerificationLink(createdUserDto.getEmail(), verificationToken);
        emailService.sendVerificationEmail(createdUserDto.getEmail(), verificationLink);
		return new ResponseEntity<>(createdUserDto,HttpStatus.CREATED);
	}
	
	private String generateVerificationLink(String email, String token) {
        String baseUrl = "http://localhost:9090"; // Base URL of your application
        String verifyEndpoint = "/verify"; // Verification end point

        return baseUrl + verifyEndpoint + "?email=" + email + "&token=" + token;
    }
	
	@PutMapping("/{userId}")
	public ResponseEntity<Userdatatransfer>updateUser(@RequestBody Userdatatransfer userDto,@PathVariable("userId") Integer Id){
	  Userdatatransfer updatedUser=this.userService.updateUser(userDto, Id);
	  return ResponseEntity.ok(updatedUser);
	}
	
	@DeleteMapping("/deleteuser/{userId}")
	public ResponseEntity<?>deleteUser(@PathVariable("userId")Integer Id)
	{
		this.userService.deleteUser(Id);
		return new ResponseEntity<>(Map.of("message","Information deleted Successfully."),HttpStatus.OK);
	}
	
	@GetMapping("/")
	public ResponseEntity<List<Userdatatransfer>> getAll()
	{
		return ResponseEntity.ok(this.userService.getAllUsers());
	}
	
	@GetMapping("/{userId}")
	public ResponseEntity<Userdatatransfer> getUser(@PathVariable("userId")Integer Id)
	{
		return ResponseEntity.ok(this.userService.getUserById(Id));
	}

	@PostMapping(value = "/login", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Userdatatransfer> log(@Validated @RequestBody Map<String, String> request,
	                                            HttpServletResponse response) throws IOException {
	    String email = request.get("email");
	    String password = request.get("password");
	    String accountType = request.get("accountType");
	    User user = userRepo.findByEmail(email);

	    if (user != null) {
	        boolean verify = passwordEncoder.matches(password, user.getPassword());
	        if (verify && user.getAccountType().equals(accountType)) {
	            if (user.getVerificationToken() == null || user.getVerificationToken().isEmpty()) {
	                // Token is empty, perform login
	                if (user.getAccountType().equals("admin") || user.getAccountType().equals("employee")) {
	                    // Login successful
	                    String message = "Login successful. Welcome, " + user.getName() + "!";
	                    Userdatatransfer userData = new Userdatatransfer();
	                    userData.setMessage(message);
	                    userData.setAccountType(user.getAccountType());
	                    userData.setAddress(user.getAddress());
	                    userData.setEmail(user.getEmail());
	                    userData.setId(user.getId());
	                    userData.setName(user.getName());
	                    userData.setPassword(user.getPassword());
	                    userData.setPhone(user.getPhone());
	                    return ResponseEntity.ok(userData);
	                }
	            } else {
	                // Token exists, show error message
	                Userdatatransfer errorData = new Userdatatransfer();
	                errorData.setMessage("Invalid login. Please verify your email first.");
	                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorData);
	            }
	        }
	    }

	    Userdatatransfer errorData = new Userdatatransfer();
	    errorData.setMessage("Invalid Credentials");
	    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorData);
	}
}