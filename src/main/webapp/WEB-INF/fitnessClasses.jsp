<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            padding-bottom: 70px;
        }
        .navbar {
            margin-bottom: 30px;
        }
        h2 {
            color: #007bff;
            font-size: 2rem;
            font-weight: bold;
        }
        .dashboard-container {
            margin-top: 30px;
        }
        .card {
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            height: 100%; /* Ensure consistent card heights */
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-body {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 0 0 15px 15px;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .class-thumbnail {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #007bff;
        }
        .class-actions .btn {
            background-color: #28a745;
            color: white;
            border: none;
            width: 100%;
            padding: 10px;
            font-weight: bold;
        }
        .class-actions .btn:hover {
            background-color: #218838;
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .container {
            max-width: 1200px;
        }
		.custom-card-bg {
		    /* Black background */
		    color: white; /* Ensure text is visible */
		}
        .row-cols-1 > * {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">User Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/users/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container dashboard-container">
        <h2 class="mb-4">Welcome, ${firstName}!</h2>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 ">
            <c:forEach var="fitnessClass" items="${fitnessClasses}">
                <div class="col">
                    <div class="card shadow-lg h-100">
                        <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" 
                             class="class-thumbnail" alt="${fitnessClass.title}">
                        <div class="card-body d-flex flex-column custom-card-bg">
                            <h5 class="card-title">${fitnessClass.title}</h5>
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <p>${fitnessClass.venue.name}</p>
                                <p>$${fitnessClass.price}</p>
                            </div>
                            <a href="/fitnessClass/${fitnessClass.id}" class="btn btn-info mt-auto text-white">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 My Fitness App. All Rights Reserved.</p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>


