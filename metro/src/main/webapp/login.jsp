<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<html>

<head>
  <title>Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>

  <header class="header bg-dark">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="col-auto">
          <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
        </div>
        <div class="col text-center d-flex justify-content-center">
          <h1 class="my-0 text-white">X-Workz</h1>
        </div>
        <div class="col-auto d-flex">
          <button type="button" class="btn btn-primary me-2">
            <a href="indexPage" style="text-decoration: none; color: white;">Home</a>
          </button>
        </div>
      </div>
    </div>
  </header>

  <div class="container mt-5">
    <div class="row">
      <!-- Left Column: Carousel -->
      <div class="col-md-6">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="https://upload.wikimedia.org/wikipedia/commons/5/54/Namma_Metro%27s_Purple_Line_trainset.jpg"
                class="d-block w-100" alt="..." style="height: 100%;">
            </div>
            <div class="carousel-item">
              <img src="https://www.orientrailjourneys.com/storage/blogs/b0da33bb8a433187b6a897bdf7e373fd.jpg"
                class="d-block w-100" alt="..." style="height: 100%;">
            </div>
            <div class="carousel-item">
              <img src="https://www.bigproperty.in/blog/wp-content/uploads/2023/10/Bangalore-Metro.png"
                class="d-block w-100" alt="..." style="height: 100%;">
            </div>
            <div class="carousel-item">
              <img src="https://www.newprojectstracker.com/blog/wp-content/uploads/2022/06/RITES-files-DPR-for-two-corridors-of-BMRCL.jpg"
                class="d-block w-100" alt="..." style="height: 100%;">
            </div>
          </div>
        </div>
      </div>


      <div class="col-md-4 offset-md-1">
        <div class="card mb-3" style="width: 20rem;">
          <div class="card-header text-center bg-primary text-white">
            <h5>Admin Login</h5> <!-- Title inside the card -->
          </div>
          <div class="p-3 bg-light">
            <div class="card-body">
              <h6 style="color: green;text-align: center;">${success}</h6>
              <form action="login" method="post">
                <div class="mb-3">
                  <label for="formGroupExampleInput2" class="form-label">Email</label>
                  <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email"
                    onblur="checkEmail()" value="${enteredEmail}">
                  <span id="emailExists"></span>
                </div>
                <div class="mb-3">
                  <label for="inputPassword5" class="form-label">Password</label>
                  <input type="password" class="form-control" placeholder="Enter your password" name="password">
                  <h6 style="color: red;text-align: center;">${loginErrMsg}</h6>
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
    </div>


    <div class="container my-5">
      <div class="row">
        <div class="col-md-4 d-flex align-items-stretch">
          <div class="card">
            <img src="http://i.imgur.com/T2VyYeM.jpg" class="card-img-top" alt="Image 1">
            <div class="card-body">
              <p class="card-text text-center">The metro is an efficient, fast, and eco-friendly way to travel within the city.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-flex align-items-stretch">
          <div class="card">
            <img src="https://maps-washington-dc.com/img/1200/dc-metro-rail-map.jpg" class="card-img-top" alt="Image 2">
            <div class="card-body">
              <p class="card-text text-center">Trains operate on time, ensuring that commuters can rely on the metro for timely travel.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-flex align-items-stretch">
          <div class="card">
            <img src="https://www.metrorailnews.in/wp-content/uploads/2020/06/697094-jaipur-metro-02-1.jpg" class="card-img-top" alt="Image 3">
            <div class="card-body">
              <p class="card-text text-center">The metro system is continuously expanding to serve more areas, making it easier for everyone.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>


  <footer class="footer">
    <div class="footer bg-dark py-3 mt-auto">
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
      var button = document.getElementById("button");
      const response = await axios("http://localhost:8080/metro/isEmailExists?email=" + emailId)
      if (emailId.length < 5) {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>invalid email</span>";
        button.setAttribute("disabled", "");
      } else if (response.data == "email already exists") {
        document.getElementById("emailExists").innerHTML = "<span style='color:green;'>email_accepted</span>";
        button.removeAttribute("disabled");
      } else {
        document.getElementById("emailExists").innerHTML = "<span style='color:red;'>email not exists</span>";
        button.setAttribute("disabled", "");
      }
      console.log(response.data)
    }
  </script>


  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
    crossorigin="anonymous"></script>
</body>

</html>
