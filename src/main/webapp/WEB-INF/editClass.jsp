<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Edit Class</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <style>
      /* Set the background image for the whole page */
      body {
        font-family: 'Roboto';
        background-image: url('https://t4.ftcdn.net/jpg/09/52/95/27/360_F_952952792_K2Y8UWetVVHwEjr2NQodueALGAwwQkeT.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100vh; /* Make the background cover the whole viewport */
      }
	  .custom-blue {
	      color: #007bff; 
	  }


      .form-container {
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 30px;
        margin: auto;
        max-width: 800px;
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

    <!-- Edit Class Form -->
    <div class="container">
      <div class="form-container">
        <h3 class="text-center custom-blue">Edit Fitness Class</h3>
        <form:form action="/fitnessClasses/update/${fitnessClass.id}" method="post" modelAttribute="fitnessClass" enctype="multipart/form-data" class="form">
          <form:input type="hidden" path="instructor" value="${userId}" />
          <input type="hidden" name="_method" value="put" />
          <input type="hidden" name="imageName" value="${fitnessClass.imageName}" />
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<label class="form-label w-25">Image</label>
            	<input type="file" class="form-control" name="image" accept="image/*" />
            </div>
            <form:errors class="text-danger" path="imageName"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="title">Title</form:label>
            	<form:input class="form-control" path="title" />
            </div>
            <form:errors class="text-danger" path="title"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="description">Description</form:label>
            	<form:textarea class="form-control" path="description"></form:textarea>
            </div>
            <form:errors class="text-danger" path="description"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="price">Price</form:label>
            	<form:input class="form-control" path="price"/>
            </div>
            <form:errors class="text-danger" path="price"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="dayOfWeek">Day of the week</form:label>
            	<form:select class="form-control" path="dayOfWeek">
    				<c:forEach var="day" items="${days}">
        				<form:option value="${day}">
            				${day}
        				</form:option>
    				</c:forEach>
				</form:select>
			</div>
            <form:errors class="text-danger" path="dayOfWeek"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="time">Time</form:label>
            	<form:input type="time" class="form-control" path="time"/>
            </div>
            <form:errors class="text-danger" path="time"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="venue">Venue</form:label>
            	<form:select class="form-control" path="venue">
    				<c:forEach var="v" items="${venues}">
    					<c:if test="${v.id == fitnessClass.venue.id }">
        					<form:option value="${v.id}" selected="selected"> ${v.name} </form:option>
        				</c:if>
        				<c:if test="${v.id != fitnessClass.venue.id }">
        					<form:option value="${v.id}"> ${v.name} </form:option>
        				</c:if>
    				</c:forEach>
				</form:select>
			</div>
            <form:errors class="text-danger" path="venue"/>
          </div>
          <div class="mb-3">
          	<div class="d-flex align-items-center">
            	<form:label class="form-label w-25" path="maxStudents">Max Students</form:label>
            	<form:input type="number" class="form-control" path="maxStudents" value="${fitnessClass.maxStudents}"/>
            </div>
            <form:errors class="text-danger" path="maxStudents"/>
          </div>
          <button type="submit" class="btn btn-primary w-100">Edit</button>
        </form:form>
      </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-3 mt-5">
      <p>&copy; 2024 Fitness App | All rights reserved</p>
    </footer>

    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

