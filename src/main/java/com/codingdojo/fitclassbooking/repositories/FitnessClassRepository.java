package com.codingdojo.fitclassbooking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.fitclassbooking.models.FitnessClass;

@Repository
public interface FitnessClassRepository extends CrudRepository<FitnessClass, Long> {

}
