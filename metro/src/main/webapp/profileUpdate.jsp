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
          </div>
        </div>
      </header>


      <div class="container my-4" style="width: 35%;">
        <div class="card form-card mb-3">
          <div class= "p-3 mb-2 bg-light-subtle text-light-emphasis">

            <form action="updateDetails" method="post" enctype="multipart/form-data">
              <div class="text-center">
                <img src="getImage/${dto.fileName}" style="height: 150px;width:150px;border-radius: 50px;">
              </div>
              <div style="margin-top: 8%;">
                <div class="row">



                  <input type="text" class="form-control" id="id" placeholder="Enter your id" name="id"
                    value="${dto.id}" hidden>


                  <div class="col-md-6 mb-3">
                    <label class="form-label">First name</label>
                    <input type="text" class="form-control" id="fName" placeholder="Enter your first name"
                      onchange="fNameValidation()" name="fname" value="${dto.fname}" required>
                    <span id="firstName"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lName" placeholder="Enter your last name"
                      onchange="lNameValidation()" name="lname" value="${dto.lname}" required>
                    <span id="lastName"></span>
                  </div>
                </div>


                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email"
                      value="${dto.email}" readonly>
                    <span id="emailExists"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label ">Contact Number</label>
                    <input type="number" class="form-control" id="phNo" placeholder="Enter your contact number"
                      name="phNo" onblur="phone()" value="${dto.phNo}" required>
                    <span id="ph"></span>
                  </div>

                </div>

                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dob"
                      value="${dto.dob}" required>
                  </div>



                  <div class="col-md-6 mb-3">
                    <label class="form-label">Gender</label>
                    <div>
                      <input type="radio" id="male" name="gender" value=" ${dto.gender == 'female' ? 'checked' : ''}>">
                      <label for="male">Male</label>
                      <input type="radio" id="female" name="gender"
                        value=" ${dto.gender == 'female' ? 'checked' : ''} ">
                      <label for="male">Female</label>
                      <span id="genderError"></span>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">City</label>
                    <input type="text" class="form-control" id="city" required placeholder="Enter your city"
                      onchange="cityName()" name="city" value="${dto.city}">
                    <span id="cityName"></span>
                  </div>


                  <div class="col-md-6 mb-3">
                    <label class="form-label">Pincode</label>
                    <input type="number" class="form-control" id="pinCode" required placeholder="Enter your pincode"
                      name="pinCode" onchange="pinCodeValid()" value="${dto.pinCode}">
                    <span id="pin"></span>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">

                  <input type="password" class="form-control" id="password" required placeholder="Enter your password"
                    name="password" value="${dto.password}" hidden>
                  <span id="pass"></span>
                </div>


                <div class="col-md-6 mb-3">

                  <input type="password" class="form-control" id="confirmPassword" required
                    placeholder="Confirm your password" name="confirmPassword" value="${dto.password}" hidden>
                  <span id="confirmPass"></span>
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Profile</label>
                <input type="file" name="file" />
              </div>

              <div class="row">
                <div class="text-center">
                  <button id="button" type="submit" class="btn btn-primary">Edit</button>
                  <button type="button" class="btn btn-primary">
                    <a href="getUserPage?email=${dto.email}" style="text-decoration: none; color: white;">Back</a>
                  </button>
                </div>
              </div>
          </div>
          </form>

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
            document.getElementById("firstName").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("firstName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function lNameValidation() {
          var names = document.getElementById("lName").value;
          console.log(names)
          var button = document.getElementById("button");
          if (names.trim() !== '' && names.length > 0 && names.length <= 25) {
            document.getElementById("lastName").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("lastName").innerHTML = "<span style='color:red;'>must be 1 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function cityName() {
          var names = document.getElementById("city").value;
          console.log(names)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length > 4 && names.length <= 25) {
            document.getElementById("cityName").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("cityName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
            button.setAttribute("Disabled", "");
            return;
          }

        }

        function pinCodeValid() {
          var names = document.getElementById("pinCode").value;
          console.log(names.length)
          var button = document.getElementById("button");

          if (names.trim() !== '' && names.length == 6) {
            document.getElementById("pin").innerHTML = "";
            button.removeAttribute("Disabled");
          } else {
            document.getElementById("pin").innerHTML = "<span style='color:red;'>Invalid Pincode</span>";
            button.setAttribute("Disabled", "");
            console.log("invalid")
            return;
          }

        }

        const phone = async () => {

          let phoneNumber = document.getElementById("phNo").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/isPhNoExists?phNo=" + phoneNumber)

          if (phoneNumber.length < 10 || phoneNumber.length > 10) {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
            button.setAttribute("disabled", "");
          } else if (response.data == "phone number not exists" || phoneNumber == "${dto.phNo}") {
            console.log(phoneNumber)
            document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
            button.removeAttribute("disabled");
          } else {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
            button.setAttribute("disabled", "");
          }
          console.log(response.data)
        }

        document.addEventListener("DOMContentLoaded", function () {

          const gender = "${dto.gender}";
          document.getElementById(gender).checked = true;
        });





      </script>

    </body>

    </html>