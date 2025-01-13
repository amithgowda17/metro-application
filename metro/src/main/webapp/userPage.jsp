<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

        <html>

        <head>
            <title>Dashboard</title>
            <link rel="icon" href="https://www.x-workz.in/Logo.png">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        </head>

        <body>

            <header class="bg-dark text-white text-center py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">


                    <nav class="d-flex justify-content-center">
                        <a href="addLocations?email=${details.email}"
                            class="btn btn-outline-light btn-sm mx-2">Locations</a>
                        <a href="addTimings?email=${details.email}"
                            class="btn btn-outline-light btn-sm mx-2">Timings</a>
                        <a href="addTrainType?email=${details.email}" class="btn btn-outline-light btn-sm mx-2">Add
                            Train</a>
                        <a href="addPriceList?email=${details.email}"
                            class="btn btn-outline-light btn-sm mx-2">Price</a>
                        <a href="readTrain?email=${details.email}" class="btn btn-outline-light btn-sm mx-2">View
                            Data</a>
                    </nav>

                    <div class="dropdown mb-1">
                        <img src="getImage/${details.fileName}" class="rounded-circle mx-2" alt="img" width="90"
                            data-bs-toggle="modal" data-bs-target="#imageModal" />
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


            <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="imageModalLabel">Profile Picture</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <img src="getImage/${details.fileName}" class="img-fluid" alt="Profile Image" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="container mt-5">
                <div class="row">
                    <!-- Metro Train Image -->
                    <div class="col-md-6 mb-4">
                        <div class="card h-100">
                            <img src="https://bangaloretoday.in/wp-content/uploads/2019/03/bangalore-metro-stations-980x735.png"
                                class="card-img-top img-fluid h-100 object-fit-cover" alt="Metro Train Image">
                            <div class="card-body">
                                <h5 class="card-title">Metro Train</h5>
                                <p class="card-text">The metro trains are modern, comfortable, and efficient, designed
                                    to provide a seamless travel experience for commuters. It runs on all major routes
                                    of the city, covering significant locations.</p>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6 mb-4">
                        <div class="card h-100">
                            <img src="https://www.metrorailnews.in/wp-content/uploads/2019/06/NAMMA_METRO_MAP-768x501.png"
                                class="card-img-top img-fluid h-100 object-fit-cover" alt="Metro Route Map">
                            <div class="card-body">
                                <h5 class="card-title">Metro Route Map</h5>
                                <p class="card-text">Check the metro route map to find the best route for your commute.
                                    The metro system covers the entire city and connects major landmarks and residential
                                    areas.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <footer class="footer">
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

        </body>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>

        </html>