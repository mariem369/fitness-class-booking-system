<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Details</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .class-detail-container {
            margin-top: 30px;
        }
        .class-thumbnail {
            width: 300px;
            height: 300px;
            border-radius: 8px;
            margin-right: 15px;
        }
        .class-details {
            margin-top: 20px;
        }
        .book-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Class Details</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container class-detail-container">
        <h2>Class Details</h2>

        <!-- Display the details of the selected class -->
        <div class="row">
            <div class="col-md-4">
                <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" 
                     class="class-thumbnail" alt="Class Image" />
            </div>
            <div class="col-md-8 class-details">
                <h3>${fitnessClass.title}</h3>
                <p><strong>Description:</strong> ${fitnessClass.description}</p>
                <p><strong>Price:</strong> ${fitnessClass.price}</p>
                <p><strong>Day:</strong> ${fitnessClass.dayOfWeek}</p>
                <p><strong>Time:</strong> ${fitnessClass.time}</p>
                <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
                <p><strong>Instructor:</strong> ${fitnessClass.instructor.name}</p>
            </div>
        </div>

        <!-- Button to book the class -->
        <div class="book-button">
            <form action="/fitnessClasses/${fitnessClass.id}/book" method="post">
                <input type="submit" value="Book This Class" class="btn btn-success" style="width:200px;" />
            </form>
        </div>

        <!-- Link to go back to the dashboard -->
        <div class="mt-3">
            <a href="/userDashboard" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
