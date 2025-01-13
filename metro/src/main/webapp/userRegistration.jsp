<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Register</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </head>

    <body class="d-flex flex-column min-vh-100">


      <header class="header bg-dark text-white">
        <div class="container-fluid">
          <div class="row align-items-center">
            <div class="col-auto">
              <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
            </div>
            <div class="col text-center d-flex justify-content-center">
              <h1 class="my-0">X-Workz</h1>
            </div>
            <div class="col-auto d-flex align-items-center">
              <button type="button" class="btn btn-primary me-2">
                <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
              </button>
              <button type="button" class="btn btn-primary">
                <a href="userCanLoginHere" style="text-decoration: none; color: white;">Login</a>
              </button>
            </div>
          </div>
        </div>
      </header>


      <div class="container my-4" style="width: 35%;">
        <div class="card form-card mb-3">
          <div class="p-3 bg-secondary-subtle text-secondary-emphasis">
            <form action="userRegistration" method="post" onsubmit="return form(event)">
              <h3 class="row justify-content-center">Register User</h3>

              <div style="margin-top: 8%;">
                <div class="row">
                  <span id="formMessage"></span>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">First name</label>
                    <input type="text" class="form-control" id="fName" placeholder="Enter your first name"
                      onchange="fNameValidation()" name="firstName" required>
                    <span id="firstName"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lName" placeholder="Enter your last name"
                      onchange="lNameValidation()" name="lastName" required>
                    <span id="lastName"></span>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" onblur="checkEmail()"
                      placeholder="Enter your email" name="email" required>
                    <span id="emailExists"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Contact Number</label>
                    <input type="number" class="form-control" id="phNo" placeholder="Enter your contact number"
                      name="mobileNumber" onblur="phone()" required>
                    <span id="ph"></span>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dateOfBirth"
                      required>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Gender</label>
                    <div>
                      <input type="radio" id="male" name="gender" value="male">
                      <label for="male">Male</label>
                      <input type="radio" id="female" name="gender" value="female">
                      <label for="female">Female</label>
                      <span id="genderError"></span>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" required placeholder="Enter your password"
                      name="password" onchange="passwordEntry()">
                    <span id="pass"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" required
                      placeholder="Confirm your password" onblur="confirm()" name="confirmPassword">
                    <span id="confirmPass"></span>
                  </div>
                </div>

                <div class="row">
                  <div class="text-center">
                    <button id="button" type="submit" class="btn btn-primary" disabled>Register</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                    <div class="mt-2">
                      Already have an account? <a href="userCanLoginHere" style="text-decoration: none;">Login</a>
                    </div>
                  </div>
                </div>
            </form>
          </div>
        </div>
      </div>
      </div>

      <footer class="bg-dark text-white py-3 mt-auto">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-md-6 text-center">
              <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
            </div>
          </div>
        </div>
      </footer>


      <script>
        function fNameValidation() {
          var names = document.getElementById("fName").value;
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length >= 4 && names.length <= 25) {
            document.getElementById("firstName").innerHTML = "";
            enableSubmitButton();
          } else {
            document.getElementById("firstName").innerHTML = "<span style='color:red;'>First name must be between 4 and 25 characters</span>";
            disableSubmitButton();
          }
        }

        function lNameValidation() {
          var names = document.getElementById("lName").value;
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length >= 1 && names.length <= 25) {
            document.getElementById("lastName").innerHTML = "";
            enableSubmitButton();
          } else {
            document.getElementById("lastName").innerHTML = "<span style='color:red;'>Last name must be between 1 and 25 characters</span>";
            disableSubmitButton();
          }
        }

        function passwordEntry() {
          var password = document.getElementById("password").value;
          var button = document.getElementById("button");

          if (password.length >= 8 && password.length <= 20) {
            document.getElementById("pass").innerHTML = "";
            enableSubmitButton();
          } else {
            document.getElementById("pass").innerHTML = "<span style='color:red;'>Password must be between 8 and 20 characters</span>";
            disableSubmitButton();
          }
        }

        function confirm() {
          var password = document.getElementById("password").value;
          var confirmPassword = document.getElementById("confirmPassword").value;
          var button = document.getElementById("button");

          if (password === confirmPassword) {
            document.getElementById("confirmPass").innerHTML = "";
            enableSubmitButton();
          } else {
            document.getElementById("confirmPass").innerHTML = "<span style='color:red;'>Passwords don't match</span>";
            disableSubmitButton();
          }
        }

        const checkEmail = async () => {
          let emailId = document.getElementById("email").value;
          var button = document.getElementById("button");

          if (emailId.length < 5) {
            document.getElementById("emailExists").innerHTML = "<span style='color:red;'>Invalid email</span>";
            disableSubmitButton();
          } else {
            const response = await axios("http://localhost:8080/metro/findEmail?email=" + emailId);
            if (response.data == "email already exists") {
              document.getElementById("emailExists").innerHTML = "<span style='color:red;'>Email already exists</span>";
              disableSubmitButton();
            } else {
              document.getElementById("emailExists").innerHTML = "<span style='color:green;'>Email is available</span>";
              enableSubmitButton();
            }
          }
        }

        const phone = async () => {
          let phoneNumber = document.getElementById("phNo").value;
          var button = document.getElementById("button");

          if (phoneNumber.length != 10) {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>Phone number must be 10 digits</span>";
            disableSubmitButton();
          } else {
            const response = await axios("http://localhost:8080/metro/phoneNumberExists?mobileNumber=" + phoneNumber);
            if (response.data == "phone number already exists") {
              document.getElementById("ph").innerHTML = "<span style='color:red;'>Phone number already exists</span>";
              disableSubmitButton();
            } else {
              document.getElementById("ph").innerHTML = "<span style='color:green;'>Phone number is valid</span>";
              enableSubmitButton();
            }
          }
        }

        function enableSubmitButton() {
          document.getElementById("button").removeAttribute("disabled");
        }

        function disableSubmitButton() {
          document.getElementById("button").setAttribute("disabled", "");
        }

        function form(event) {
          var fName = document.getElementById("fName").value;
          var lName = document.getElementById("lName").value;
          var email = document.getElementById("email").value;
          var phNo = document.getElementById("phNo").value;
          var password = document.getElementById("password").value;
          var confirmPassword = document.getElementById("confirmPassword").value;
          var maleChecked = document.getElementById("male").checked;
          var femaleChecked = document.getElementById("female").checked;
          var button = document.getElementById("button");

          if (
            fName.trim() !== "" && fName.length >= 4 && fName.length <= 25 &&
            lName.trim() !== "" && lName.length >= 1 && lName.length <= 25 &&
            email.trim() !== "" && phNo.trim() !== "" && phNo.length == 10 &&
            password.length >= 8 && password === confirmPassword && (maleChecked || femaleChecked)
          ) {
            return true;
          } else {
            document.getElementById("formMessage").innerHTML = "<span style='color:red;'>Please fill the form correctly</span>";
            return false;
          }
        }


        const now = new Date().toISOString().split('T')[0];
        document.getElementById('dob').setAttribute('max', now);
      </script>

    </body>

    </html>