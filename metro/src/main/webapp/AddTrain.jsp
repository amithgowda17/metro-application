<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html>

            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                    crossorigin="anonymous">
                <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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


                <div style="max-width: 500px; margin: auto;">
                    <div class="mb-3">
                        <h5 class="mb-0"></h5>
                    </div>
                    <div class="card" style="border-radius: 15px; overflow: hidden;">
                        <div class="card-body" style="background-color: black;">
                            <form action="timings" method="post">
                                <div class="col-md-6 mb-1">

                                    <div class="mb-3">
                                        <div>
                                            <h5 class="text-right" style="color:white">ADD TIMINGS</h5>
                                        </div>
                                        <div class="mb-3">
                                            <label for="addTrainType" style="color:white" class="form-label">Add Train
                                                Type</label>
                                            <select name="trainType" id="trainType" class="form-control" required>
                                                <option value="">Select Train Type</option>
                                                <option value="Purple">Purple</option>
                                                <option value="Green">Green</option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="trainNumber" style="color:white" class="form-label">Add
                                                trainNumber</label>
                                            <select name="trainNumber" id="trainNumber" class="form-control" required>
                                                <option value="">Select TrainNumber</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="email" class="form-label" hidden>email</label>
                                            <input type="email" name="email" class="form-control"
                                                placeholder="please enter a email" value="${dto.email}" hidden>
                                        </div>
                                        <div class="mb-3">
                                            <label for="from" style="color:white">Select From:</label>
                                            <input type="time" name="fromTime" id="from" class="form-control"
                                                placeholder="Please Enter a From" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="to" style="color:white">Select To:</label>
                                            <input type="time" name="toTime" id="to" class="form-control"
                                                placeholder="Please Enter a From" required>
                                        </div>

                                        <div class="mb-3">
                                            <label for="source" class="form-label" style="color:white">Select Source
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
                                                    <option value="Mantri Square Sampige Road">Mantri Square Sampige
                                                        Road</option>
                                                    <option value="Krantivira Sangolli Rayanna">Krantivira Sangolli
                                                        Rayanna (Majestic)</option>
                                                    <option value="Chickpete">Chickpete</option>
                                                    <option value="Krishna Rajendra Market">Krishna Rajendra Market
                                                    </option>
                                                    <option value="National College">National College</option>
                                                    <option value="Lalbagh">Lalbagh</option>
                                                    <option value="South End Circle">South End Circle</option>
                                                    <option value="Jayanagar">Jayanagar</option>
                                                    <option value="Rashtreeya Vidyalaya Road">Rashtreeya Vidyalaya Road
                                                    </option>
                                                    <option value="Banashankari">Banashankari</option>
                                                    <option value="Jaya Prakash Nagar">Jaya Prakash Nagar</option>
                                                    <option value="Yelachenahalli">Yelachenahalli</option>
                                                    <option value="Anjanapura">Anjanapura</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="destination" style="color:white" class="form-label">Select
                                                Destination Station</label>
                                            <select name="destination" obBlur="destination()" id="destinationId"
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
                                                    <option value="Mantri Square Sampige Road">Mantri Square Sampige
                                                        Road</option>
                                                    <option value="Krantivira Sangolli Rayanna">Krantivira Sangolli
                                                        Rayanna (Majestic)</option>
                                                    <option value="Chickpete">Chickpete</option>
                                                    <option value="Krishna Rajendra Market">Krishna Rajendra Market
                                                    </option>
                                                    <option value="National College">National College</option>
                                                    <option value="Lalbagh">Lalbagh</option>
                                                    <option value="South End Circle">South End Circle</option>
                                                    <option value="Jayanagar">Jayanagar</option>
                                                    <option value="Rashtreeya Vidyalaya Road">Rashtreeya Vidyalaya Road
                                                    </option>
                                                    <option value="Banashankari">Banashankari</option>
                                                    <option value="Jaya Prakash Nagar">Jaya Prakash Nagar</option>
                                                    <option value="Yelachenahalli">Yelachenahalli</option>
                                                    <option value="Anjanapura">Anjanapura</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        <div class="mb-2">
                                            <label class="form-label" style="color:white">Day of the Week</label>
                                            <div>
                                                <div class="mb-3">
                                                    <input class="form-check-input" type="radio" name="dayOfTheWeek"
                                                        id="regularDayId" value="MondayToFriday">
                                                    <label class="form-check-label" style="color:white"
                                                        for="flexRadioDefault1">Monday To Friday</label>
                                                    <br>
                                                    <input class="form-check-input" type="radio" name="dayOfTheWeek"
                                                        id="sundayId" value="Sunday">
                                                    <label class="form-check-label" style="color:white"
                                                        for="flexRadioDefault1">Sunday</label>
                                                    <br>
                                                    <input class="form-check-input" type="radio" name="dayOfTheWeek"
                                                        id="holidayId" value="Holiday">
                                                    <label class="form-check-label" style="color:white"
                                                        for="flexRadioDefault1">Holiday</label>

                                                </div>

                                            </div>

                                        </div>
                                        <button type="submit" id="button"
                                            class="btn btn-danger btn-sm  rounded-pill">Add</button>

                            </form>
                        </div>
                    </div>
                </div>

                </div>
                </div>
                <footer class="bg-dark text-white py-3">
                    <div class="container text-center">
                        <p class="mb-0"></p>
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
                            button.disabled = true;  // Disable the button
                        } else {
                            button.disabled = false;  // Enable the button
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