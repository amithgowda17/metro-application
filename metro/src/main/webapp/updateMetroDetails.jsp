<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">
</head>
<body>
    <header class="bg-dark text-white text-center py-3">
        <div class="d-flex justify-content-between align-items-center">
            <img src="https://www.x-workz.in/Logo.png" alt="Coders World Logo" style="max-height: 50px;">
       <h1 class="text-center mb-0 flex-grow-1"></h1>
        </div>

    </header>
<br>
    <div class="card mx-auto" style="max-width: 700; max-height:1000;border-radius: 15px; overflow: hidden;>
        
        <div class="card" >
            <div class="card-header">
                <h5>Update Train Details</h5>
            </div>
            <div class="card-body" style="background-color: black;">
                <form action="updateDetails" method="Post">
                    <div class="mb-3">
                        <label for="addTrainId" class="form-label" hidden>addTrainId</label>
                        <input type="number" class="form-control" id="addTrainId" name="addTrainId" value="${dto.addTrainId}" hidden>
                    </div>
                     <input type="email" id="email" name="email" placeholder="user@gmail.com" id="emailId" value="${email.email}" hidden>
                    <div class="mb-3">
                        <label for="trainNumber" class="form-label"   style="color:white">trainNumber</label>
                        <input type="text" class="form-control" id="trainNumber" name="trainNumber" value="${dto.trainNumber}">
                    </div>
                    <div class="mb-3">
                   <label for="trainType" class="form-label"   style="color:white">trainType</label>
                  <input type="text" class="form-control" id="trainType" name="trainType" value="${dto.trainType}">
                  </div>
          <div class="mb-3">
             <c:forEach items="${dto.timingEntity}" var="timing">
        <label for="source" class="form-label"   style="color:white">Source</label>
        <input type="text" class="form-control" id="source" name="source" value="${timing.source}">
          </c:forEach>
        </div>

          <div class="mb-3">
             <c:forEach items="${dto.timingEntity}" var="timing">
        <label for="destination"   style="color:white" class="form-label">destination</label>
        <input type="text" class="form-control" id="destination" name="destination" value="${timing.destination}">
          </c:forEach>
        </div>
                  <div class="mb-3">
                     <c:forEach items="${dto.timingEntity}" var="timing">
                <label for="fromTime"  style="color:white" class="form-label">fromTime</label>
                <input type="text" class="form-control" id="fromTime" name="fromTime" value="${timing.fromTime}">
                  </c:forEach>
                </div>

                  <div class="mb-3">
                     <c:forEach items="${dto.timingEntity}" var="timing">
                <label for="toTime"   style="color:white"class="form-label">toTime</label>
                <input type="text" class="form-control" id="toTime" name="toTime" value="${timing.toTime}">
                  </c:forEach>
                </div>

          <div class="mb-3">
             <c:forEach items="${dto.priceEntity}" var="price">
        <label for="price"  style="color:white" class="form-label">price</label>
        <input type="number" class="form-control" id="price" name="price" value="${price.price}">
          </c:forEach>
        </div>
                          <div class="mb-3">
                             <c:forEach items="${dto.timingEntity}" var="timing">
                        <label for="dayOfTheWeek"   style="color:white" class="form-label">dayOfTheWeek</label>
                        <input type="text" class="form-control" id="dayOfTheWeek" name="dayOfTheWeek" value="${timing.dayOfTheWeek}">
                          </c:forEach>
                        </div>

                    <button type="submit" class="btn btn-danger btn-sm rounded-pill">Submit</button>
                </form>
            </div>
        </div>
    </div>


    <div class="bottom">
    <footer class="bg-dark text-white text-center py-3 mt-4" >
        <div class="container text-center">
                </div>
    </footer>
</body>
</html>