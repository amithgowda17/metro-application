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

            <body>
                <header class="bg-dark text-white text-center py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Logo -->
                        <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">

                        <!-- Heading -->
                        <h1 class="text-center mb-0 flex-grow-1"></h1>
                        <!-- Dropdown -->

                    </div>
                </header>

                <table class=" table table-hover mx-auto rounded-3" style="width: 60%;">
                    <thead style="background-color: #6f42c1; color: white;" class="rounded-top"">
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
    <tbody class=" table-">
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
                <div class="fixed-bottom">
                    <footer class="bg-dark text-white text-center py-3 mt-4">
                    </footer>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                    crossorigin="anonymous"></script>
            </body>

            </html>