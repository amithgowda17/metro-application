<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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
          <div class="col-auto d-flex justify-content-end">
            <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                ${details.fname}
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="profileUpdate?email=${details.email}">Profile</li>
                <li><a class="dropdown-item"  href="loginPage">Logout</a></li>
              </ul>
            </div>
         </div>
       </div>
     </div>
   </header>



<h6  style="color: green;">${msg}</h6>
<h6 style="color: red;">${errmsg}</h6>
<h6  style="color: green;">${successmsg}</h6>

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



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>