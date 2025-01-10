<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<html>

<head>
  <title>Login</title>
  <!-- Bootstrap 5 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <!-- Axios for API requests -->
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  <!-- jQuery for using $ -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">
  <!-- Header with Black Background -->
  <header class="bg-dark">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="col-auto">
          <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
        </div>
        <div class="col text-center d-flex justify-content-center">
          <h1 class="my-0 text-white">X-Workz</h1>
        </div>
        <div class="col-auto d-flex">
          <button type="button" class="btn btn-primary me-2">
            <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
          </button>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content Section -->
  <div class="container mt-5 flex-grow-1">
    <div class="row">
      <!-- Image Column on the Left -->
      <div class="col-md-6 d-flex justify-content-center align-items-center">
        <!-- Carousel for Slideshow -->
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="https://www.tripsavvy.com/thmb/n2oAmjOEl-P3r8VXiuv2hu9bqZc=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1081803176-fd11b444454a416ca43a88be77eaeed6.jpg"
                class="d-block w-100" style="max-height: 300px;">
            </div>
            <div class="carousel-item">
              <img src="https://english.bmrc.co.in/images/metro/banner1.jpg" class="d-block w-100" style="max-height: 300px;">
            </div>
            <div class="carousel-item">
              <img src="https://english.bmrc.co.in/images/metro/homepage/about-us.jpg" class="d-block w-100" style="max-height: 300px;">
            </div>
          </div>
        </div>
      </div>

      <!-- Login Form Column -->
      <div class="col-md-6">
        <div class="card mx-5" style="max-width: 500px;">
          <div class="card-body bg-light">
            <form action="User" class="row g-3">
              <b>Login:</b>
              <div class="mb-1">
                <span for="emailId" id="emailLabelId" class="form-label">User Email*</span>
                <input type="email" id="email" onblur="checkEmail()" name="email" placeholder="User@gmail.com"
                  id="emailId" class="form-control" value="${email.email}" required>
                <span id="emailExists"></span>
              </div>
              <div class="col-auto">
                <button type="submit" name="button" id="button1"
                  class="btn btn-primary btn-sm rounded-sm border border-light rounded-pill">Get OTP</button>
              </div>
            </form>

            <!-- OTP Submission Form -->
            <form action="loginHere">
              <input type="email" id="email" name="email" placeholder="User@gmail.com" value="${email.email}" hidden>
              <input type="number" id="id" name="id" value="${email.id}" hidden>
              <div class="mb-3">
                <input type="text" placeholder="Enter OTP" name="otp" class="form-control">
                <h7 class="text-center" style="color:red">${emailError}</h7>
              </div>
              <div class="mb-3">
                <button type="submit" id="button" class="btn btn-dark btn-sm rounded-pill">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- End of Main Content Section -->

  <!-- Footer at the Bottom -->
  <footer class="footer bg-dark py-3 mt-auto">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-md-6 text-center">
          <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
        </div>
      </div>
    </div>
  </footer>

  <!-- JavaScript -->
  <script type="text/javascript">
    // Automatically change images in carousel every 3 seconds
    $(document).ready(function () {
      setInterval(() => {
        $(".carousel").carousel('next');
      }, 3000); // Set carousel interval to 3 seconds
    });

    // Function to check the email using Axios
    const checkEmail = async () => {
      let emailId = document.getElementById("email").value;
      var button = document.getElementById("button1");
      const response = await axios("http://localhost:8080/metro/findEmail?email=" + emailId);

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
      console.log(response.data);
    }
  </script>

  <!-- Bootstrap JS and required dependencies -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
