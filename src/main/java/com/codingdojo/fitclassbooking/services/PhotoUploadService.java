package com.codingdojo.fitclassbooking.services;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PhotoUploadService {

    @Value("${upload.directory}")
    private String storagePath;

    public String uploadPhoto(MultipartFile file, BindingResult result, String fieldName) {
        if (file.isEmpty()) {
            result.rejectValue(fieldName, "Empty", "No file was uploaded.");
            return null;
        }

        String originalFilename = file.getOriginalFilename();
        if (originalFilename == null || !originalFilename.contains(".")) {
            result.rejectValue(fieldName, "Invalid", "Invalid file format.");
            return null;
        }

        String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
        if (!extension.matches("(?i)(jpg|jpeg|png|gif)")) {
            result.rejectValue(fieldName, "Type", "File must be an image.");
            return null;
        }

        String uniqueFileName = UUID.randomUUID() + "_" + originalFilename;

        try {
            File storageDirectory = new File(storagePath);
            if (!storageDirectory.exists() && !storageDirectory.mkdirs()) {
                throw new IOException("Failed to create storage directory: " + storagePath);
            }

            File destinationFile = new File(storageDirectory, uniqueFileName);
            file.transferTo(destinationFile);
            return uniqueFileName;
        } catch (IOException e) {
            result.rejectValue(fieldName, "IOException", "Failed to store the file.");
            e.printStackTrace();
            return null;
        }
    }
}
