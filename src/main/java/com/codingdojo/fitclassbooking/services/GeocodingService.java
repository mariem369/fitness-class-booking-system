package com.codingdojo.fitclassbooking.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GeocodingService {

    private static final String NOMINATIM_API_URL = "https://nominatim.openstreetmap.org/search";

    public Map<String, Double> getCoordinates(String address) {
        RestTemplate restTemplate = new RestTemplate();
        Map<String, Double> coordinates = new HashMap<>();

        try {
            String url = String.format("%s?q=%s&format=json", 
                                        NOMINATIM_API_URL,
                                        address.replace(" ", "+"));

            String response = restTemplate.getForObject(url, String.class);

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(response);

            if (root.isArray() && root.size() > 0) {
                JsonNode firstResult = root.get(0);
                double latitude = firstResult.path("lat").asDouble();
                double longitude = firstResult.path("lon").asDouble();

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