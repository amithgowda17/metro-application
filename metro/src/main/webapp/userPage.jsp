<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

        <html>

        <head>
            <title>Login</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        </head>

        <body>

            <header class="header">
                <div class="container-fluid bg-black text-white">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
                        </div>
                        <div class="col text-center d-flex justify-content-center">
                            <button type="button" class="btn btn-success me-5" data-bs-toggle="modal"
                                data-bs-target="#modal1">Add Location</button>
                            <button type="button" class="btn btn-success me-5" data-bs-toggle="modal"
                                data-bs-target="#modal2">Add Timings</button>
                            <button type="button" class="btn btn-success me-5" data-bs-toggle="modal"
                                data-bs-target="#modal3">Add Price List</button>
                            <button type="button" class="btn btn-success me-5" data-bs-toggle="modal"
                                data-bs-target="#modal4">Add Train</button>
                        </div>
                        <div class="col-auto d-flex align-items-center justify-content-end">
                            <img src="getImage/${details.fileName}"
                                style="height: 50px; width: 50px; border-radius: 50%;">
                            <div class="dropdown ms-2">
                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    ${details.fname}
                                </button>
                                <ul class="dropdown-menu">
                                    <li class="bg-white text-dark"><a class="dropdown-item"
                                            href="profileUpdate?email=${details.email}">Profile</a></li>
                                    <li class="bg-white text-dark"><a class="dropdown-item" href="loginOut">Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <h6 style="color: green;">${details.fileName}</h6>
            <h6 style="color: green;">${msg}</h6>
            <h6 style="color: red;">${errMsg}</h6>
            <h6 style="color: green;">${successMsg}</h6>


            <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="modal1Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal1Label">Add Location</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="addLocation?email=${details.email}" method="post">
                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Metro Type</label>
                                    <input type="text" class="form-control" id="type" name="metroType" required>
                                </div>

                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Location Name</label>
                                    <input type="text" class="form-control" id="locationName" name="locationName"
                                        required>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="modal2Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal2Label">Add Timings</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="addTimings?email=${details.email}" method="post">
                                <div class="mb-3">
                                    <label for="source" class="form-label">Source Station</label>
                                    <input type="text" class="form-control" id="source" name="sourceStation" required>
                                </div>
            
                                <div class="mb-3">
                                    <label for="destination" class="form-label">Destination</label>
                                    <input type="text" class="form-control" id="destination" name="destinationStation" required>
                                </div>
            
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="from" class="form-label">Arrival Time</label>
                                        <input type="time" class="form-control" id="from" name="fromTimings" required>
                                    </div>
                                    <div class="col">
                                        <label for="to" class="form-label">End Time</label>
                                        <input type="time" class="form-control" id="to" name="toTimings" required>
                                    </div>
                                </div>
            
                                <div class="mb-3">
                                    <label for="type" class="form-label">Metro type</label>
                                    <input type="text" class="form-control" id="type" name="metroType" required>
                                </div>
            
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="fromLocation" class="form-label">From</label>
                                        <input type="text" class="form-control" id="fromLocation" name="from" required>
                                    </div>
                                    <div class="col">
                                        <label for="toLocation" class="form-label">To</label>
                                        <input type="text" class="form-control" id="toLocation" name="to" required>
                                    </div>
                                </div>
            
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="modal3Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal3Label">Add Price List</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="addPrice?email=${details.email}" method="post">
                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Source Station</label>
                                    <input type="text" class="form-control" id="source" name="sourceStation" required>
                                </div>

                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Destination</label>
                                    <input type="text" class="form-control" id="destination" name="destinationStation"
                                        required>
                                </div>

                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Metro Type</label>
                                    <input type="text" class="form-control" id="type" name="metroType" required>
                                </div>

                                <div class="mb-3">
                                    <label for="locationName" class="form-label">Add Price</label>
                                    <input type="text" class="form-control" id="price" name="addPrice" required>
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal4" tabindex="-1" aria-labelledby="modal4Label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal4Label">Add Train</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="addMetro?email=${details.email}" method="post">
                                <div class="mb-3">
                                    <label for="trainDetails" class="form-label">Metro Type</label>
                                    <input type="text" class="form-control" id="metroType" name="metroType" required>
                                </div>

                                <div class="mb-3">
                                    <label for="trainDetails" class="form-label">Metro Number</label>
                                    <input type="text" class="form-control" id="metroNumber" name="metroNumber"
                                        required>
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

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