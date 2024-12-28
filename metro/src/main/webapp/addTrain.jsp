<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<html>

<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />

    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>


</head>

<body>
    <!-- Header Section -->
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

            <!-- Dropdown Menu -->
            <div class="dropdown mb-1">
                <img src="getImage/${dto.fileName}" class="rounded-circle mx-2" alt="img" width=90 />
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

    <!-- Main Content Section -->
    <h5 style="text-align:center;">${success}</h5>
    <h5 style="text-align:center;">${Unsaved}</h5>
    <br>


    <div style="max-width: 1000px; margin: auto;">
        <div class="mb-3">
            <h5 class="mb-0"></h5>
        </div>
        <div class="d-flex align-items-center justify-content-center" style="border-radius: 15px; overflow: hidden;">
            <div class="card-body" style="background-color: black;">
                <form action="addTrain/${dto.email}" method="post">
                    <div class="col-md-6 mb-1">
                        <div class="mb-3">
                            <h5 class="text-right" style="color:white">ADD TrainType And Train Number</h5>
                        </div>
                        <label for="email" class="form-label" hidden>email</label>
                        <input type="text" name="email" id="email" class="form-control" placeholder="Enter the email"
                            value="${dto.email}" hidden>
                    </div>

                    <div class="mb-3">
                        <label for="trainNumber" class="form-label" style="color:white">Train Number</label>
                        <input type="text" name="trainNumber" id="trainNumber" class="form-control"
                            placeholder="Enter the Train Number" required />
                    </div>
                    <div class="mb-3">
                        <label for="addTrainType" class="form-label" style="color:white">Add Train Type</label>
                        <select name="trainType" id="trainType" class="form-control select2" required>
                            <option value="">Select Train Type</option>
                            <option value="Purple">Purple</option>
                            <option value="Green">Green</option>
                        </select>
                    </div>
                    <button type="submit" id="button" class="btn btn-danger btn-sm btn- rounded-sm ">Add</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="fixed-bottom">
        <footer class="bg-dark text-white py-3">
            <div class="container text-center">
                <p class="mb-0"></p>
            </div>
        </footer>
    </div>

    <!-- Scripts -->
    <script type="text/javascript">
        // Initialize Select2 plugin after document is ready
        $(document).ready(function() {
            $('.select2').select2();
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>

</html>