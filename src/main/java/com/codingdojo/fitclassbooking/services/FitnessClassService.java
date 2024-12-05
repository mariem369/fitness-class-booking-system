package com.codingdojo.fitclassbooking.services;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.fitclassbooking.models.FitnessClass;
import com.codingdojo.fitclassbooking.repositories.FitnessClassRepository;


@Service
public class FitnessClassService {
	
	@Autowired
	private FitnessClassRepository fitnessClassRepository;
	
	@Value("${upload.directory}")
    private String storagePath;
	
	public FitnessClass createFitnessClass(FitnessClass fitnessClass,
			BindingResult result, MultipartFile file) {
		
		
            String originalFilename = file.getOriginalFilename();
            if (originalFilename == null || !originalFilename.contains(".")) {
            	result.rejectValue("imageName", "Invalid", "Invalid file");
            }

            String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();

            if (!extension.matches("(?i)(jpg|jpeg|png|gif)")) {
            	result.rejectValue("imageName", "Type", "file must be an image");
            }

            String uniqueFileName = UUID.randomUUID() + "_" + originalFilename;
            try {
                // Ensure the directory exists
                File storageDirectory = new File(storagePath);
                if (!storageDirectory.exists() && !storageDirectory.mkdirs()) {
                    throw new IOException("Failed to create storage directory: " + storagePath);
                }

                // Save the file
                File destinationFile = new File(storageDirectory, uniqueFileName);
                file.transferTo(destinationFile);

            } catch (IOException e) {
                result.rejectValue("imageName", "IOException", "Failed to store the file");
                e.printStackTrace(); // Log the exception for debugging
                return null;
            }
		
		
            if (result.hasErrors()) {
            	return null;
            }
            fitnessClass.setImageName(uniqueFileName);
            return fitnessClassRepository.save(fitnessClass);
	 }
	
}
