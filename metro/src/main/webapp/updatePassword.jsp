<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>X-workz</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>

    <body>

      <header class="header">
        <div class="container-fluid bg-secondary-subtle">
          <div class="row align-items-center">
            <div class="col-auto">
              <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="40px">
            </div>
            <div class="col text-center d-flex justify-content-center">
              <h1 class="my-0">X-Workz</h1>
            </div>
            <div class="col-auto d-flex align-items-center">
              <button type="button" class="btn btn-primary me-2">
                <a href="registerPage" style="text-decoration: none; color: white;">Register</a>
              </button>
              <button type="button" class="btn btn-primary">
                <a href="loginPage" style="text-decoration: none; color: white;">Login</a>
              </button>
            </div>
          </div>
        </div>
      </header>

      <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;">
          <div class="p-3 bg-light.bg-gradient">
            <div class="card-body ">

              <form action="updatePassword" method="post">
                <div class="mb-3">

                  <label for="formGroupExampleInput2" class="form-label">Enter Email</label>
                  <input type="email" class="form-control" placeholder="Enter your email" name="email"
                    value="${dto.email}" readonly>
                  
                </div>
             
                <div class="mb-3">

                  <label for="inputPassword5" class="form-label">Enter new password</label>
                  <input type="password" class="form-control" placeholder="Enter new password" name="password" id="password" onblur="passwordEntry()">
                  <span id="pass"></span>
                </div>
                <div class="mb-3">

                  <label for="inputPassword5" class="form-label">Confirm your password</label>
                  <input type="password" class="form-control" placeholder="confirm your password" name="confirmpassword" id="confirmPassword" onblur="confirm()">
               <span id="confirmpass"></span>
                </div>

                <div class="text-center"> 
                  <div class="col-12">
                    <button type="submit" class="btn btn-success" id="button">Submit</button>
                  </div>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>

      <script>

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

      </script>


    </body>

    </html>