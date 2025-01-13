<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title>Success</title>
            <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-..." crossorigin="anonymous">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>

        <body>

            <header class="bg-dark text-white text-center py-3">
                <div class="d-flex justify-content-between align-items-center">

                    <img src="https://www.x-workz.in/Logo.png" alt="Coders World Logo" style="max-height: 50px;">
                    <nav class="d-flex justify-content-center">
                        <a href="addLocations?email=${dto.email}" class="btn btn-dark btn-sm mx-2 ">Locations</a>
                        <a href="addTimings?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Timings</a>
                        <a href="addTrainType?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Add Train</a>
                        <a href="addPriceList?email=${dto.email}" class="btn btn-dark btn-sm mx-2">Price</a>
                        <a href="readTrain?email=${dto.email}" class="btn btn-dark btn-sm mx-2">View Data</a>

                    </nav>


                    <h1 class="text-center mb-0 flex-grow-1"></h1>

                    <div class="dropdown mb-1">
                        <img src="${pageContext.servletContext.contextPath}/getImage/${dto.imageName}"
                            class="rounded-circle mx-2" alt="img" width=90 />
                        <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                            role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                            ${dto.userName}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="${dto.userName}">
                            <a class="dropdown-item" href="UpdateProfile?email=${dto.email}">Profile</a>
                            <a class="dropdown-item" href="inLogin">Log out</a>
                        </div>
                    </div>
                </div>
            </header>
            </form>
            <div class="text-center mt-5">
                <img src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/89e28a21893757.5665bb0b83d22.gif"
                    alt="Descriptive Alt Text" class="img-fluid" style="max-height: 400px; width:1200;">
            </div>

            <input type="email" value="${dto.email}" hidden>
            <h5 style="text-align:center; color:green;">${success}</h5>
            <h5 style="text-align:center; color:green;">${loginSuccess}</h5>
            <h5 style="text-align:center; color:green;">${model}</h5>
            <h5 style="text-align:center; color:green;">${message}</h5>
            <h5 style="text-align:center; color:red;">${errMsg}</h5>

            <div class="fixed-bottom">
                <footer class="bg-dark text-white text-center py-3 mt-4">
                    <div class="container text-center">
                        <p class="mb-0"><a href="inLogin" style="text-decoration: none">
                                <h7>Back</h7>
                            </a></p>
                    </div>
                </footer>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>
        </body>

        </html>