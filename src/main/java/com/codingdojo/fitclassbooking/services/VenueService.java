package com.codingdojo.fitclassbooking.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.fitclassbooking.models.Venue;
import com.codingdojo.fitclassbooking.repositories.VenueRepository;

@Service
public class VenueService {
	@Autowired
	  private VenueRepository venueRepository;
	 
	 public List<Venue> allVenues() {
	     return venueRepository.findAll();
	 }
	 

	 public Venue createVenue(Venue venue) {
	     return venueRepository.save(venue);
	 }
}
