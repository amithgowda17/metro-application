<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<html>

<head>
    <title>Register</title>
    <link rel="icon" href="https://www.x-workz.in/Logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body class="d-flex flex-column" style="min-height: 100vh;">

    <header class="header">
        <div class="container-fluid bg-secondary-subtle">
            <div class="row align-items-center">
                <div class="col-auto">
                    <img src="https://www.x-workz.in/Logo.png" alt="Logo" height="50px">
                </div>
                <div class="col text-center d-flex justify-content-center">
                    <h1 class="my-0">X-Workz</h1>
                </div>
            </div>
        </div>
    </header>


    <div class="container my-4" style="width: 35%;">
        <div class="card form-card mb-3">
            <div class="p-3 bg-secondary-subtle text-secondary-emphasis">
                <h6 style="color: green; text-align: center;">${msg}</h6>

                <form action="updateUserDetails" method="post" enctype="multipart/form-data">
                    <div class="text-center">
                        <img src="readImage/${dto.imageName}" style="height: 150px; width: 150px; border-radius: 50px;">
                    </div>

                    <div style="margin-top: 8%;">
                        <div class="row">
                            <input type="number" class="form-control" id="id" name="id" value="${dto.id}" hidden>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">First name</label>
                                <input type="text" class="form-control" id="fName" placeholder="Enter your first name" onchange="fNameValidation()" name="firstName" value="${dto.firstName}" required>
                                <span id="firstName"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Last name</label>
                                <input type="text" class="form-control" id="lName" placeholder="Enter your last name" onchange="lNameValidation()" name="lastName" value="${dto.lastName}" required>
                                <span id="lastName"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" onblur="checkEmail()" placeholder="Enter your email" name="email" value="${dto.email}" readonly>
                                <span id="emailExists"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Contact Number</label>
                                <input type="number" class="form-control" id="phNo" placeholder="Enter your contact number" name="phNo" onblur="phone()" value="${dto.mobileNumber}" required>
                                <span id="ph"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Date Of Birth</label>
                                <input type="date" class="form-control" id="dob" placeholder="Enter your dob" name="dateOfBirth" value="${dto.dateOfBirth}" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Profile</label>
                                <input type="file" name="file" id="fileInput" onchange="validateFileSize()" />
                                <span id="fileSizeError" style="color:red;"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input type="password" class="form-control" id="password" required placeholder="Enter your password" name="password" onchange="passwordEntry()" value="${dto.password}" hidden>
                                <span id="pass"></span>
                            </div>

                            <div class="col-md-6 mb-3">
                                <input type="password" class="form-control" id="confirmPassword" required placeholder="Confirm your password" onblur="confirm()" name="confirmPassword" value="${dto.password}" hidden>
                                <span id="confirmPass"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="text-center">
                                <button id="button" type="submit" class="btn btn-primary">Edit</button>
                                <button type="button" class="btn btn-primary">
                                    <a href="back?email=${dto.email}" style="text-decoration: none; color: white;">Back</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <footer class="mt-auto bg-dark py-3">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <script>
        function fNameValidation() {
            var names = document.getElementById("fName").value;
            var button = document.getElementById("button");

            if (names.trim() !== '' && names.length > 3 && names.length <= 25) {
                document.getElementById("firstName").innerHTML = "";
                button.removeAttribute("Disabled");
            } else {
                document.getElementById("firstName").innerHTML = "<span style='color:red;'>must be 4 & 25</span>";
                button.setAttribute("Disabled", "");
            }
        }

        function lNameValidation() {
            var names = document.getElementById("lName").value;
            var button = document.getElementById("button");

            if (names.trim() !== '' && names.length > 0 && names.length <= 25) {
                document.getElementById("lastName").innerHTML = "";
                button.removeAttribute("Disabled");
            } else {
                document.getElementById("lastName").innerHTML = "<span style='color:red;'>must be 1 & 25</span>";
                button.setAttribute("Disabled", "");
            }
        }

        const phone = async () => {
            let phoneNumber = document.getElementById("phNo").value
            var button = document.getElementById("button");
            const response = await axios("http://localhost:8080/metro/phoneNumberExists?mobileNumber=" + phoneNumber)

            if (phoneNumber.length < 10 || phoneNumber.length > 10) {
                document.getElementById("ph").innerHTML = "<span style='color:red;'>invalid phone number</span>";
                button.setAttribute("disabled", "");
            } else if (response.data == "phone number not exists" || phoneNumber == "${dto.mobileNumber}") {
                document.getElementById("ph").innerHTML = "<span style='color:green;'>valid</span>";
                button.removeAttribute("disabled");
            } else {
                document.getElementById("ph").innerHTML = "<span style='color:red;'>phone number already exists</span>";
                button.setAttribute("disabled", "");
            }
        }

        const dto = { gender: "${dto.gender}" };
        document.getElementById(dto.gender).checked = true;

        const now = new Date().toISOString().split('T')[0];
        document.getElementById('dob').setAttribute('max', now);

        function validateFileSize() {
            const fileInput = document.getElementById('fileInput');
            const file = fileInput.files[0];
            const maxSizeInMB = 2;
            const maxSizeInBytes = maxSizeInMB * 1024 * 1024;
            const errorMessageElement = document.getElementById('fileSizeError');

            if (file.size > maxSizeInBytes) {
                errorMessageElement.textContent = `file size exceeds 2mb limit.`;
                document.getElementById("button").setAttribute("disabled", "");
            } else {
                errorMessageElement.textContent = "";
                document.getElementById("button").removeAttribute("disabled");
            }
        }
    </script>

</body>

</html>
