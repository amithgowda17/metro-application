<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Register</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    </head>

    <body>

      <header class="header">
        <div class="container-fluid bg-secondary-subtle">
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
                <a href="loginPage" style="text-decoration: none; color: white;">Login</a>
              </button>
            </div>
          </div>
        </div>
      </header>


      <div class="container my-4" style="width: 35%;">
        <div class="card form-card mb-3">
          <div class="p-3 bg-secondary-subtle text-secondary-emphasis">


            <form action="userRegistration" method="post" onclick="form()">

              <h3 class="row justify-content-center">Register Admin</h3>

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
                    <label class="form-label ">Contact Number</label>
                    <input type="number" class="form-control" id="phNo" placeholder="Enter your contact number"
                      name="mobileNumber" onblur="phone()" required>
                    <span id="ph"></span>
                  </div>

                </div>

                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dateOfBirth" required>
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
                  <button id="button" type="submit" class="btn btn-primary">Register</button>
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

      <footer>
        <div class="footer  bg-dark py-3 mt-auto">
          <div class="container-fluid">
            <div class="row justify-content-center">
              <div class="col-md-6 text-center">
                <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
              </div>
            </div>
          </div>
        </div>
      </footer>

      <script>

        function fNameValidation() {
          var names = document.getElementById("fName").value;
          console.log(names)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length > 3 && names.length <= 25) {
            document.getElementById("fName").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("fName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function lNameValidation() {
          var names = document.getElementById("lName").value;
          console.log(names)
          var button = document.getElementById("button");
          if (names.trim() !== '' && names.length > 0 && names.length <= 25) {
            document.getElementById("lName").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("lName").innerHTML = "<span style='color:red;'>must be 1 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }



        function passwordEntry() {

          var names = document.getElementById("password").value;
          console.log(names)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length >= 8 && names.length <= 20) {
            document.getElementById("pass").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("pass").innerHTML = "<span style='color:red;'>Password must be 8 characters long</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }


        function confirm() {
          let password = document.getElementById("password").value;
          let checkPassword = document.getElementById("confirmPassword").value;
          console.log(password, checkPassword);
          var button = document.getElementById("button");

          if (password === checkPassword) {
            document.getElementById("confirmPass").innerHTML = "";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("confirmPass").innerHTML = "<span style='color:red;'>Password doesn't match</span>";
            button.setAttribute("disabled", "");
          }
        }

        const checkEmail = async () => {

          let emailId = document.getElementById("email").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/findEmail?email=" + emailId)

          if (emailId.length < 5) {
            document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
            button.setAttribute("disabled", "");
          } else if (response.data == "email already exists") {
            document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email already exists</span>";
            button.setAttribute("disabled", "");
          } else {
            document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
            button.removeAttribute("disabled");
          }
          console.log(response.data)

      }


        const phone = async () => {

          let phoneNumber = document.getElementById("phNo").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/phoneNumberExists?mobileNumber=" + phoneNumber)

          if (phoneNumber.length < 10 || phoneNumber.length > 10) {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
            button.setAttribute("disabled", "");
          } else if (response.data == "phone number already exists") {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
            button.setAttribute("disabled", "");
          } else {
            document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
            button.removeAttribute("disabled");
          }

          console.log(response.data)


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
            fName.trim() !== "" && fName.length > 3 && fName.length <= 25 &&
            lName.trim() !== "" && lName.length > 0 &&
            lName.length <= 25 && city.trim() !== "" &&
            email.trim() !== "" && phNo.trim() !== "" &&
            phNo.length == 10 && password.trim() !== "" &&
            password.length >= 8 && password === confirmPassword
          ) {
            if (maleChecked || femaleChecked) {
              document.getElementById("formMessage").innerHTML = "";
              button.removeAttribute("disabled");
            } else {
              document.getElementById("formMessage").innerHTML = "<span style='color:red;'>Please fill the form correctly</span>";
              button.setAttribute("disabled", "");
            }

          } else {
            document.getElementById("formMessage").innerHTML = "<span style='color:red;'>Please fill the form correctly</span>";
            button.setAttribute("disabled", "");
          }
        }


        const now = new Date().toISOString().split('T')[0];
        document.getElementById('dob').setAttribute('max', now);



      </script>

    </body>

    </html>