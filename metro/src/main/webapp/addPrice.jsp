<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

        <html>

        <head>
            <link rel="icon" href="https://www.x-workz.in/Logo.png">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <title>Add Price</title>

        </head>

        <body>
            <header class="bg-dark text-white text-center py-3">
                <div class="d-flex justify-content-between align-items-center">

                    <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">


                    <nav class="d-flex justify-content-center">
                        <a href="addLocations?email=${dto.email}"
                            class="btn btn-outline-light btn-sm mx-2">Locations</a>
                        <a href="addTimings?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Timings</a>
                        <a href="addTrainType?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Add
                            Train</a>
                        <a href="addPriceList?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">Price</a>
                        <a href="readTrain?email=${dto.email}" class="btn btn-outline-light btn-sm mx-2">View Data</a>
                    </nav>


                    <div class="dropdown mb-1">
                        <img src="getImage/${dto.fileName}" class="rounded-circle mx-2" alt="img" width="90"
                            data-bs-toggle="modal" data-bs-target="#imageModal" />
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

            <!-- Image Modal -->
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

            <div class="card mx-auto" style="max-width: 800;border-radius: 15px; overflow: hidden;">
                <div class="card-body" style="background-color: white;">
                    <div style="max-width: 500px; margin: auto;">
                        <div class="mb-3">
                            <h5 class="mb-0"></h5>
                        </div>
                        <div class="card-auto">
                            <div class="card-body">
                                <form action="price/${dto.email}" method="post">
                                    <div class="col-md-6 mb-1">
                                        <div>
                                            <h5 class="text-right" style="color:black">ADD PRICE :</h5>
                                        </div>
                                    </div>
                                    <label for="email" class="form-label" hidden>email</label>
                                    <input type="text" name="email" id="trainNumber" class="form-control"
                                        placeholder="Enter the email" value="${dto.email}" hidden>
                            </div>
                            <div class="mb-3">
                                <label for="source" style="color:black" class="form-label">Select Source
                                    Station</label>
                                <select name="source" id="sourceId" class="form-control" required>
                                    <option value="">Select Source Station</option>
                                    <!-- Purple Line Stations -->
                                    <optgroup label="Purple Line">
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
                                    </optgroup>
                                    <!-- Green Line Stations -->
                                    <optgroup label="Green Line">
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
                                    </optgroup>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="destination" style="color:black" class="form-label">Select Destination
                                    Station</label>
                                <select name="destination" onBlur="destination()" id="destinationId"
                                    class="form-control" required>
                                    <option value="">Select Destination Station</option>
                                    <!-- Purple Line Stations -->
                                    <optgroup label="Purple Line">
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
                                    </optgroup>
                                    <!-- Green Line Stations -->
                                    <optgroup label="Green Line">
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
                                    </optgroup>
                                </select>
                            </div>


                            <div class="mb-3">
                                <label for="addTrainType" style="color:black" class="form-label">Add Train
                                    Type</label>
                                <select name="trainType" id="trainType" class="form-control" required>
                                    <option value="">Select Train Type</option>
                                    <option value="Purple">Purple</option>
                                    <option value="Green">Green</option>
                                </select>
                            </div>


                            <div class="mb-3">
                                <label for="distance" style="color:black" class="form-label">distance*</label>
                                <input type="text" name="distance" id="distance" class="form-control "
                                    placeholder="Enter the distance">
                            </div>

                            <div class="mb-3">
                                <label for="station" style="color:black" class="form-label">Select Station</label>
                                <select name="station" id="station" class="form-control" required>
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
                                    <option value="Mantri Square Sampige Road">Mantri Square Sampige Road</option>
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

                            <div class="mb-3">
                                <label for="stationNumber" style="color:black" class="form-label">Station
                                    Number*</label>
                                <input type="number" name="stationNumber" id="stationNumber" class="form-control"
                                    placeholder="Enter the stationNumber">
                            </div>

                            <div class="mb-3">
                                <label for="trainNumber" style="color:black" class="form-label">Train
                                    Number*</label>
                                <input type="text" name="trainNumber" id="trainNumber" class="form-control"
                                    placeholder="Enter the Train Number">
                            </div>

                            <button type="submit" id="button" class="btn btn-danger btn-sm rounded-pill">Add</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
            </div>
            <div class="d-flex justify-content-between align-items-center" hidden>
                <form action="price" class="d-inline" hidden>
                    <input type="number" name="price" class="form-control d-inline" style="width: auto;" hidden>
                    <input type="submit" value="search By price" hidden>
                </form hidden>
                <div class="d-flex justify-content-between align-items-center" hidden>
                    <form action="sourceAndDestination" class="d-inline" hidden>
                        <input type="text" name="source" class="form-control d-inline" style="width: auto;" hidden>
                        <input type="text" name="destination" class="form-control d-inline" style="width: auto;" hidden>
                        <input type="submit" value="search By price" hidden>
                    </form>
                </div>
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

            <script type="text/javascript">
                const destination = () => {
                    let source = document.getElementById("sourceId").value;
                    let destination = document.getElementById("destinationId").value;
                    let button = document.getElementById("button");
                    console.log("source: " + source);
                    console.log("destination: " + destination);
                    if (source === destination) {
                        button.disabled = true;
                    } else {
                        button.disabled = false;
                    }
                }
                document.getElementById("sourceId").addEventListener("change", destination);
                document.getElementById("destinationId").addEventListener("change", destination);
            </script>

            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>

        </body>

        </html>