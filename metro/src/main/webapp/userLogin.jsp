<html>

<head>
  <title>Login</title>
<link rel="icon" href="https://www.x-workz.in/Logo.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="d-flex flex-column min-vh-100">

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

  <div class="container mt-5 flex-grow-1">
    <div class="row justify-content-center">

      <div class="col-md-6 d-flex justify-content-center align-items-center">

        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" style="width: 100%; height: 100%;">
          <div class="carousel-inner" style="height: 100%;">
            <div class="carousel-item active" style="height: 100%;">
              <img src="https://www.tripsavvy.com/thmb/n2oAmjOEl-P3r8VXiuv2hu9bqZc=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1081803176-fd11b444454a416ca43a88be77eaeed6.jpg"
                class="d-block w-100" style="height: 100%; object-fit: cover;">
            </div>
            <div class="carousel-item" style="height: 100%;">
              <img src="https://planodemetro.com/wp-content/uploads/2020/05/metro-bangalore-fotos.jpg" class="d-block w-100" style="height: 100%; object-fit: cover;">
            </div>
            <div class="carousel-item" style="height: 100%;">
              <img src="https://english.bmrc.co.in/images/metro/homepage/about-us.jpg" class="d-block w-100" style="height: 100%; object-fit: cover;">
            </div>
          </div>
        </div>
      </div>


      <div class="col-md-6 d-flex justify-content-center align-items-center">
        <div class="card" id="loginCard" style="width: 100%; max-width: 400px;">
          <div class="card-body">
            <h5 class="card-title text-center text-primary mb-4">User Login</h5>


            <form action="User" class="row g-3">
              <div class="mb-3">
                <label for="email" class="form-label">User Email*</label>
                <input type="email" id="email" onblur="checkEmail()" name="email" placeholder="User@gmail.com"
                  class="form-control" required value="${email.email}">
                <span id="emailExists"></span>
              </div>


              <div class="d-flex justify-content-center mb-3">
                <button type="submit" name="button" id="button1" class="btn btn-primary btn-sm rounded-sm">
                  Get OTP
                </button>
              </div>
            </form>


            <h6 style="color: green;text-align: center;">${message}</h6>
             <h6 style="color: red;text-align: center;">${emailError}</h6>

            <form action="loginHere">
              <input type="email" id="email" name="email" placeholder="User@gmail.com" value="${email.email}" hidden>
              <input type="number" id="id" name="id" value="${email.id}" hidden>
              <div class="mb-3">
                <input type="text" placeholder="Enter OTP" name="otp" class="form-control">
              </div>

              <div class="d-flex justify-content-center">
                <button type="submit" id="button" class="btn btn-dark btn-sm rounded-pill">
                  Submit
                </button>
              </div>
            </form>

            <!-- Register Link -->
            <div class="text-center mt-3">
              <span>Don't have an account? <a href="userRegister" class="text-decoration-none">Register</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer bg-dark py-3 mt-auto">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-md-6 text-center">
          <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
        </div>
      </div>
    </div>
  </footer>

  <script type="text/javascript">
    // Automatically change images in carousel every 3 seconds
    $(document).ready(function () {
      setInterval(() => {
        $(".carousel").carousel('next');
      }, 3000); // Set carousel interval to 3 seconds

      // Dynamically adjust carousel height to match card height
      const adjustCarouselHeight = () => {
        const cardHeight = document.getElementById('loginCard').offsetHeight;
        const carousel = document.getElementById('carouselExampleSlidesOnly');
        carousel.style.height = cardHeight + 'px';

        const carouselItems = carousel.querySelectorAll('.carousel-item');
        carouselItems.forEach(item => {
          item.style.height = cardHeight + 'px';
        });
      };

      // Call adjustCarouselHeight on page load
      adjustCarouselHeight();

      // Adjust carousel height on window resize to maintain consistency
      window.addEventListener('resize', adjustCarouselHeight);
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

  <!-- Bootstrap JS and Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
