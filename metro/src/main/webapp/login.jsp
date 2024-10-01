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
              <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="40px">
            </div>
            <div class="col text-center d-flex justify-content-center">
              <h1 class="my-0">X-Workz</h1>
            </div>
            <div class="col-auto d-flex ">
              <button type="button" class="btn btn-primary me-2">
                <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
              </button>
              <button type="button" class="btn btn-primary">
                <a href="registerPage" style="text-decoration: none; color: white;">Register</a>
              </button>
            </div>
          </div>
        </div>
      </header>

    <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;" >
            <div class="p-3 bg-light.bg-gradient">
            <div class="card-body ">

<form action="login" method="post">

    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Email</label>
        <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email" onblur="checkEmail()">
        <span id="emailexists"></span>
      </div>
      <div class="mb-3">
        <label for="inputPassword5" class="form-label">Password</label>
        <input type="password" class="form-control" placeholder="Enter your password" name="password" >
        <h6 style="color: red;text-align: center;">${loginerrmsg}</h6>
      </div>
      <div class="text-center">
      <div class="col-12">
        <button type="submit" class="btn btn-primary" id="button">Login</button>
    </div>
    <a href="forgotPassword" style="text-decoration: none;">Forgotten Password?</a>
  </div>
</form>
</div>
</div>
</div>
</div>
<script>


const checkEmail = async () => {

let emailId = document.getElementById("email").value
var button = document.getElementById("button");
const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId)

if (emailId.length < 5) {
  document.getElementById("emailexists").innerHTML = "<span style='color:red;'>invalid email</span>";
  button.setAttribute("disabled", "");
} else if (response.data == "email already exists") {
  document.getElementById("emailexists").innerHTML = "<span style='color:green;'>email_accepted</span>";
  button.removeAttribute("disabled");
  
} else {
  document.getElementById("emailexists").innerHTML = "<span style='color:red;'>email not exists</span>";
  button.setAttribute("disabled", "");
}

console.log(response.data)



}

</script>
</body>
</html>