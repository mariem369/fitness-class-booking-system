<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Add Class and Add Venue</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	    <style>
	        body {
	            background-color: #f8f9fa;
	        }
	        .form-container {
	            max-width: 800px;
	            margin: 30px auto;
	            background: white;
	            padding: 20px;
	            border-radius: 10px;
	            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	        }
	        .section-title {
	            margin-top: 30px;
	        }
	    </style>
	    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places&callback=initAutocomplete" async defer></script>
	</head>
	<body>
	    <!-- Navbar -->
	    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	        <div class="container-fluid">
	            <a class="navbar-brand" href="/dashboard">Instructor Dashboard</a>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
	                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav ms-auto">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/logout">Logout</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>

	    <!-- Main Content -->
	    <div class="container">
	        <!-- Add Class Form -->
	        <div class="form-container">
	            <h2>Add Class</h2>
	            <form action="/add-class" method="POST">
					<div class="mb-3">
					<label for="image" class="form-label">Image</label>
					  <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
					   </div>
	                <div class="mb-3">
	                    <label for="title" class="form-label">Title</label>
	                    <input type="text" class="form-control" id="title" name="title" required>
	                </div>
	                <div class="mb-3">
	                    <label for="description" class="form-label">Description</label>
	                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
	                </div>
	                <div class="mb-3">
	                    <label for="price" class="form-label">Price</label>
	                    <input type="number" class="form-control" id="price" name="price" required>
	                </div>
	                <div class="mb-3">
	                    <label for="day" class="form-label">Day of the Week</label>
	                    <select class="form-select" id="day" name="day" required>
	                        <option value="">Select Day</option>
	                        <option value="Monday">Monday</option>
	                        <option value="Tuesday">Tuesday</option>
	                        <option value="Wednesday">Wednesday</option>
	                        <option value="Thursday">Thursday</option>
	                        <option value="Friday">Friday</option>
	                        <option value="Saturday">Saturday</option>
	                        <option value="Sunday">Sunday</option>
	                    </select>
	                </div>
	                <div class="mb-3">
	                    <label for="time" class="form-label">Time</label>
	                    <input type="time" class="form-control" id="time" name="time" required>
	                </div>
	                <!-- Venue Select Dropdown -->
	                <div class="mb-3">
	                    <label for="venue" class="form-label">Select Venue</label>
	                    <select class="form-select" id="venue" name="venue" required>
	                        <option value="">Select Venue</option>
	   
	                        <option value="1">Venue 1</option>
	                        <option value="2">Venue 2</option>
	                        <option value="3">Venue 3</option>
	                    </select>
	                </div>
	                <div class="mb-3">
	                    <label for="maxNumber" class="form-label">Maximum Number of Students</label>
	                    <input type="number" class="form-control" id="maxNumber" name="maxNumber" min="1" required>
	                </div>
	                
	                <button type="submit" class="btn btn-primary">Add Class</button>
	            </form>
	        </div>

	        <!-- Add Venue Form -->
	        <div class="form-container">
	            <h2 class="section-title">Add Venue</h2>
	            <form action="/add-venue" method="POST">
	                <div class="mb-3">
	                    <label for="Name" class="form-label">Name</label>
	                    <input type="text" class="form-control" id="Name" name="Name" required>
	                </div>
	                <div class="mb-3">
	                    <label for="Address" class="form-label">Address</label>
	                    <input type="text" class="form-control" id="Address" name="Address" placeholder="Enter address" required>
	                </div>
	                
	                <button type="submit" class="btn btn-primary">Add Venue</button>
	            </form>
	        </div>
	    </div>

	    <script>
	        let autocomplete;

	        function initAutocomplete() {
	            const input = document.getElementById('Address');
	            autocomplete = new google.maps.places.Autocomplete(input, {
	                types: ['geocode'],
	                componentRestrictions: { country: 'US' },  // Optional, can be changed
	            });
	        }
	    </script>

	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
	</html>