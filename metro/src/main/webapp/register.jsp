<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
      <title>Register</title>
      <link rel="icon" href="https://www.x-workz.in/Logo.png">
      <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>

    <body>


      <h1 style="color: red;">${message}</h1>
      <h1 style="color: green;">${msg}</h1>

      <header class="header ">
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

        <form action="register" method="post">
        
          
          <h3 class="row justify-content-center">Register Admin</h3>
        

          <div style="margin-top: 8%;">
          <div class="row">
            
            <div class="col-md-6 mb-3">
              <label class="form-label">First name</label>
              <input type="text" class="form-control" id="fname" placeholder="Enter your first name" name="fname">
              <span id="firstname"></span>
            </div>

            <div class="col-md-6 mb-3">
              <label class="form-label">Last name</label>
              <input type="text" class="form-control" id="lname" placeholder="Enter your last name" name="lname">
              <span id="lastname"></span>
            </div>
            </div>


            <div class="row">
            
            <div class="col-md-6 mb-3">
              <label class="form-label">Email</label>
              <input type="email" class="form-control"  id="email" placeholder="Enter your email" name="email">
            </div>
            
            <div class="col-md-6 mb-3">
              <label class="form-label ">Contact Number</label>
              <input type="number" class="form-control"  id="phno" placeholder="Enter your contact number" name="phNo">
            </div>
            
          </div>

          <div class="row">

          <div class="col-md-6 mb-3">
            <label class="form-label">Date Of Birth</label>
            <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dob">
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
              <input type="text" class="form-control" id="city" placeholder="Enter your city" name="city">
            </div>
          

            <div class="col-md-6 mb-3">
              <label class="form-label">Pincode</label>
              <input type="number" class="form-control" id="pincode" placeholder="Enter your pincode" name="pincode">
            </div>   
      </div>
            
          <div class="row">
            <div class="col-md-6 mb-3">
              <label class="form-label">Password</label>
              <input type="password" class="form-control"  id="password" placeholder="Enter your password" name="password">
            </div>
          

            <div class="col-md-6 mb-3">
              <label class="form-label">Confirm Password</label>
              <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" name="confirmpassword">
            </div>   
      </div>

      <div class="row">
          <div class="text-center">
            <button type="submit" class="btn btn-primary">Register</button>
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

const checkFirstName=()=>{
   let firstName= document.getElementById("fname").value;
   console.log(firstName)
   if(firstName.length>3 && firstName.length<=20 && firstName.trim()!=='')
   {
   console.log("this is valid name");
   }
   else{
   document.getElementById("firstname").innerText="<span style='color:red'>first name should be greater than 3 and less than 20</span>"
   console.log("Invalid Name")}
}


   const checkLastName=()=>{
   let lastName= document.getElementById("lname").value;
   console.log(lastName)

   if(lastName.length>3 && lastName.length>=10 && firstName.trim()!=='')
   {
   console.log("this is valid name");
   }
   else{

    document.getElementById("lastname").innerText="<span style='color:red'>last name should be greater than 3 and less than 10</span>"

   console.log("Invalid Name")}
}

<!--
const checkEmail= async() => {

let emailId= document.getElementById("email").value

const response= await axios("http://localhost:8080/metro-application/email?email="+emailId)

console.log(response.data)

return response.data;
}


const checkMobileNumber=async()=>{
let mobileNumber= document.getElementById("mobileNumber").value
const response1= await axios('http://localhost:8080/metro-application/mobileNumber?mobileNumber=${mobileNumber}')
console.log(response1.data)
return response1.data;

}

    const checkPassword=()=>{
    let password=document.getElementById("password").value;
    console.log("password");
    if(password.length<6)
        document.getElementById("passwordError").textContent='password must be at least 6 characters long';
}

-->

</script>

    </body>

    </html>