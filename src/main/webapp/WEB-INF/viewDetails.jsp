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
            height: 300px;
            border-radius: 8px;
            margin-right: 15px;
        }
        .class-details {
            margin-top: 20px;
        }
        .book-button {
            margin-top: 50px;
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
                        <a class="nav-link" href="/users/dashboard">Dashboard</a>
                    </li>
                	<li class="nav-item">
                        <a class="nav-link" href="/fitnessClasses">Fitness Classes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container class-detail-container">
        <h2 class="mb-4 text-success">Fitness Class Details</h2>

        <!-- Display the details of the selected class -->
        <div class="d-flex justify-content-around align-items-center">
            <div>
                <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" 
                     class="class-thumbnail" style="object-fit: cover;overflow: hidden;" alt="Class Image" />
            </div>
            <div>
                <h3>${fitnessClass.title}</h3>
                <p><strong>Description:</strong> ${fitnessClass.description}</p>
                <p><strong>Price:</strong> ${fitnessClass.price}</p>
                <p><strong>Day:</strong> ${fitnessClass.dayOfWeek}</p>
                <p><strong>Time:</strong> ${fitnessClass.time}</p>
                <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
                <p><strong>Instructor:</strong> ${fitnessClass.instructor.firstName}</p>
            </div>
        </div>

        <!-- Button to book the class -->
        <div class="book-button text-center">
        	<c:if test="${!fitnessClass.isUserEnrolled(userId) }">
            	<form action="/fitnessClasses/${fitnessClass.id}/book" method="post">
                	<input type="submit" value="Book This Class" class="btn btn-success" style="width:200px;" />
            	</form>
            </c:if>
            <c:if test="${fitnessClass.isUserEnrolled(userId) }">
            	<form action="/fitnessClasses/${fitnessClass.id}/cancel" method="post">
                	<input type="submit" value="Cancel Booking" class="btn btn-warning" style="width:200px;" />
            	</form>
            </c:if>
        </div>
    </div>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
