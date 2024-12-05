<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Class Details</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <style>
      body {
        font-family: 'Roboto';
        background-image: url'https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg'(); /* Add the path to your background image */
        background-size: cover;
        background-position: center;
        background-attachment: fixed; /* Keeps the background fixed while scrolling */
      }
      .container {
        margin-top: 30px;
      }
      .class-details {
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 30px;
      }
      .table-container {
        margin-top: 40px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 20px;
      }
    </style>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Fitness App</a>
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

    <!-- Class Details -->
    <div class="container">
      <div class="class-details">
        <h3 class="text-center text-success">Class Details</h3>
        <p><strong>Title:</strong> ${fitnessClass.title}</p>
        <p><strong>Description:</strong> ${fitnessClass.description}</p>
        <p><strong>Price:</strong> ${fitnessClass.price} USD</p>
        <p><strong>Day of the Week:</strong> ${fitnessClass.dayOfWeek}</p>
        <p><strong>Time:</strong> ${fitnessClass.time}</p>
        <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
        <p><strong>Max Students:</strong> ${fitnessClass.maxStudents}</p>
        <p><strong>Enrolled Students:</strong> ${fitnessClass.enrolledStudents.size()}</p>
      </div>

      <!-- Table of Enrolled Students -->
      <div class="table-container">
        <h4 class="text-center text-success">Students Enrolled in This Class</h4>
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Email</th> <!-- Added email column -->
            </tr>
          </thead>
          <tbody>
            <c:forEach var="student" items="${fitnessClass.enrolledStudents}">
              <tr>
                <td>${student.firstName}</td>
                <td>${student.lastName}</td>
                <td>${student.email}</td> <!-- Display student email -->
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-3 mt-5">
      <p>&copy; 2024 Fitness App | All rights reserved</p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>