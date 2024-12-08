<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg');
            background-size: cover;
            background-attachment: fixed;
            color: #333;
            padding-bottom: 150px; /* Prevent content overlap with footer */
        }
        .dashboard-container {
            margin-top: 40px;
        }
        .class-item {
            display: flex;
            align-items: flex-start;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            justify-content: space-between;
        }
        .class-thumbnail {
            width: 200px;
            height: 200px;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f8f8; /* Fallback color */
        }
        .class-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .class-details h4 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .class-details p {
            margin: 0 0 8px;
        }
        .class-actions {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .class-actions .btn {
            margin-bottom: 10px;
            font-size: 14px;
            width: 120px;
        }
        h2 {
            color: #0056b3;
            font-weight: bold;
        }
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        nav .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Instructor Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/addClass">Add Classes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container dashboard-container">
        <h2>Welcome, ${firstName}</h2>

        <c:forEach items="${myClasses}" var="fitnessClass">
            <div class="class-item">
                <div class="class-thumbnail">
                    <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" alt="${fitnessClass.title}">
                </div>
                <div class="class-details">
                    <h4>${fitnessClass.title}</h4>
                    <p><strong>Price:</strong> ${fitnessClass.price}</p>
                    <p><strong>Day:</strong> ${fitnessClass.dayOfWeek}</p>
                    <p><strong>Time:</strong> ${fitnessClass.time}</p>
                    <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
                    <p><strong>Address:</strong> ${fitnessClass.venue.address}</p>
                </div>
                <div class="class-actions">
                    <a href="/fitnessClasses/${fitnessClass.id}/details" class="btn btn-info">Details</a>
                    <form action="/fitnessClasses/${fitnessClass.id}/edit" method="post">
                        <input type="submit" class="btn btn-warning" value="Edit">
                    </form>
                    <form action="/fitnessClasses/${fitnessClass.id}/delete" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <footer>
        <p>&copy; 2024 My App. All Rights Reserved.</p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>


