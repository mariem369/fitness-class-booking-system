package com.codingdojo.fitclassbooking.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.fitclassbooking.models.Venue;

@Repository
public interface VenueRepository extends CrudRepository<Venue,Long> {
	
	List<Venue> findAll();
}
