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
              <a class="nav-link active" href="/dashboard">Dashboard</a>
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
        <h3 class="text-center text-success">Edit Class</h3>
        <form:form action="/updateFitnessClass" method="post" modelAttribute="fitnessClass" enctype="multipart/form-data" class="form">
          <form:input type="hidden" path="id" value="${fitnessClass.id}" />
          <div class="mb-3">
            <form:label class="form-label" path="image">Image</form:label>
            <input type="file" class="form-control" name="image" accept="image/*" />
            <form:errors class="text-danger" path="image"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="title">Title</form:label>
            <form:input class="form-control" path="title" value="${fitnessClass.title}"/>
            <form:errors class="text-danger" path="title"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="description">Description</form:label>
            <form:textarea class="form-control" path="description">${fitnessClass.description}</form:textarea>
            <form:errors class="text-danger" path="description"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="price">Price</form:label>
            <form:input class="form-control" path="price" value="${fitnessClass.price}"/>
            <form:errors class="text-danger" path="price"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="dayOfWeek">Day of the week</form:label>
            <form:select class="form-control" path="dayOfWeek">
              <c:forEach var="day" items="${days}">
                <form:option value="${day}" <c:if test="${day == fitnessClass.dayOfWeek}">selected</c:if>>${day}</form:option>
              </c:forEach>
            </form:select>
            <form:errors class="text-danger" path="dayOfWeek"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="time">Time</form:label>
            <form:input type="time" class="form-control" path="time" value="${fitnessClass.time}"/>
            <form:errors class="text-danger" path="time"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="venue">Venue</form:label>
            <form:select class="form-control" path="venue">
              <c:forEach var="v" items="${venues}">
                <form:option value="${v.id}" <c:if test="${v.id == fitnessClass.venue.id}">selected</c:if>>${v.name}</form:option>
              </c:forEach>
            </form:select>
            <form:errors class="text-danger" path="venue"/>
          </div>
          <div class="mb-3">
            <form:label class="form-label" path="maxStudents">Max Students</form:label>
            <form:input type="number" class="form-control" path="maxStudents" value="${fitnessClass.maxStudents}"/>
            <form:errors class="text-danger" path="maxStudents"/>
          </div>
          <button type="submit" class="btn btn-success w-100">Edit</button>
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

