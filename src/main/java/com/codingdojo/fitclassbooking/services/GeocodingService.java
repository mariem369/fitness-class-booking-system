package com.codingdojo.fitclassbooking.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GeocodingService {

    @Value("${google.api.key}")
    private String apiKey;

    private static final String GEOCODING_API_URL = "https://maps.googleapis.com/maps/api/geocode/json";

    public Map<String, Double> getCoordinates(String address) {
        RestTemplate restTemplate = new RestTemplate();
        Map<String, Double> coordinates = new HashMap<>();

        try {
            // Build the API URL
            String url = String.format("%s?address=%s&key=%s", GEOCODING_API_URL, address.replace(" ", "+"), apiKey);

            // Send the GET request to the API
            String response = restTemplate.getForObject(url, String.class);

            // Parse the JSON response
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(response);

            JsonNode results = root.path("results");
            if (results.isArray() && results.size() > 0) {
                JsonNode location = results.get(0).path("geometry").path("location");
                double latitude = location.path("lat").asDouble();
                double longitude = location.path("lng").asDouble();

                // Populate the coordinates map
                coordinates.put("latitude", latitude);
                coordinates.put("longitude", longitude);
            } else {
                throw new Exception("No results found for the given address.");
            }
        } catch (Exception e) {
            System.err.println("Error retrieving geocoding data: " + e.getMessage());
        }

        return coordinates;
    }
}
