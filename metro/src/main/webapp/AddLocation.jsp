<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html>

            <head>
                <title>This is Coders World</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                    crossorigin="anonymous">
                <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            </head>

            <body>
                <header class="bg-dark text-white text-center py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Logo -->
                        <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
                        <nav class="d-flex justify-content-center">
                            <a href="addLocations?email=${details.email}"
                                class="btn btn-dark btn-sm mx-2 ">Locations</a>
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

                <br>
                <nav class="d-flex align-items-center justify-content-center">
                    <img src="https://webtopup.bmrc.co.in/contents/images/banner-inner.jpg" alt="Descriptive Alt Text"
                        class="img-fluid" style="max-height: 200px; width:1000px">
                </nav>

                <div style="max-width: 1000px; margin: auto;">
                    <div class="mb-3">
                        <h5 class="mb-0"></h5>
                    </div>
                    <div class="card" style="border-radius: 15px; overflow: hidden;">
                        <div class="card-body" style="background-color: black;">
                            <form action="location" id="myForm" method="post">
                                <div class="col-md-6 mb-1">
                                    <div class="mb-3">
                                        <div>
                                            <h5 class="text-right" style="color:white">ADD LOCATIONS</h5>
                                        </div>

                                        <label for="email" class="form-label" hidden>email</label>
                                        <input type="text" name="email" id="trainNumber" class="form-control"
                                            placeholder="Enter the email" value="${dto.email}" hidden>
                                    </div>

                                    <div class="mb-3">
                                        <label for="trainNumber" class="form-label" style="color:white">Train
                                            Number</label>
                                        <input type="text" name="trainNumber" id="trainNumber" class="form-control"
                                            placeholder="Enter the Train Number" required />
                                    </div>

                                    <div class="mb-3">
                                        <label for="addTrainType" class="form-label" style="color:white">Add Train
                                            Type</label>
                                        <select name="trainType" id="trainType" class="form-control" required>
                                            <option value="">Select Train Type</option>
                                            <option value="Purple">Purple</option>
                                            <option value="Green">Green</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="locationsName" style="color:white" class="form-label">Select
                                            Station</label>
                                        <select name="locationsName" id="locationsName" class="form-control" required>
                                            <option value="">Select Station</option>
                                            <!-- Purple Line Stations -->
                                            <option value="Baiyappanahalli">Baiyappanahalli</option>
                                            <option value="Indiranagar">Indiranagar</option>
                                            <option value="Halasuru">Halasuru</option>
                                            <option value="Trinity">Trinity</option>
                                            <option value="MG Road">M.G. Road</option>
                                            <option value="Cunningham Road">Cunningham Road</option>
                                            <option value="Shanthinagar">Shanthinagar</option>
                                            <option value="Lalbagh">Lalbagh</option>
                                            <option value="South End Circle">South End Circle</option>
                                            <option value="Jayanagar">Jayanagar</option>
                                            <option value="RV Road">Rashtreeya Vidyalaya Road (RV Road)</option>
                                            <option value="Banashankari">Banashankari</option>
                                            <option value="Yelachenahalli">Yelachenahalli</option>
                                            <option value="Silk Board">Silk Board</option>
                                            <option value="BTM Layout">BTM Layout</option>
                                            <option value="JP Nagar">J.P. Nagar</option>
                                            <option value="Kengeri">Kengeri</option>
                                            <!-- Green Line Stations -->
                                            <option value="Nagasandra">Nagasandra</option>
                                            <option value="Dasarahalli">Dasarahalli</option>
                                            <option value="Jalahalli">Jalahalli</option>
                                            <option value="Peenya Industry">Peenya Industry</option>
                                            <option value="Peenya">Peenya</option>
                                            <option value="Goraguntepalya">Goraguntepalya</option>
                                            <option value="Yeshwanthpur">Yeshwanthpur</option>
                                            <option value="Sandal Soap Factory">Sandal Soap Factory</option>
                                            <option value="Mahalakshmi">Mahalakshmi</option>
                                            <option value="Rajajinagar">Rajajinagar</option>
                                            <option value="Kuvempu Road">Kuvempu Road</option>
                                            <option value="Srirampura">Srirampura</option>
                                            <option value="Mantri Square Sampige Road">Mantri Square Sampige Road
                                            </option>
                                            <option value="Krantivira Sangolli Rayanna">Krantivira Sangolli Rayanna
                                                (Majestic)</option>
                                            <option value="Chickpete">Chickpete</option>
                                            <option value="Krishna Rajendra Market">Krishna Rajendra Market</option>
                                            <option value="National College">National College</option>
                                            <option value="Lalbagh">Lalbagh</option>
                                            <option value="South End Circle">South End Circle</option>
                                            <option value="Jayanagar">Jayanagar</option>
                                            <option value="Rashtreeya Vidyalaya Road">Rashtreeya Vidyalaya Road</option>
                                            <option value="Banashankari">Banashankari</option>
                                            <option value="Jaya Prakash Nagar">Jaya Prakash Nagar</option>
                                            <option value="Yelachenahalli">Yelachenahalli</option>
                                            <option value="Anjanapura">Anjanapura</option>
                                        </select>
                                    </div>


                                    <button type="submit" id="button" class="btn btn-danger btn-sm">Add</button>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="fixed-bottom">
                    <footer class="bg-dark text-white py-3">
                        <div class="container text-center">
                            <p class="mb-0"></p>
                        </div>
                    </footer>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                    crossorigin="anonymous"></script>

            </body>

            <script type="text/javascript">
            </script>

            </html>