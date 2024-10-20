<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

<html>
    <head>
        <title>Login</title>
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

            </div>
            <div class="col-auto d-flex ">
              <button type="button" class="btn btn-primary me-2">
                <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
              </button>
              <button type="button" class="btn btn-primary me-2">
                <a href="registerPage" style="text-decoration: none; color: white;">Register</a>
              </button>
              <button type="button" class="btn btn-primary">
              <a href="loginPage"  style="text-decoration: none; color: white;">Login</a>
               </button>
            </div>
          </div>
        </div>
      </header>

      <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;" >
            <div class="p-3 bg-light.bg-gradient">
            <div class="card-body ">

<form action="otp" method="post">
    <div class="mb-3">
      <h6 style="color: red;text-align: center;">${blockedMessage}</h6>
        <label for="formGroupExampleInput2" class="form-label">Enter Email</label>
        <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email" value="${emailDto.email}" onblur="checkEmail()">
          <span id="emailExists"></span>
          <h6 style="color: green;text-align: center;">${sentMessage}</h6>

        <div class="text-center">
          <div class="col-12">
            <button type="submit" class="btn btn-secondary" id="sendOtp">
              Send Otp
            </button>
        </div>
      </div>
      </div>
    </form>
    
   
      <form action="verifyOtp" method="get">
      <div class="mb-3">

        <input type="email" class="form-control" placeholder="Enter your email" name="email" value="${emailDto.email}" hidden>
        <label for="inputPassword5" class="form-label">Enter Otp</label>
        <input type="password" class="form-control" placeholder="Enter your otp" name="optEntered" >
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

<footer class="fixed-bottom">
        <div  class="footer  bg-dark py-3 mt-auto">
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


const checkEmail = async () => {

let emailId = document.getElementById("email").value
var button = document.getElementById("sendOtp");
var button=document.getElementById("verifyOtp");
const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId)

if (emailId.length < 5) {
  document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
  button.setAttribute("disabled", "");
  button.setAttribute("disabled","");
} else if (response.data == "email already exists") {
  document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
  button.removeAttribute("disabled");
 button.removeAttribute("disabled");
  
} else {
  document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email not exists</span>";
  button.setAttribute("disabled", "");
 button.setAttribute("disabled","");
}

console.log(response.data)


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





</script>


    
      </body>
      </html>