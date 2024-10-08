<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page isELIgnored="false" %>

    <html>

    <head>
     
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


                 </div>
               </div>
             </div>
           </header>



      <div class="container my-4" style="width: 35%;">
        <div class="card form-card mb-3">
          <div class="p-3 bg-secondary-subtle text-secondary-emphasis">

            <form action="updateDetails" method="post">
              <div style="margin-top: 8%;">
                <div class="row">

                  <input type="text" class="form-control" id="id" placeholder="Enter your id"
                                         name="id" hidden value="${dto.id}">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">First name</label>
                    <input type="text" class="form-control" id="fname" placeholder="Enter your first name"
                     name="fname" required value="${dto.fname}">
                    <span id="firstname"></span>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lname" placeholder="Enter your last name"
                     name="lname" required value="${dto.lname}">
                    <span id="lastname"></span>
                  </div>
                </div>


                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" 
                      placeholder="Enter your email" name="email" required value="${dto.email}" readonly>
                    <span id="emailexists"></span>
                  </div>

                    <div class="col-md-6 mb-3">
                                     <label class="form-label ">Contact Number</label>
                                     <input type="number" class="form-control" id="phno" placeholder="Enter your contact number"
                                       name="phNo" onchange="phone()" value="${dto.phNo}" required>
                                     <span id="ph"></span>
                                   </div>

                </div>

                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dob" required value="${dto.dob}">
                  </div>



<div class="col-md-6 mb-3">
    <label class="form-label">Gender</label>
    <div>
        <input type="radio" id="male" name="gender" value="male" ${dto.gender == 'male' ? 'checked' : ''}>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female" ${dto.gender == 'female' ? 'checked' : ''}>
        <label for="female">Female</label>
    </div>
</div>


                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">City</label>
                    <input type="text" class="form-control" id="city" required placeholder="Enter your city"
                       name="city"  value="${dto.city}">
                    <span id="cityname"></span>
                  </div>


                  <div class="col-md-6 mb-3">
                    <label class="form-label">Pincode</label>
                    <input type="number" class="form-control" id="pincode" required placeholder="Enter your pincode"
                      name="pincode"   value="${dto.pincode}">
                    <span id="pin"></span>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    
                    <input type="password" class="form-control" id="password" required placeholder="Enter your password"
                      name="password"   value="${dto.password}" hidden>
                    <span id="pass"></span>
                  </div>


                  <div class="col-md-6 mb-3">
                    
                    <input type="password" class="form-control" id="confirmPassword" required
                      placeholder="Confirm your password"  name="confirmpassword"   value="${dto.password}" hidden >
                    <span id="confirmpass"></span>
                  </div>
                </div>

                

                <div class="row">
                  <div class="text-center">
                    <button id="button" type="submit" class="btn btn-primary">Edit</button>
                
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



        const phone = async () => {

          let phoneNumber = document.getElementById("phno").value
          var button = document.getElementById("button");
          const response = await axios("http://localhost:8080/metro/isPhnoExists?phNo=" + phoneNumber)

          if (phoneNumber.length < 10 || phoneNumber.length > 10) {
            document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
            button.setAttribute("disabled", "");
          } else if(response.data == "phone number not exists" || phoneNumber =="${dto.phNo}") {
            console.log(phoneNumber)
            document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
            button.removeAttribute("disabled");
          }else{
            document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
            button.setAttribute("disabled", "");
          }
          console.log(response.data)
        }



    document.addEventListener("DOMContentLoaded", function() {
        const gender = "${dto.gender}";
        document.getElementById(gender).checked = true;
    });


      </script>

    </body>

    </html>