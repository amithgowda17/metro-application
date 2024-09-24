<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>

<html>
    <head>
        <title>Login</title>
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

    <h1 style="color: red;">${loginerrmsg}</h1>
    <div class="position-absolute top-50 start-50 translate-middle">

        <div class="card mb-3" style="width: 20rem;" >
            <div class="p-3 bg-light.bg-gradient">
            <div class="card-body ">

<form action="login" method="post">

    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Email</label>
        <input type="email" class="form-control" placeholder="Enter your email" name="email">
      </div>
      <div class="mb-3">
        <label for="inputPassword5" class="form-label">Password</label>
        <input type="password" class="form-control" placeholder="Enter your password" name="password" >
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Login</button>
        <button type="reset" class="btn btn-primary">Reset</button>
    </div>
</pre>
</form>
</div>
</div>
</div>
</div>
</body>
</html>