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
                        <nav class="d-flex justify-content-center">
                            <a href="addLocations?email=${dto.email}" class="btn btn-dark btn-sm mx-2 ">Locations</a>
                            <a href="addTimings?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Timings</a>
                            <a href="addTrainType?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Add Train</a>
                            <a href="addPriceList?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Price</a>
                            <a href="readTrain?email=${dto.email}" class="btn btn-dark btn-sm mx-2">View Data</a>

                        </nav>

                        <!-- Heading -->
                        <h1 class="text-center mb-0 flex-grow-1"></h1>
                        <!-- Dropdown -->
                        <div class="dropdown mb-1">
                            <img src="getImage/${dto.fileName}" class="rounded-circle mx-2" alt="img" width=90 />
                            <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                                role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                ${dto.fname}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="${dto.fname}">
                                <a class="dropdown-item" href="profileUpdate?email=${dto.email}">Profile</a>
                                <a class="dropdown-item" href="loginOut">Log out</a>
                            </div>
                        </div>
                    </div>
                </header>

                <div>
                    <form action="readEmail">
                        <label for="email" class="form-label" hidden>email</label>
                        <input type="email" name="email" class="form-control" placeholder="please enter a email"
                            value="${dto.email}" hidden>
                    </form>
                </div>
                <br>
                <pre style="text-align:center; color:green;">${find}</pre>
                <form action="searchById" class="d-flex justify-content-center align-items-center">
                    <input type="number" name="addTrainId" class="form-control d-inline" style="width: auto;">
                    <input type="email" name="email" class="form-control" placeholder="please enter a email"
                        value="${dto.email}" hidden>
                    <input type="submit" value="search" class="btn btn-primary ms-2"> <!-- Added ms-2 for spacing -->
                </form>

                <table class=" table table-hover mx-auto rounded-3" style="width: 60%;">
                    <thead style="background-color: #6f42c1; color: white;" class="rounded-top"">
        <tr>
            <th>AddTrain Id:</th>
            <th>Train Number:</th>
            <th>Train Type:</th>
            <th>Locations:</th>
            <th>From Time:</th>
            <th>To Time:</th>
            <th>Source:</th>
            <th>Destination:</th>
            <th>Day Of TheWeek:</th>
            <th>Price:</th>
        </tr>
    </thead>
    <tbody class=" table-">
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
                            <td><a href="UpdateTrain?addTrainId=${addTrainEntity.addTrainId}&email=${dto.email}"
                                    class="btn btn-primary btn-sm"> Edit details</a></td>
                        </tr>
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