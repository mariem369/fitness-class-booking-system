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
        }
        .class-thumbnail {
            width: 100px;
            height: 100px;
            background-color: #ddd;
            border-radius: 8px;
            margin-right: 15px;
            flex-shrink: 0;
        }
        .class-details {
            flex-grow: 1;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Instructor Dashboard</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/classes/add">Add Classes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container dashboard-container">
        <h2>Welcome, ${instructorName}</h2>

        <div>
            <c:forEach items="${myClasses}" var="class">
                <div class="class-item">
                    <div class="class-thumbnail">
                        <!-- Placeholder for class image -->
                    </div>
                    <div class="class-details">
                        <h4>${class.title}</h4>
                        <p>${class.description}</p>
                        <p><strong>Price:</strong> $${class.price}</p>
                        <p><strong>Day:</strong> ${class.dayOfWeek}</p>
						<p><strong>Time:</strong> ${class.Time}</p>
						<p><strong>Venue:</strong> ${class.dayOfWeek}</p>
                    </div>
                    <div class="class-actions">
                        <a href="/classes/${class.id}/edit" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/classes/${class.id}/details" class="btn btn-info btn-sm">Detail</a>
                        <button class="btn btn-danger btn-sm" onclick="deleteClass(${class.id})">Delete</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteClass(classId) {
            if (confirm("Are you sure you want to delete this class?")) {
                fetch(`/classes/${classId}/delete`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if (response.ok) {
                        alert("Class deleted successfully.");
                        location.reload();
                    } else {
                        alert("Failed to delete class.");
                    }
                })
                .catch(error => {
                    console.error("Error deleting class:", error);
                    alert("An error occurred.");
                });
            }
        }
    </script>
</body>
</html>
