<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
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
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .dashboard-container {
            margin-top: 30px;
        }
        .class-item {
            display: flex;
            align-items: flex-start;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
            justify-content: space-between;
        }
        .class-thumbnail {
            width: 250px;
            height: 250px;
            border-radius: 8px;
            margin-right: 15px;
        }
        .class-details {
        	margin-left:100px;
        	margin-right:100px;
        }
        .class-actions {
            display: flex;
            flex-direction: column;
        }
        .class-actions .btn {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">User Dashboard</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container dashboard-container">
        <h2>Welcome, ${firstName}!</h2> <!-- Welcome message with the user's first name -->

        <div>
            <c:forEach items="${instructorClasses}" var="fitnessClass">
                <div class="class-item">
                    <div class="class-thumbnail">
                        <img src="${pageContext.request.contextPath}/uploads/${fitnessClass.imageName}" 
                             style="object-fit: cover;overflow: hidden;height: 100%;" />
                    </div>
                    <div class="class-details">
                        <h4>${fitnessClass.title}</h4>
                        <p><strong>Venue:</strong> ${fitnessClass.venue.name}</p>
                        <p><strong>Price:</strong> ${fitnessClass.price}</p>
                    </div>
                    <div class="class-actions">
                        <a href="/fitnessClasses/${fitnessClass.id}/details" class="btn btn-info btn text-light" style="width:100px;">View Details</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
