<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-..." crossorigin="anonymous">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
                    rel="stylesheet" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Dashboard</title>
            </head>

            <body>

                <header class="bg-dark text-white text-center py-3">
                    <div class="d-flex justify-content-between align-items-center">

                        <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
                        <div class="dropdown mb-1">
                            <img src="readImage/${details.imageName}" class="rounded-circle mx-2" alt="img" width="90"
                                data-bs-toggle="modal" data-bs-target="#imageModal" />
                            <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                                role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                ${details.firstName}
                            </a>
                            <button><a class="dropdown-item" href="metroTimings?email=${details.email}">Metro
                                    Timings</a></button>
                            <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                                <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>
                                <a class="dropdown-item" href="info?email=${details.email}">Information</a>
                                <a class="dropdown-item" href="smartCards?email=${details.email}">Smart Cards</a>
                                <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                            </div>
                            <button>
                                <a href="abc?userId=${details.id}&&email=${details.email}"
                                    style="color: black; text-decoration: none">View Ticket History</a>
                            </button>
                        </div>
                    </div>
                </header>

                <br>

                <div class="image-container" style="position: relative; width: 100%; text-align: center;">
                    <img src="https://en-media.thebetterindia.com/uploads/2017/06/Relax37-1152x603.jpg"
                        alt="Relaxing Image" style="width: 100%; height: auto;">
                    <div
                        style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 1;">
                    </div>
                </div>

                <div class="card mx-auto"
                    style="max-width: 800px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 2; width: 90%;">
                    <div class="card-body" style="background-color: rgba(255, 255, 255, 0.9); padding: 20px;">
                        <h4 class="card-title" style="text-align: center; font-weight: bold;"><b>JOURNEY FARE
                                CALCULATOR</b></h4>
                        <form action="ticketForm" id="ticketForm">
                            <div class="card mt-4">
                                <div class="card-body bg-white" style="background-color: rgba(255, 255, 255, 0.9);">
                                    <div class="row mb-3">
                                        <input type="email" id="email" name="email" placeholder="user@gmail.com"
                                            id="emailId" value="${details.email}" hidden>
                                        <input type="number" id="id" name="id" value="${details.id}" hidden>
                                        <div class="col-md-4">
                                            <label for="source" class="form-label">From:</label>
                                            <select class="form-select form-control select2" id="sourceBox"
                                                onchange="checkPrice()" name="source" aria-label="Source selection">
                                                <option selected>Select Source:</option>
                                                <c:forEach var="source" items="${uniqueSources}">
                                                    <option value="${source}">${source}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-4">
                                            <label for="destination" class="form-label">To:</label>
                                            <select class="form-select form-control select2" onchange="checkPrice()"
                                                id="selectBox" name="destination" aria-label="Destination selection">
                                                <option selected>Select Destination:</option>
                                                <c:forEach var="destination" items="${uniqueDestinations}">
                                                    <option value="${destination}">${destination}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-4" id="priceResult">
                                            <label for="price" name="labelPrice" id="labelPriceId"
                                                class="form-label">Price:</label>
                                            <input type="number" name="price" id="priceId" value="${price.price}"
                                                class="form-control form-control-sm" readonly>
                                            <p id="priceText"></p>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <button type="submit" id="submitBtn"
                                            class="btn btn-danger active btn-sm form-control form-control-sm"
                                            style="background-color: purple; color: white;">Book a Ticket</button>
                                    </div>
                                </div>
                                <pre style="text-align:center; color:green;">${booked}</pre>
                            </div>
                        </form>
                    </div>
                </div>

                <h5 style="text-align:center; color:green;">${price}</h5>

                <div class="container mt-5">
                    <h3
                        style="font-family: Arial, sans-serif; color: black; text-align: center; text-transform: uppercase; letter-spacing: 2px;">
                        Benefits Of Contactless Smart Cards
                    </h3>
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-md-4 d-flex flex-column align-items-start">

                                <img src="https://english.bmrc.co.in/images/metro/tickets/tickets-logo.jpg"
                                    alt="Descriptive Alt Text" class="img-fluid" style="height: 200px;">
                            </div>
                            <div class="col-md-4 d-flex flex-column align-items-center">

                                <img src="https://english.bmrc.co.in/images/metro/tickets/coin.jpg"
                                    alt="Descriptive Alt Text" class="img-fluid" style="max-height: 200px;">
                            </div>
                            <div class="col-md-4 d-flex flex-column align-items-end">

                                <img src="https://english.bmrc.co.in/images/metro/tickets/smartcard.jpg"
                                    alt="Descriptive Alt Text" class="img-fluid" style="max-height: 200px;">
                            </div>
                        </div>
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
                    $('.select2').select2();

                    const checkPrice = async () => {
                        const source = document.getElementById("sourceBox").value;
                        const destination = document.getElementById("selectBox").value;

                        if (!source || source === "Select Source:" || !destination || destination === "Select Destination:") {
                            document.getElementById("priceId").value = "";
                            document.getElementById("priceText").innerText = "Please select both source and destination.";
                            return;  // Exit if source or destination is not selected
                        }

                        try {
                            const response = await axios.get('http://localhost:8080/metro/sourceAndDestination', {
                                params: {
                                    source: source,
                                    destination: destination
                                },
                                headers: {
                                    'Accept': 'text/plain'
                                }
                            });

                            const price = response.data;

                            if (price && price !== "Not Found") {
                                document.getElementById("priceId").value = price;
                                document.getElementById("priceText").innerText = `${price}`;
                            } else {
                                document.getElementById("priceId").value = "";
                                document.getElementById("priceText").innerText = "Price not found.";
                            }
                        } catch (error) {
                            console.error("Error fetching price:", error);
                            document.getElementById("priceId").value = "";
                            document.getElementById("priceText").innerText = "Please select valid source and destination";
                        }
                    };


                    // Add event listeners to both source and destination dropdowns
                    document.getElementById("sourceBox").addEventListener('change', checkPrice);
                    document.getElementById("selectBox").addEventListener('change', checkPrice);
                </script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                    crossorigin="anonymous"></script>
            </body>

            </html>