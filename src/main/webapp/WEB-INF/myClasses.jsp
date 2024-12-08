<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Booked Classes</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg');
            background-size: cover;
            background-attachment: fixed;
            padding-bottom: 100px;
            color: #333;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
        }
        .container {
            margin-top: 30px;
        }
        h2 {
            color: #007bff;
            font-weight: bold;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        .class-item {
            display: flex;
            align-items: center;
            gap: 20px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .class-item:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .class-thumbnail img {
            width: 250px;
            height: 250px;
            border-radius: 12px;
            object-fit: cover;
        }
        .class-details {
            flex-grow: 1;
        }
        .class-details h4 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #007bff;
        }
        .class-details p {
            margin: 0;
            font-size: 0.9rem;
        }
        .class-actions .btn {
            background-color: #dc3545;
            border: none;
            color: white;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .class-actions .btn:hover {
            background-color: #c82333;
        }
        footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">My Booked Classes</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
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

    <div class="container">
        <h2>Your Booked Classes</h2>
        <c:forEach items="${currentUser.fitnessClasses}" var="fitnessClass">
            <div class="class-item">
                <div class="class-thumbnail">
                    <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" alt="${fitnessClass.title}">
                </div>
                <div class="class-details">
                    <h4>${fitnessClass.title}</h4>
                    <p>${fitnessClass.description}</p>
                    <p><strong>Price:</strong> $${fitnessClass.price}</p>
                    <p><strong>Day:</strong> ${fitnessClass.dayOfWeek}</p>
                    <p><strong>Time:</strong> ${fitnessClass.time}</p>
                    <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
                </div>
                <div class="class-actions">
                    <form action="/fitnessClasses/${fitnessClass.id}/cancel" method="post">
                        <button type="submit" class="btn btn-danger">Cancel Booking</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <footer>
        &copy; 2024 Fitness Class App. All Rights Reserved.
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
