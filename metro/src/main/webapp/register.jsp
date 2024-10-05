<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Register</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
            <h6 style="color: green;text-align: center;">${msg}</h6>

            <form action="register" method="post" onclick="form()">



              <h3 class="row justify-content-center">Register Admin</h3>


              <div style="margin-top: 8%;">
                <div class="row">

                  <span id="formessage"></span>

                  <input type="text" class="form-control" id="id" placeholder="Enter your id"
                                         name="id" hidden>


                  <div class="col-md-6 mb-3">
                    <label class="form-label">First name</label>
                    <input type="text" class="form-control" id="fname" placeholder="Enter your first name"
                      onchange="fnamevalidation()" name="fname" required>
                    <span id="firstname"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lname" placeholder="Enter your last name"
                      onchange="lnamevalidation()" name="lname" required>
                    <span id="lastname"></span>
                  </div>
                </div>


                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" onblur="checkEmail()"
                      placeholder="Enter your email" name="email" required>
                    <span id="emailexists"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label ">Contact Number</label>
                    <input type="number" class="form-control" id="phno" placeholder="Enter your contact number"
                      name="phNo" onblur="phone()" required>
                    <span id="ph"></span>
                  </div>

                </div>

                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dob" required>
                  </div>



                  <div class="col-md-6 mb-3">
                    <label class="form-label">Gender</label>
                    <div>
                      <input type="radio" id="male" name="gender" value="male">
                      <label for="male">Male</label>
                      <input type="radio" id="female" name="gender" value="female">
                      <label for="female">Female</label>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">City</label>
                    <input type="text" class="form-control" id="city" required placeholder="Enter your city"
                      onchange="cityname()" name="city">
                    <span id="cityname"></span>
                  </div>


                  <div class="col-md-6 mb-3">
                    <label class="form-label">Pincode</label>
                    <input type="number" class="form-control" id="pincode" required placeholder="Enter your pincode"
                      name="pincode" onchange="pincod()">
                    <span id="pin"></span>
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
                      placeholder="Confirm your password" onblur="confirm()" name="confirmpassword">
                    <span id="confirmpass"></span>
                  </div>
                </div>

                <div class="row">
                  <div class="text-center">
                    <button id="button" type="submit" class="btn btn-primary">Register</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                    <div class="mt-2">
                      Already have an account? <a href="loginPage" style="text-decoration: none;">Login</a>
                    </div>
                  </div>
                </div>
            </form>
          </div>
        </div>
      </div>
      </div>

      <script>

        function fnamevalidation() {
          var names = document.getElementById("fname").value;
          console.log(names)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length > 4 && names.length <= 25) {
            document.getElementById("firstname").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("firstname").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function lnamevalidation() {
          var names = document.getElementById("lname").value;
          console.log(names)
          var button = document.getElementById("button");
          if (names.trim() !== '' && names.length > 0 && names.length <= 25) {
            document.getElementById("lastname").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("lastname").innerHTML = "<span style='color:red;'>must be 1 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function cityname() {
          var names = document.getElementById("city").value;
          console.log(names)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length > 4 && names.length <= 25) {
            document.getElementById("cityname").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("cityname").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function pincod() {
          var names = document.getElementById("pincode").value;
          console.log(names.length)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length == 6) {
            document.getElementById("pin").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("pin").innerHTML = "<span style='color:red;'>Invalid Pincode</span>";
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
            document.getElementById("confirmpass").innerHTML = "";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("confirmpass").innerHTML = "<span style='color:red;'>Password doesn't match</span>";
            button.setAttribute("disabled", "");
          }
        }

        const checkEmail = async () => {

          let emailId = document.getElementById("email").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId)

          if (emailId.length < 5) {
            document.getElementById("emailexists").innerHTML = "<span style='color:red;'>invalid email</span>";
            button.setAttribute("disabled", "");
          } else if (response.data == "email already exists") {
            document.getElementById("emailexists").innerHTML = "<span style='color:red;'>email already exists</span>";
            button.setAttribute("disabled", "");
          } else {
            document.getElementById("emailexists").innerHTML = "<span style='color:green;'>email_accepted</span>";
            button.removeAttribute("disabled");
          }

          console.log(response.data)


        }


        const phone = async () => {

          let phoneNumber = document.getElementById("phno").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/isPhnoExists?phNo=" + phoneNumber)

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

          var fname = document.getElementById("fname").value;
          var lname = document.getElementById("lname").value;
          var city = document.getElementById("city").value;
          var email = document.getElementById("email").value;
          var phno = document.getElementById("phno").value;
          var password = document.getElementById("password").value;
          var confirmPassword = document.getElementById("confirmPassword").value;

          var button = document.getElementById("button");


          if (
            fname.trim() !== "" && fname.length > 4 && fname.length <= 25 &&
            lname.trim() !== "" &&lname.length > 0 &&
            lname.length <= 25 &&city.trim() !== "" &&
            city.length > 4 &&city.length <= 25 &&
            email.trim() !== "" &&phno.trim() !== "" &&
            phno.length == 10 &&password.trim() !== "" &&
            password.length >= 8 && password === confirmPassword
          ) {
            document.getElementById("formessage").innerHTML ="";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("formessage").innerHTML ="<span style='color:red;'>Please fill the form correctly</span>";
            button.setAttribute("disabled", "");
          }
        }



      </script>

    </body>

    </html>