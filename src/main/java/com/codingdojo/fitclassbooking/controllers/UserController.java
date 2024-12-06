package com.codingdojo.fitclassbooking.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.fitclassbooking.models.LoginUser;
import com.codingdojo.fitclassbooking.models.User;
import com.codingdojo.fitclassbooking.services.FitnessClassService;
import com.codingdojo.fitclassbooking.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	 @Autowired
	    private UserService userService;
	 @Autowired
	    private FitnessClassService fitnessClassService;
	 
	 @GetMapping("/")
	    public String index(Model model) {
	    
	        // Bind empty User and LoginUser objects to the JSP
	        // to capture the form input
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        model.addAttribute("roles", User.Role.values());
	        return "index.jsp";
	    }
	    
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        
	        User created = userService.register(newUser, result);
	        
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new LoginUser());
	            model.addAttribute("roles", User.Role.values());
	            return "index.jsp";
	        }
	        
	        session.setAttribute("userId", created.getId());
	        session.setAttribute("firstName", created.getFirstName());
	        session.setAttribute("role", created.getRole());
	    
	        if (created.getRole() == User.Role.INSTRUCTOR) {
	        	return "redirect:/instructors/dashboard";
	        } else {
	        	return "redirect:/fitnessClasses";
	        }
	    }
	    
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        
	        User user = userService.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            model.addAttribute("roles", User.Role.values());
	            return "index.jsp";
	        }
	    
	        session.setAttribute("userId", user.getId());
	        session.setAttribute("firstName", user.getFirstName());
	        session.setAttribute("role", user.getRole());
	        if (user.getRole() == User.Role.INSTRUCTOR) {
	        	return "redirect:/instructors/dashboard";
	        } else {
	        	return "redirect:/fitnessClasses";
	        }
	    }
	    
	    @GetMapping("/instructors/dashboard")
	    public String home(HttpSession session, Model model) {
	    	if (session.getAttribute("userId") == null ) {
	    		return "redirect:/";
	    	}
	    	User.Role role = (User.Role) session.getAttribute("role");
	    	if (role != User.Role.INSTRUCTOR) {
	    		return "redirect:/";
	    	}
	    	Long userId = (Long) session.getAttribute("userId");
	    	
	    	model.addAttribute("myClasses", fitnessClassService.getFitnessClassesByInstructor(userId));
	    	return "dashboard.jsp";
	    }
	    
	    @GetMapping("/fitnessClasses")
	    public String fitnessClasses(HttpSession session, Model model) {
	    	return "fitnessClasses.jsp";
	    }
	    
	    @GetMapping("/logout")
	    String logout(HttpSession session) {
	    	session.invalidate();
	    	return "redirect:/";
	    }
	    
}
