<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

        <html>

        <head>
            <title>Login</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        </head>

        <body>

            <header class="bg-dark text-white text-center py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <!-- Logo -->
                    <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
                    <nav class="d-flex justify-content-center">
                        <a href="addLocations?email=${details.email}" class="btn btn-dark btn-sm mx-2 ">Locations</a>
                        <a href="addTimings?email=${details.email}" class="btn btn-dark btn-sm mx-2">Timings</a>
                        <a href="addTrainType?email=${details.email}" class="btn btn-dark btn-sm mx-2">Add Train</a>
                        <a href="addPriceList?email=${details.email}" class="btn btn-dark btn-sm mx-2">Price</a>
                        <a href="readTrain?email=${details.email}" class="btn btn-dark btn-sm mx-2">View Data</a>
                    </nav>

                    <!-- Heading -->
                    <h1 class="text-center mb-0 flex-grow-1"></h1>
                    <!-- Dropdown -->
                    <div class="dropdown mb-1">
                        <img src="getImage/${details.fileName}" class="rounded-circle mx-2" alt="img" width=90 />
                        <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                            role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                            ${details.fname}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="${details.fname}">
                            <a class="dropdown-item" href="profileUpdate?email=${details.email}">Profile</a>
                            <a class="dropdown-item" href="loginOut">Log out</a>
                        </div>
                    </div>
                </div>
            </header>

            <h6 style="color: green;">${details.fileName}</h6>
            <h6 style="color: green;">${msg}</h6>
            <h6 style="color: red;">${errMsg}</h6>
            <h6 style="color: green;">${successMsg}</h6>




            <footer class="fixed-bottom">
                <div class="footer bg-dark py-3 mt-auto">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-md-6 text-center">
                                <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
                            </div>
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