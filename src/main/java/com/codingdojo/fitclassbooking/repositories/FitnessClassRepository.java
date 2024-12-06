package com.codingdojo.fitclassbooking.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.fitclassbooking.models.FitnessClass;

@Repository
public interface FitnessClassRepository extends CrudRepository<FitnessClass, Long> {
	List<FitnessClass> findByInstructorId(Long instructorId);
	
	List<FitnessClass> findAll();
}
