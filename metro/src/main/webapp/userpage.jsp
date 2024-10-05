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
              <h1 class="my-0">X-Workz</h1>
            </div>
            <div class="col-auto d-flex ">
              <button type="button" class="btn btn-primary me-2">
                <a href="profileUpdate?email=${details.email}" style="text-decoration: none; color: white;">Profile</a>
              </button>
              <h6>${details.fname}</h6>
              
            </div>
          </div>
        </div>
      </header>
<h6  style="color: green;">${msg}</h6>
<h6 style="color: red;">${errmsg}</h6>
<h6  style="color: green;">${successmsg}</h6>


</script>
</body>
</html>