<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1" />
    <title>Class Details</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
      body {
        font-family: 'Roboto', sans-serif;
         background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        color: #333;
      }
      .navbar {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .container {
        margin-top: 50px;
        margin-bottom: 50px;
      }
      .class-details {
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .class-details h3 {
        color: #007bff; /* Changed from green to blue */
        margin-bottom: 20px;
      }
      .class-details p {
        font-size: 16px;
        margin-bottom: 10px;
      }
      .table-container {
        margin-top: 40px;
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .table thead {
        background-color: #007bff; /* Changed from green to blue */
        color: white;
      }
      .table tbody tr:hover {
        background-color: #f8f9fa;
      }
      footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 15px;
        position: fixed;
        bottom: 0;
        width: 100%;
      }
      footer p {
        margin: 0;
        font-size: 14px;
      }
      footer a {
        color: #007bff; /* Changed from green to blue */
        text-decoration: none;
        font-weight: bold;
      }
      footer a:hover {
        text-decoration: underline;
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
              <a class="nav-link active" href="/instructors/dashboard">Dashboard</a>
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
        <h3 class="text-center">Fitness Class Details</h3>
        <p><strong>Title:</strong> ${fitnessClass.title}</p>
        <p><strong>Description:</strong> ${fitnessClass.description}</p>
        <p><strong>Price:</strong> ${fitnessClass.price} USD</p>
        <p><strong>Day of the Week:</strong> ${fitnessClass.dayOfWeek}</p>
        <p><strong>Time:</strong> ${fitnessClass.time}</p>
        <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
        <p><strong>Max Students:</strong> ${fitnessClass.maxStudents}</p>
        <p><strong>Enrolled Students:</strong> ${fitnessClass.students.size()}</p>
      </div>

      <!-- Table of Enrolled Students -->
      <div class="table-container">
        <h4 class="text-center text-primary">Students Enrolled in This Class</h4> <!-- Changed to blue -->
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Email</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="student" items="${fitnessClass.students}">
              <tr>
                <td>${student.firstName}</td>
                <td>${student.lastName}</td>
                <td>${student.email}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Footer -->
    <footer>
      <p>&copy; 2024 Fitness App | All rights reserved</p>
      <p><a href="/contact">Contact Us</a> | <a href="/terms">Terms of Service</a></p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>


