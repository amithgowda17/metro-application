<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-..." crossorigin="anonymous">
</head>

<body class="d-flex flex-column min-vh-100">

    <header class="bg-dark text-white text-center py-3">
        <div class="d-flex justify-content-between align-items-center">
            <!-- Logo -->
            <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

            <!-- Dropdown with Profile -->
            <div class="dropdown mb-1">
                <img src="readImage/${details.imageName}" class="rounded-circle mx-2" alt="img" width="90"
                    data-bs-toggle="modal" data-bs-target="#imageModal" />
                <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                    role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    ${details.firstName}
                </a>
                <button><a class="dropdown-item" href="metroTimings?email=${details.email}">Metro Timings</a></button>
                <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                    <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>
                    <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                </div>
            </div>
        </div>
    </header>

    <form action="findTicketId">
        <input type="number" name="ticketId" id="ticketId" placeholder="enter a ticket Id" class="form-control" hidden>
    </form>

    <h5 style="text-align:center">Ticket Booking Details</h5>
    <table class="table table-hover mx-auto rounded-3" style="width: 60%;">
        <thead style="background-color: #6f42c1; color: white;" class="rounded-top">
            <tr>
                <th>ticketId</th>
                <th>userId</th>
                <th>source</th>
                <th>destination</th>
                <th>price</th>
                <th>tokenNumber</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ticket" items="${ticketDto}">
                <tr>
                    <td>${ticket.ticketId}</td>
                    <td>${ticket.userId}</td>
                    <td>${ticket.source}</td>
                    <td>${ticket.destination}</td>
                    <td>${ticket.price}</td>
                    <td>${ticket.tokenNumber}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Footer positioned at the bottom -->
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
