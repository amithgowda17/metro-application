<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Verify Otp</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>

    <body>


      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
            <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
          </a>
          <div class="d-flex ms-auto">
            <button class="btn btn-primary me-3">
              <a href="indexPage" class="text-white text-decoration-none">Home</a>
            </button>
            <button class="btn btn-primary">
              <a href="loginPage" class="text-white text-decoration-none">Login</a>
            </button>
          </div>
        </div>
      </nav>


      <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;">
          <div class="p-3 bg-light">
            <div class="card-body">
              <!-- Send OTP Form -->
              <form action="otp" method="post">
                <div class="mb-3">
                  <h6 style="color: red;text-align: center;">${blockedMessage}</h6>
                  <label for="formGroupExampleInput2" class="form-label">Enter Email</label>
                  <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email"
                    value="${emailDto.email}" onblur="checkEmail()">
                  <span id="emailExists"></span>
                  <h6 style="color: green;text-align: center;">${sentMessage}</h6>
                  <div class="text-center">
                    <div class="col-12">
                      <button type="submit" class="btn btn-secondary" id="sendOtp">Send Otp</button>
                    </div>
                  </div>
                </div>
              </form>

              <!-- Verify OTP Form -->
              <form action="verifyOtp" method="post">
                <div class="mb-3">
                  <input type="email" class="form-control" placeholder="Enter your email" name="email"
                    value="${emailDto.email}" hidden>
                  <label for="inputPassword5" class="form-label">Enter Otp</label>
                  <input type="password" class="form-control" placeholder="Enter your otp" name="optEntered">
                  <h6 style="color: red;text-align: center;">${optVerification}</h6>
                </div>
                <div class="text-center">
                  <div class="col-12">
                    <button type="submit" class="btn btn-success" id="verifyOtp">Verify Otp</button>
                  </div>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>


      <footer class="fixed-bottom footer bg-dark py-3">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-md-6 text-center">
              <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
            </div>
          </div>
        </div>
      </footer>

      <script>
        const checkEmail = async () => {
          let emailId = document.getElementById("email").value;
          var sendButton = document.getElementById("sendOtp");
          const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId);

          if (emailId.length < 5) {
            document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
            sendButton.setAttribute("disabled", "");
          } else if (response.data == "email already exists") {
            document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
            sendButton.removeAttribute("disabled");
          } else {
            document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email not exists</span>";
            sendButton.setAttribute("disabled", "");
          }
          console.log(response.data);
        };
      </script>

    </body>

    </html>