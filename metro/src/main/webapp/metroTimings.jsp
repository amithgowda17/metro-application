<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-..." crossorigin="anonymous">
        <title>Metro Timings</title>
</head>

<body class="d-flex flex-column min-vh-100">

    <header class="bg-dark text-white text-center py-3">
        <div class="d-flex justify-content-between align-items-center">

            <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

            <div class="dropdown mb-1">
                <img src="readImage/${details.imageName}" class="rounded-circle mx-2" alt="img" width="90"
                    data-bs-toggle="modal" data-bs-target="#imageModal" />
                <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                    role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    ${details.firstName}
                </a>

                <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                    <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>
                    <a class="dropdown-item" href="info?email=${details.email}">Information</a>
                    <a class="dropdown-item" href="smartCards?email=${details.email}">Smart Cards</a>
                    <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                </div>
                <button>
                    <a href="abc?userId=${details.id}&&email=${details.email}" style="color: black; text-decoration: none">View Ticket History</a>
                </button>
                <button>
                                    <a href="back?email=${details.email}" style="color: black; text-decoration: none">Home</a>
                                </button>
            </div>
        </div>
    </header>

    <div class="content flex-fill">
        <table class="table table-hover mx-auto rounded-3" style="width: 60%;">
            <thead style="background-color: #6f42c1; color: white;" class="rounded-top">
                <tr>
                    <th>Train Number:</th>
                    <th>Train Type:</th>
                    <th>Locations:</th>
                    <th>From Time:</th>
                    <th>To Time:</th>
                    <th>Source:</th>
                    <th>Destination:</th>
                    <th>Day Of TheWeek:</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="addTrainEntity" items="${addTrainEntities}">
                    <tr>
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
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <footer class="bg-dark py-3 mt-auto">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

</body>

</html>
