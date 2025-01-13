<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Reset Password</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>

    <body>


      <header class="header bg-dark">
        <div class="container-fluid">
          <div class="row align-items-center">
            <div class="col-auto">
              <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
            </div>
            <div class="col text-center d-flex justify-content-center">
              <h1 class="my-0 text-white">X-Workz</h1>
            </div>
            <div class="col-auto d-flex align-items-center">
              <button type="button" class="btn btn-primary">
                <a href="loginPage" class="text-decoration-none text-white">Login</a>
              </button>
            </div>
          </div>
        </div>
      </header>


      <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;">
          <div class="card-header text-center bg-dark text-white">
            <h5>Reset Password</h5>
          </div>
          <div class="p-3 bg-light">
            <div class="card-body">

              <form action="updatePassword" method="post">
                <!-- Email input -->
                <div class="mb-3">
                  <label for="formGroupExampleInput2" class="form-label">Enter Email</label>
                  <input type="email" class="form-control" placeholder="Enter your email" name="email"
                    value="${dto.email}" readonly>
                </div>


                <div class="mb-3">
                  <label for="inputPassword5" class="form-label">Enter New Password</label>
                  <input type="password" class="form-control" placeholder="Enter new password" name="password"
                    id="password" onblur="passwordEntry()">
                  <span id="pass"></span>
                </div>


                <div class="mb-3">
                  <label for="inputPassword5" class="form-label">Confirm Your Password</label>
                  <input type="password" class="form-control" placeholder="Confirm your password" name="confirmPassword"
                    id="confirmPassword" onblur="confirm()">
                  <span id="confirmPass"></span>
                </div>


                <div class="text-center">
                  <div class="col-12">
                    <button type="submit" class="btn btn-success" id="button" disabled>Reset</button>
                  </div>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>


      <footer class="fixed-bottom">
        <div class="footer bg-dark py-3 mt-auto">
          <div class="container-fluid">
            <div class="row justify-content-center">
              <div class="col-md-6 text-center">
                <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
              </div>
            </div>
          </div>
        </div>
      </footer>

      <!-- JavaScript for Form Validation -->
      <script>
        // Password validation function
        function passwordEntry() {
          var names = document.getElementById("password").value;
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length >= 8 && names.length <= 20) {
            document.getElementById("pass").innerHTML = "";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("pass").innerHTML = "<span style='color:red;'>Password must be 8 characters long</span>";
            button.setAttribute("disabled", "");
          }
        }

        // Confirm password validation function
        function confirm() {
          let password = document.getElementById("password").value;
          let checkPassword = document.getElementById("confirmPassword").value;
          var button = document.getElementById("button");

          if (password === checkPassword) {
            document.getElementById("confirmPass").innerHTML = "";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("confirmPass").innerHTML = "<span style='color:red;'>Passwords don't match</span>";
            button.setAttribute("disabled", "");
          }
        }
      </script>

    </body>

    </html>