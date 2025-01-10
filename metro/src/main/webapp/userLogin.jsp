<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title></title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
        </head>
        </body>
        <header class="bg-dark text-white text-center py-3">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Logo -->
                <img src="https://www.x-workz.in/Logo.png" alt="Coders World Logo" style="max-height: 50px;">

                <!-- Heading -->
                <h1 class="text-center mb-0 flex-grow-1"></h1>
            </div>
        </header>
        <h3
            style="font-family: 'Arial', sans-serif; text-align: center; margin-right: -237px; margin-top: 35px; font-size: 20px; color: black; letter-spacing: 2px; text-transform: uppercase;">
            My Account</h3>
        <div class="container mt-5">
            <div class="row">
                <!-- Image Column on the Left -->
                <div class="col-md-6 d-flex justify-content-center align-items-center">
                    <div id="carouselExampleSlidesOnly" class="carousel" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.tripsavvy.com/thmb/n2oAmjOEl-P3r8VXiuv2hu9bqZc=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1081803176-fd11b444454a416ca43a88be77eaeed6.jpg"
                                    class="d-flex justify-content-between align-items-center"
                                    style="max-height: 300px; max-width:4000px">
                            </div>
                            <div class="carousel-item">
                                <img src="https://english.bmrc.co.in/images/metro/banner1.jpg"
                                    style="max-height: 300px;">
                            </div>
                            <div class="carousel-item ">
                                <img src="https://english.bmrc.co.in/images/metro/homepage/about-us.jpg"
                                    style="max-height: 300px;">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mx-5" style="max-width: 500px;">
                    <div class="card-body bg-light">
                        <form action="User" class="row g-3">
                            <b>Login:</b>
                            <div class="mb-1">
                                <span for="emailId" id="emailLabelId" class="form-label">User Email*</span>
                                <input type="email" id="email" onblur="checkEmail()" name="email"
                                    placeholder="User@gmail.com" id="emailId" class="form-control"
                                    value="${email.email}" required>
                                    <span id="emailExists"></span>
                            </div>
                            <div class="col-auto">
                                <button type="submit" name="button" id="button1"
                                    class="btn btn-primary btn-sm rounded-sm border border-light rounded-pill">Get
                                    OTP</button>
                            </div>
                            <br>
                        </form>

                        <form action="loginHere">
                            <input type="email" id="email" name="email" placeholder="User@gmail.com" id="email"
                                value="${email.email}" hidden>
                            <input type="number" id="id" name="id" value="${email.id}" hidden>
                            <div class="mb-3">
                                <input type="text" placeholder="Enter OTP" name="otp" class="form-control">
                                <h7 class="text-center" style="color:red">${emailError}</h7>
                            </div>
                            <div class="mb-3">
                                <button type="submit" id="button"
                                    class="btn btn-dark btn-sm rounded-pill">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <h5 style="text-align:center; color:red;">${message}</h5>

        <div class="fixed-bottom">
            <footer class="bg-dark text-white text-center py-3 mt-4">
                <div class="container text-center">
                    <p class="mb-0"><a href="userLogin" style="text-decoration: none; color: white;">
                            <h7>Back</h7>
                        </a></p>
                </div>
            </footer>
        </div>
        <script type="text/javascript">

            $(document).ready(function () {
                setInterval(() => {
                    $(".carousel").carousel('next');
                }, 1000);
            });

            const checkEmail = async () => {

                     let emailId = document.getElementById("email").value
                     var button = document.getElementById("button1");
                     const response = await axios("http://localhost:8080/metro/findEmail?email=" + emailId)

                     if (emailId.length < 5) {
                       document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
                       button.setAttribute("disabled", "");
                     } else if (response.data == "email already exists") {
                       document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
                       button.removeAttribute("disabled");
                     } else {
                       document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email doesn't exists</span>";
                       button.setAttribute("disabled", "");
                     }
                     console.log(response.data)

                 }


        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>