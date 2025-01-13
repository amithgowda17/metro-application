<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-..." crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<title></title>

<body class="d-flex flex-column" style="min-height: 100vh;">
    <header class="bg-dark text-white text-center py-3">
        <div class="d-flex justify-content-between align-items-center">

            <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

            <nav class="d-flex justify-content-center">
                <a href="addLocations?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Locations</a>
                <a href="addTimings?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Timings</a>
                <a href="addTrainType?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Add Train</a>
                <a href="addPriceList?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Price</a>
                <a href="readTrain?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">View Data</a>
            </nav>

            <div class="dropdown mb-1">
                <img src="getImage/${dto.fileName}" class="rounded-circle mx-2" alt="img" width="90"
                    data-bs-toggle="modal" data-bs-target="#imageModal" />
                <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href="" role="button"
                    id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${dto.fname}
                </a>
                <div class="dropdown-menu" aria-labelledby="${dto.fname}">
                    <a class="dropdown-item" href="profileUpdate?email=${dto.email}">Profile</a>
                    <a class="dropdown-item" href="loginOut">Log out</a>
                </div>
            </div>
        </div>
    </header>


    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">Profile Picture</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img src="getImage/${dto.fileName}" class="img-fluid" alt="Profile Image" />
                </div>
            </div>
        </div>
    </div>

    <div>
        <form action="readEmail">
            <label for="email" class="form-label" hidden>email</label>
            <input type="email" name="email" class="form-control" placeholder="please enter an email"
                value="${dto.email}" hidden>
        </form>
    </div>
    <br>
    <pre style="text-align:center; color:green;">${find}</pre>
    <form action="searchById" class="d-flex justify-content-center align-items-center">
        <input type="number" name="addTrainId" class="form-control d-inline" style="width: auto;">
        <input type="email" name="email" class="form-control" placeholder="please enter an email"
            value="${dto.email}" hidden>
        <input type="submit" value="search" class="btn btn-primary ms-2"> <!-- Added ms-2 for spacing -->
    </form>

    <table class="table table-hover mx-auto rounded-3 border" style="width: 60%;"> <!-- Added the border class here -->
        <thead style="background-color: #6f42c1; color: white;" class="rounded-top">
            <tr>
                <th>AddTrain Id:</th>
                <th>Train Number:</th>
                <th>Train Type:</th>
                <th>Locations:</th>
                <th>From Time:</th>
                <th>To Time:</th>
                <th>Source:</th>
                <th>Destination:</th>
                <th>Day Of The Week:</th>
                <th>Price:</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="addTrainEntity" items="${addTrainEntities}">
                <tr>
                    <td>${addTrainEntity.addTrainId}</td>
                    <td>${addTrainEntity.trainNumber}</td>
                    <td>${addTrainEntity.trainType}</td>
                    <td>
                        <c:forEach items="${addTrainEntity.locations}" var="location">
                            ${location.locationsName} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                            ${timing.fromTime} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                            ${timing.toTime} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                            ${timing.source} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                            ${timing.destination} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.timingEntity}" var="timing">
                            ${timing.dayOfTheWeek} <br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${addTrainEntity.priceEntity}" var="price">
                            ${price.price} <br>
                        </c:forEach>
                    </td>
                    <td><a href="UpdateTrain?addTrainId=${addTrainEntity.addTrainId}&email=${dto.email}"
                            class="btn btn-primary btn-sm"> Edit details</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td>${addTrainEntity.addTrainId}</td>
                <td>${addTrainEntity.trainNumber}</td>
                <td>${addTrainEntity.trainType}</td>
                <td>
                    <c:forEach items="${addTrainEntity.locations}" var="location">
                        ${location.locationsName} <br>
                    </c:forEach>
                </td>

                <c:forEach items="${addTrainEntity.timingEntity}" var="time">
                    <td>${time.fromTime}</td>
                    <td>${time.toTime}</td>
                    <td>${time.source}</td>
                    <td>${time.destination}</td>
                    <td>${time.dayOfTheWeek}
                </c:forEach>
                <c:forEach items="${addTrainEntity.priceEntity}" var="price">
                    <td>${price.price}</td>
                </c:forEach>

            </tr>
        </tbody>
    </table>

    <footer class="bg-dark text-white text-center py-3 mt-auto border-top">

        <p class="mb-0">Copyright &copy; 2024, All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>

</html>
