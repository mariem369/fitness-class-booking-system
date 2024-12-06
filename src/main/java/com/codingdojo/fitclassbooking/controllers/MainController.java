package com.codingdojo.fitclassbooking.controllers;

import java.time.DayOfWeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.fitclassbooking.models.FitnessClass;
import com.codingdojo.fitclassbooking.models.User;
import com.codingdojo.fitclassbooking.models.Venue;
import com.codingdojo.fitclassbooking.services.FitnessClassService;
import com.codingdojo.fitclassbooking.services.VenueService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
    private FitnessClassService fitnessClassService;
	@Autowired
    private VenueService venueService;
	
	@GetMapping("/addClass")
	String addClass(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null ) {
    		return "redirect:/";
    	}
		User.Role role = (User.Role) session.getAttribute("role");
    	if (role != User.Role.INSTRUCTOR) {
    		return "redirect:/";
    	}
		model.addAttribute("fitnessClass", new FitnessClass());
		model.addAttribute("venue", new Venue());
		model.addAttribute("venues", venueService.allVenues());
		model.addAttribute("days", DayOfWeek.values());
		return "addClass.jsp";
	}
	
	@PostMapping("/createVenue")
	String createVenue(@Valid@ModelAttribute("venue") Venue venue, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("fitnessClass", new FitnessClass());
			model.addAttribute("venues", venueService.allVenues());
			model.addAttribute("days", DayOfWeek.values());
    		return "addClass.jsp";
    	} else {
    		venueService.createVenue(venue);
    		return "redirect:/addClass";
    	}
	}
	
	@PostMapping("/createFitnessClass")
	String createFitnessClass(@Valid@ModelAttribute("fitnessClass") FitnessClass fitnessClass,
			BindingResult result, Model model, @RequestParam("image") MultipartFile file) {
		
		fitnessClassService.createFitnessClass(fitnessClass, result, file);
		if(result.hasErrors()) {
			model.addAttribute("venue", new Venue());
			model.addAttribute("venues", venueService.allVenues());
			model.addAttribute("days", DayOfWeek.values());
            return "addClass.jsp";
        }
		
		return "redirect:/instructors/dashboard";
	}
	
	@DeleteMapping("/fitnessClasses/{id}/delete")
    public String removeFitnessClass(@PathVariable("id") Long id) {
		FitnessClass fitnessClass = fitnessClassService.findFitnessClass(id);
		for (User student : fitnessClass.getStudents()) {
	        student.getFitnessClasses().remove(fitnessClass);
	    }
    	fitnessClassService.deleteFitnessClass(id);
    	return "redirect:/instructors/dashboard";
    }
	
	 @PostMapping("/fitnessClasses/{id}/edit")
	    public String editFitnessClass(@PathVariable("id") Long id, Model model, HttpSession session) {
	    	if (session.getAttribute("userId") == null ) {
	    		return "redirect:/";
	    	}
	    	User.Role role = (User.Role) session.getAttribute("role");
	    	if (role != User.Role.INSTRUCTOR) {
	    		return "redirect:/";
	    	}
	    	model.addAttribute("fitnessClass", fitnessClassService.findFitnessClass(id));
	    	model.addAttribute("venues", venueService.allVenues());
			model.addAttribute("days", DayOfWeek.values());
	    	return "editClass.jsp";
	    }
	    
	    @PutMapping("/fitnessClasses/update/{id}")
	    public String updateFitnessClass(@Valid @ModelAttribute FitnessClass fitnessClass,
	    	BindingResult result, Model model, @RequestParam("image") MultipartFile file) {
	    	fitnessClassService.updateFitnessClass(fitnessClass, result, file);
			if(result.hasErrors()) {
				model.addAttribute("venues", venueService.allVenues());
				model.addAttribute("days", DayOfWeek.values());
	            return "editClass.jsp";
	        }
			
			return "redirect:/instructors/dashboard";
	    }
	    
	    @GetMapping("/fitnessClasses/{id}/details")
	    public String showDetails(@PathVariable("id") Long id, Model model, HttpSession session) {
	    	if (session.getAttribute("userId") == null ) {
	    		return "redirect:/";
	    	}
	    	User.Role role = (User.Role) session.getAttribute("role");
	    	if (role != User.Role.INSTRUCTOR) {
	    		return "redirect:/";
	    	}
	    	model.addAttribute("fitnessClass", fitnessClassService.findFitnessClass(id));
	    	return "detailClass.jsp";
	    }
}