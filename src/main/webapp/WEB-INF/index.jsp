<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            color: black;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            max-width: 900px;
        }

        .form {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.8);
        }

        footer {
            color: #fff;
            padding: 10px 0;
            text-align: center;
            width: 100%;
            margin-top: auto;
            bottom: 0;
        }

        .btn {
            background-color: #28a745;
            color: white;
        }

        .form-control-sm {
            border-radius: 5px;
            padding: 10px;
        }

        h3 {
            color: #28a745;
        }

        .nav-item a {
            color: #212529 !important;
        }

        .form-card {
            display: none;
        }

        .active-card {
            display: block;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">MyApp</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#" onclick="showRegisterForm()">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="showLoginForm()">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="form-card active-card" id="registerCard">
            <h3 class="m-2 text-success fw-bold">Register</h3>
            <form:form action="/register" method="post" modelAttribute="newUser" class="form" onsubmit="return validateRegisterForm()">
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="firstName">First Name :</form:label>
                    <form:input class="form-control-sm" path="firstName"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="firstName"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="lastName">Last Name :</form:label>
                    <form:input class="form-control-sm" path="lastName"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="lastName"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="role">Role :</form:label>
                    <form:select class="form-control-sm" path="role">
                        <c:forEach var="role" items="${roles}">
                            <form:option value="${role}">${role}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="role"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="email">Email :</form:label>
                    <form:input class="form-control-sm" path="email"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="email"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="password">Password :</form:label>
                    <form:input type="password" class="form-control-sm" path="password"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="password"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="confirm">Confirm PW :</form:label>
                    <form:input type="password" class="form-control-sm" path="confirm"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="confirm"/>
                
                <br/><input class="btn btn-primary text-light m-1" type="submit" value="Submit"/>
            </form:form>
        </div>

        <div class="form-card" id="loginCard">
            <h3 class="m-2 text-success fw-bold">Log In</h3>
            <form:form action="/login" method="post" modelAttribute="newLogin" class="form" onsubmit="return validateLoginForm()">
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="email">Email :</form:label>
                    <form:input class="form-control-sm" path="email"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="email"/>
                
                <div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="password">Password :</form:label>
                    <form:input type="password" class="form-control-sm" path="password"/>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="password"/>
                
                <br/><input class="btn btn-primary text-light m-1" type="submit" value="Submit"/>
            </form:form>
        </div>
    </div>

    <footer>
        <div class="container text-center py-3">
            <p>&copy; 2024 MyApp. All rights reserved.</p>
            <p>Designed by me</p>
        </div>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        function showRegisterForm() {
            document.getElementById('registerCard').classList.add('active-card');
            document.getElementById('loginCard').classList.remove('active-card');
        }

        function showLoginForm() {
            document.getElementById('loginCard').classList.add('active-card');
            document.getElementById('registerCard').classList.remove('active-card');
        }

        function validateRegisterForm() {
            const firstName = document.querySelector('[name="firstName"]').value;
            const lastName = document.querySelector('[name="lastName"]').value;
            const email = document.querySelector('[name="email"]').value;
            const password = document.querySelector('[name="password"]').value;
            const confirmPassword = document.querySelector('[name="confirm"]').value;

            if (!firstName || !lastName || !email || !password || !confirmPassword) {
                alert("Please fill in all fields.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }

            return true;
        }

        function validateLoginForm() {
            const email = document.querySelector('[name="email"]').value;
            const password = document.querySelector('[name="password"]').value;

            if (!email || !password) {
                alert("Please fill in all fields.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
