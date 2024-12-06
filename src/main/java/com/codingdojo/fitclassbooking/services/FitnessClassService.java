package com.codingdojo.fitclassbooking.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.fitclassbooking.models.FitnessClass;
import com.codingdojo.fitclassbooking.models.User;
import com.codingdojo.fitclassbooking.repositories.FitnessClassRepository;


@Service
public class FitnessClassService {
	
	@Autowired
	private FitnessClassRepository fitnessClassRepository;
	
	@Autowired
	private PhotoUploadService photoUploadService;
	
	@Value("${upload.directory}")
    private String storagePath;
	
	public FitnessClass createFitnessClass(FitnessClass fitnessClass, BindingResult result, MultipartFile file) {
        String uniqueFileName = photoUploadService.uploadPhoto(file, result, "imageName");
        if (result.hasErrors()) {
            return null;
        }

        fitnessClass.setImageName(uniqueFileName);
        return fitnessClassRepository.save(fitnessClass);
    }
	
	 public List<FitnessClass> getFitnessClassesByInstructor(Long instructorId) {
	        return fitnessClassRepository.findByInstructorId(instructorId);
	 }
	 
	 public void deleteFitnessClass(Long id) {
		fitnessClassRepository.deleteById(id);
	}
	 
	 public FitnessClass findFitnessClass(Long id) {
	     Optional<FitnessClass> optionalFitnessClass = fitnessClassRepository.findById(id);
	     if(optionalFitnessClass.isPresent()) {
	         return optionalFitnessClass.get();
	     } else {
	         return null;
	     }
	 }
	 
	 public FitnessClass updateFitnessClass(FitnessClass fitnessClass, BindingResult result, MultipartFile file) {
	        if (!file.isEmpty()) {
	            String uniqueFileName = photoUploadService.uploadPhoto(file, result, "imageName");
	            if (result.hasErrors()) {
	                return null;
	            }
	            fitnessClass.setImageName(uniqueFileName);
	        }
	        if(result.hasErrors()) {
	        	return null;
	        }
	        return fitnessClassRepository.save(fitnessClass);
	    }
	 
	 public List<FitnessClass> allFitnessClasses() {
	     return fitnessClassRepository.findAll();
	 }
	 
	 public FitnessClass updateFitnessClass(FitnessClass fitnessClass) {
	 	   return fitnessClassRepository.save(fitnessClass);
	 	}
	
	 public void bookFitnessClass(FitnessClass fitnessClass, User user) {
		 fitnessClass.getStudents().add(user);
	     fitnessClassRepository.save(fitnessClass);
	 }
	 
	 public void cancelFitnessClass(FitnessClass fitnessClass, User user) {
		 fitnessClass.getStudents().remove(user);
	     fitnessClassRepository.save(fitnessClass);
	 }
}
