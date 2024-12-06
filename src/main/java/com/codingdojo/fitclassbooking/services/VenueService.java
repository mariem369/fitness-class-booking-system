package com.codingdojo.fitclassbooking.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.fitclassbooking.models.Venue;
import com.codingdojo.fitclassbooking.repositories.VenueRepository;

@Service
public class VenueService {
	@Autowired
	  private VenueRepository venueRepository;
	
	@Autowired
    private GeocodingService geocodingService;
	
	 public List<Venue> allVenues() {
	     return venueRepository.findAll();
	 }
	 

	 public Venue createVenue(Venue venue) {
	        try {
	            Map<String, Double> coordinates = geocodingService.getCoordinates(venue.getAddress());
	            venue.setLatitude(coordinates.get("latitude"));
	            venue.setLongitude(coordinates.get("longitude"));
	        } catch (Exception e) {
	            System.err.println("Error while geocoding venue address: " + e.getMessage());
	            venue.setLatitude(0.0);
	            venue.setLongitude(0.0);
	        }

	        return venueRepository.save(venue);
	    }
}
