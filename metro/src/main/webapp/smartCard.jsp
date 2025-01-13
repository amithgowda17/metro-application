<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>This is Coders World</title>
    <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                              <button>
                                                                  <a href="back?email=${details.email}" style="color: black; text-decoration: none">Home</a>
                                                              </button>
                              <button><a class="dropdown-item" href="metroTimings?email=${details.email}">Metro Timings</a></button>
                              <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                                  <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>

                                  <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                              </div>
                          </div>
                      </div>
                  </header>
    <br>
    <div class="card mx-auto" style="max-width: 500;max-height: 700">
        <div class="card-body  bg-light">
    <h3 style="font-family: Arial, sans-serif; color: black; text-align: center; text-transform: uppercase; letter-spacing: 2px;">
        Smart Cards
    </h3>
    <div style="text-align: center;">
        <img src="https://english.bmrc.co.in/images/metro/tickets/smartcard.jpg" alt="Smart Card" style="max-height: 300px; display: block; margin: auto;">
    <ul style="list-style-type: none; font-family: Arial, sans-serif; color: black; margin: auto;">
        <li>&#x27A4; Contactless Smart Cards available for Rs50</li>
        <li>&#x27A4; The travel value is different from the cost of card</li>
        <li>&#x27A4; Suitable for regular travellers.</li>
    </ul>
      </div>
   </div>
</div>



</body>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</html>