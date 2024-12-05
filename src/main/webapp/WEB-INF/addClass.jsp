<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Add Classes And Venues</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
  </head>
  <body style="font-family: 'Roboto';background-image: linear-gradient(120deg, #e1e6eb 0%, #c4c9d1 50%, #a8afb5 100%);">
   <div class="container w-75 border p-4 mx-auto" style="background-color: rgba(255, 255, 255, 0.2); min-height: 100vh;">
    
    <div class="d-flex gap-4">
    	<div class="w-50">
    		<h3 class="m-2 text-success fw-bold">Add Class</h3>
    		<form:form action="/createFitnessClass" method="post" modelAttribute="fitnessClass" enctype="multipart/form-data" class="form border py-2 px-4">
    			<form:input type="hidden" path="instructor" value="${userId}" />
    			<div class="d-flex p-1 m-1">
        			<label class="w-50">Image :</label>
        			<input type="file" class="form-control-sm" name="image" accept="image/*" />
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="imageName"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="title">Title :</form:label>
        			<form:input class="form-control-sm" path="title"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="title"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="description">Description :</form:label>
        			<form:textarea class="form-control-sm" path="description"></form:textarea>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="description"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="price">Price :</form:label>
        			<form:input class="form-control-sm" path="price"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="price"/>
    			<div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="dayOfWeek">Day of the week :</form:label>
                    <form:select class="form-control-sm" path="dayOfWeek">
                        <c:forEach var="day" items="${days}">
                            <form:option value="${day}">${day}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="dayOfWeek"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="time">time :</form:label>
        			<form:input type="time" class="form-control-sm" path="time"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="time"/>
    			<div class="d-flex p-1 m-1">
                    <form:label class="w-50" path="venue">Venue :</form:label>
                    <form:select class="form-control-sm" path="venue">
                    <c:if test="${venues.size() != 0 }">
                        <c:forEach var="v" items="${venues}">
                            <form:option value="${v.getId()}">${v.getName()}</form:option>
                        </c:forEach>
                    </c:if>
                    </form:select>
                </div>
                <form:errors class="ms-2 text-sm text-danger" path="venue"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="maxStudents">Max Number :</form:label>
        			<form:input type="number" class="form-control-sm" path="maxStudents"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="maxStudents"/>
    			<br/><input class="btn btn-primary text-light m-1" type="submit" value="Submit"/>
			</form:form>
		</div>
		<div class="w-50">
    		<h3 class="m-2 text-success fw-bold">Add Venue</h3>
    		<form:form action="/createVenue" method="post" modelAttribute="venue" class="form border py-2 px-4">
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="name">Name :</form:label>
        			<form:input class="form-control-sm" path="name"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="name"/>
    			<div class="d-flex p-1 m-1">
        			<form:label class="w-50" path="address">Address :</form:label>
        			<form:input class="form-control-sm" path="address"/>
    			</div>
    			<form:errors class="ms-2 text-sm text-danger" path="address"/>
    			<br/><input class="btn btn-primary text-light m-1" type="submit" value="Submit"/>
			</form:form>
		</div>
	</div>
	</div>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>