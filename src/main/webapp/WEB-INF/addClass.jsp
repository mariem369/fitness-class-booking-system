<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Add Classes And Venues</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
      #map {
        height: 400px;
        width: 100%;
      }

      body {
        font-family: 'Roboto';
        background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg'); /* Replace with your background image URL */
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
      }

      footer {
        background-color: rgba(0, 0, 0, 0.6);
        color: white;
        text-align: center;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
      }

      .container {
        padding-top: 50px;
      }

      .navbar {
        margin-bottom: 20px;
      }

      .form-container {
        background-color: rgba(255, 255, 255, 0.7);
        border-radius: 10px;
        padding: 30px;
        margin: auto;
      }
    </style>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">My App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" href="/dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/logout">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Main content -->
    <div class="container w-75">
      <div class="row">
        <!-- Form for Adding Class -->
        <div class="col-md-6 form-container">
          <h3 class="text-center text-success fw-bold">Add Class</h3>
          <form:form action="/createFitnessClass" method="post" modelAttribute="fitnessClass" enctype="multipart/form-data" class="form">
            <form:input type="hidden" path="instructor" value="${userId}" />
            <div class="mb-3">
              <form:label class="form-label" path="imageName">Image</form:label>
              <input type="file" class="form-control" name="imageName" accept="image/*" />
              <form:errors class="text-danger" path="imageName"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="title">Title</form:label>
              <form:input class="form-control" path="title"/>
              <form:errors class="text-danger" path="title"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="description">Description</form:label>
              <form:textarea class="form-control" path="description"></form:textarea>
              <form:errors class="text-danger" path="description"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="price">Price</form:label>
              <form:input class="form-control" path="price"/>
              <form:errors class="text-danger" path="price"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="dayOfWeek">Day of the week</form:label>
              <form:select class="form-control" path="dayOfWeek">
                <c:forEach var="day" items="${days}">
                  <form:option value="${day}">${day}</form:option>
                </c:forEach>
              </form:select>
              <form:errors class="text-danger" path="dayOfWeek"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="time">Time</form:label>
              <form:input type="time" class="form-control" path="time"/>
              <form:errors class="text-danger" path="time"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="venue">Venue</form:label>
              <form:select class="form-control" path="venue">
                <c:forEach var="v" items="${venues}">
                  <form:option value="${v.getId()}">${v.getName()}</form:option>
                </c:forEach>
              </form:select>
              <form:errors class="text-danger" path="venue"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="maxStudents">Max Number</form:label>
              <form:input type="number" class="form-control" path="maxStudents"/>
              <form:errors class="text-danger" path="maxStudents"/>
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
          </form:form>
        </div>

        <!-- Form for Adding Venue -->
        <div class="col-md-6 form-container">
          <h3 class="text-center text-success fw-bold">Add Venue</h3>
          <form:form action="/createVenue" method="post" modelAttribute="venue" class="form">
            <div class="mb-3">
              <form:label class="form-label" path="name">Venue Name</form:label>
              <form:input class="form-control" path="name"/>
              <form:errors class="text-danger" path="name"/>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="address">Address</form:label>
              <form:input class="form-control" path="address"/>
              <form:errors class="text-danger" path="address"/>
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
          </form:form>
        </div>
      </div>

      <!-- Map Section -->
      <h3 class="text-center mt-4">Map</h3>
      <div id="map"></div>
      <div class="row mt-3">
        <div class="col-md-6">
          <label class="form-label">Latitude</label>
          <input type="text" id="latitude" class="form-control" readonly />
        </div>
        <div class="col-md-6">
          <label class="form-label">Longitude</label>
          <input type="text" id="longitude" class="form-control" readonly />
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer>
      <p>&copy; 2024 Fitness App | All rights reserved</p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
	<script>
	     const defaultLat = '${job.latitude}';
	     const defaultLng = '${job.longitude}';
	     const map = L.map('map').setView([defaultLat, defaultLng], 13);

	     L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	         maxZoom: 19,
	     }).addTo(map);

	     const marker = L.marker([defaultLat, defaultLng], { draggable: true }).addTo(map);

	     marker.on('dragend', function (event) {
	         const position = marker.getLatLng();
	         const lat = position.lat;
	         const lon = position.lng;

	         console.log('Marker Position:', position);
	         console.log('Latitude:', lat);
	         console.log('Longitude:', lon);

	         // Update latitude and longitude 
	         document.getElementById('latitude').value = lat;
	         document.getElementById('longitude').value = lon;

	         const apiUrl = 'https://nominatim.openstreetmap.org/reverse?lat=' + lat + '&lon=' + lon + '&format=json&addressdetails=1';
	         console.log('API URL:', apiUrl);

	         fetch(apiUrl)
	             .then(response => response.json())
	             .then(data => {
	                 if (data && data.address) {
	                     console.log('Full Address Data:', data.address); // Log full data for inspection

	                     const street = data.address.road || 'Street not found';
	                     const city = data.address.city || data.address.town || data.address.village || 'City not found';
	                     const state = data.address.state || 'State not found';
	                     const country = data.address.country || 'Country not found';
	                     const postalCode = data.address.postcode || 'Postal code not found';

	                     const fullAddress = street + ', ' + city + ', ' + state + ', ' + country + ', ' + postalCode;
	                     document.getElementById('address').value = fullAddress;

	                     console.log('Full Address:', fullAddress);
	                 } else {
	                     document.getElementById('address').value = 'No detailed address found for this location.';
	                     console.log('No address data found for these coordinates.');
	                 }
	             })
	             .catch(error => {
	                 console.error('Error fetching address:', error);
	                 document.getElementById('address').value = 'Error fetching address';
	             });
	     });
	   </script>
  </body>
</html>

