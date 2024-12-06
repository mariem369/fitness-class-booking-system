<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Register or Log In</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <style>
      body {
        font-family: 'Roboto';
        background-image: url('https://custom-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_9000,w_1200,f_auto,q_auto/1757362/66486_342406.jpeg'); /* Replace with your background image URL */
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
      }

      footer {
        background-color: rgba(0, 0, 0, 0.6);
        color: white;
        text-align: center;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
      }

      .container {
        padding-top: 50px;
      }

      .navbar {
        margin-bottom: 20px;
      }

      .form-card {
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 20px;
        margin: auto;
      }

      .form {
        margin-top: 10px;
      }

      /* Custom styles for layout */
      .row {
        display: flex;
        justify-content: center;
      }

      .col-card {
        max-width: 400px;
        margin: 10px;
      }
    </style>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">My App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" href="/login">Log In</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/register">Register</a>
            </li>
            <!-- Contact Link Added -->
            <li class="nav-item">
              <a class="nav-link" href="/contact">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <!-- Registration Card on Left -->
        <div class="col-card">
          <div class="form-card active-card" id="registerCard">
            <h3 class="m-2 text-success fw-bold">Register</h3>
            <form:form action="/register" method="post" modelAttribute="newUser" class="form">
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
        </div>

        <!-- Login Card on Right -->
        <div class="col-card">
          <div class="form-card" id="loginCard">
            <h3 class="m-2 text-success fw-bold">Log In</h3>
            <form:form action="/login" method="post" modelAttribute="newLogin" class="form">
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
      </div>
    </div>

    <!-- Footer -->
    <footer>
      <p>&copy; 2024 My App. All Rights Reserved.</p>
    </footer>
  </body>
</html>
