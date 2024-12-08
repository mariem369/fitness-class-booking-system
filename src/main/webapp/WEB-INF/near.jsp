<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Find Nearest Venue</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</head>
<body>
    <h1>Find Nearest Venue</h1>
    <div id="map" style="height: 400px; width: 100%;"></div>
    <p id="nearestVenue"></p>

    <script>
        // Step 1: Get the user's current geolocation
        function getUserLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            const userLat = position.coords.latitude;
            const userLng = position.coords.longitude;

            // Show user location on map
            const userLocation = [userLat, userLng];
            const map = L.map('map').setView(userLocation, 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19
            }).addTo(map);

            L.marker(userLocation).addTo(map)
                .bindPopup("You are here")
                .openPopup();

            // Step 2: Fetch venues and calculate the nearest venue
            fetchVenues(userLat, userLng);
        }

        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("Location information is unavailable.");
                    break;
                case error.TIMEOUT:
                    alert("The request to get user location timed out.");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.");
                    break;
            }
        }

        // Step 2: Fetch venues from the server or database
        function fetchVenues(userLat, userLng) {
            // Replace this with your server endpoint that provides venues data
            const venues = [
                { id: 1, name: 'Venue A', lat: 33.8900, lng: 9.5370, address: '123 Venue A St.' },
                { id: 2, name: 'Venue B', lat: 33.8905, lng: 9.5380, address: '456 Venue B St.' },
                { id: 3, name: 'Venue C', lat: 33.8895, lng: 9.5390, address: '789 Venue C St.' }
            ];

            let nearestVenue = null;
            let shortestDistance = Infinity;

            // Step 3: Calculate distance between user and each venue
            venues.forEach(venue => {
                const venueLat = venue.lat;
                const venueLng = venue.lng;
                const distance = calculateDistance(userLat, userLng, venueLat, venueLng);

                if (distance < shortestDistance) {
                    shortestDistance = distance;
                    nearestVenue = venue;
                }
            });

            // Step 4: Show the nearest venue
            if (nearestVenue) {
                document.getElementById('nearestVenue').innerHTML = `Nearest Venue: ${nearestVenue.name}, Address: ${nearestVenue.address}`;
                L.marker([nearestVenue.lat, nearestVenue.lng]).addTo(map)
                    .bindPopup(nearestVenue.name)
                    .openPopup();
            }
        }

        // Function to calculate the distance between two lat/lng points in kilometers
        function calculateDistance(lat1, lng1, lat2, lng2) {
            const R = 6371; // Radius of the Earth in km
            const dLat = (lat2 - lat1) * Math.PI / 180;
            const dLng = (lng2 - lng1) * Math.PI / 180;
            const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                      Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                      Math.sin(dLng / 2) * Math.sin(dLng / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            const distance = R * c; // Distance in km
            return distance;
        }

        // Get user location when the page loads
        getUserLocation();
    </script>
</body>
</html>
