<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
                        background: url('draww.jpg') no-repeat center center fixed;
                        background-size: cover;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 1100px;
            margin: 50px auto;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        /* Header Styling */
        .header {
            background-color: #006b5d;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }
        .header h1 {
            font-size: 20px;
            margin: 0;
        }
        .header .home-btn {
            background-color: #fff;
            color: #006b5d;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .header .home-btn:hover {
            background-color: #e6f7f4;
        }

        /* Footer Styling */
        footer {
            background-color: #f5f9fa;
            color: #333;
            text-align: center;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
        footer p {
            margin: 0;
            font-size: 14px;
        }

        /* Form Section */
        .form-section {
            flex: 2;
            padding: 40px 30px;
        }
        .form-section h2 {
            font-size: 26px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .form-section p {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            gap: 10px;
        }
        .radio-group input {
            margin-top: 4px;
        }
        .radio-group label {
            font-size: 14px;
        }
        .btn {
            width: 100%;
            background-color: #006b5d;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #004f43;
        }
        .form-section a {
            text-decoration: none;
            color: #006b5d;
            font-weight: bold;
        }

        .container {
                    max-width: 1100px;
                    margin: 50px auto;
                    display: flex;
                    background-color: #fff;
                    border-radius: 10px;
                    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                    overflow: hidden;
                }
                .form-section {
                    flex: 2;
                    padding: 40px 30px;
                }
                .form-section h2 {
                    font-size: 26px;
                    color: #006b5d;
                    margin-bottom: 20px;
                }
                .btn {
                    width: 100%;
                    background-color: #006b5d;
                    color: #fff;
                    border: none;
                    padding: 12px;
                    font-size: 16px;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                .btn:hover {
                    background-color: #004f43;
                }
                .info-section {
                    flex: 1;
                    background: linear-gradient(135deg, #e6f7f4, #f5f9fa);
                    padding: 40px 20px;
                    text-align: center;
                }
                .info-section img {
                    width: 100px;
                    margin-bottom: 20px;
                }

        /* Toggle Password Visibility */
        .password-toggle {
            position: relative;
        }
        .password-toggle input {
            padding-right: 40px;
        }
        .password-toggle .toggle-btn {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
            color: #aaa;
        }
        .password-toggle .toggle-btn:hover {
            color: #333;
        }
    </style>
    <script>
        // Toggle password visibility
        function togglePassword(id, toggleId) {
            const input = document.getElementById(id);
            const toggleBtn = document.getElementById(toggleId);
            if (input.type === "password") {
                input.type = "text";
                toggleBtn.textContent = "🙈";
            } else {
                input.type = "password";
                toggleBtn.textContent = "👁️";
            }
        }
    </script>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>X WORKZ</h1>
        <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
    </div>
    <div class="container">
        <div class="form-section">
            <h2>Sign Up</h2>
            <p>Create an Account on Marg ERP Cloud</p>
            <form action="user" method="post">
<div class="row">
    <div class="col-md-6">
        <!-- Field for Company Name -->

        <label for="companyName" class="form-label">Company Name *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-building"></i></span>
            <input type="text" class="form-control" id="company_name" name="company_name" oninput="validateLength('company_name', 'companyNameError')" required>
        </div>
        <span id="companyNameError" style="font-size:0.7rem;color:red">${companyNameError}</span>
        <div class="text-danger fw-bold">${error}</div>
    </div>

    <div class="col-md-6">
        <!-- Field for Contact Person -->
        <label for="contactPerson" class="form-label">Contact Person *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control" id="contact_person" name="contact_person" oninput="validateLength('contact_person', 'contactPersonError')"required>
        </div>
        <span id="contactPersonError" style="font-size:0.7rem;color:red">${contactPersonError}</span>
    </div>

    <div class="col-md-6">
        <!-- Field for Business Type -->
        <label for="bussiness_type" class="form-label">Business/Person Type *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-diagram-2-fill"></i></span>
            <select id="businessType" name="bussiness_type" class="form-select" required>
                <option value="" disabled selected>Select...</option>
                <option value="Patients">Patient</option>
                <option value="Retail">Retail</option>
                <option value="Wholesale">Wholesale</option>
                <option value="Manufacturer">Manufacturer</option>
            </select>
        </div>
        <span id="bussinessTypeError" style="font-size:0.7rem;color:red">${bussinessTypeError}</span>
    </div>

    <div class="col-md-6">
        <!-- Field for Registered Mobile -->
        <label for="number" class="form-label">Registered Mobile *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-telephone"></i></span>
            <input type="text" class="form-control" id="number" name="number" onBlur="checkPhone()" oninput="validateLength('number', 'phoneError')">
        </div>
        <span id="phoneError" style="font-size:0.7rem;color:red">${phoneError}</span>
    </div>

    <div class="col-md-6">
        <!-- Field for Email -->
        <label for="email" class="form-label">Registered Email *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
            <input type="email" class="form-control" id="email" name="email" onBlur="checkEmail()"  oninput="validateLength('email', 'emailError')">
        </div>
        <span id="emailError" style="font-size:0.7rem;color:red">${emailError}</span>
    </div>

    <div class="col-md-6">
        <!-- Field for Address -->
        <label for="address" class="form-label">Address *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
            <input type="address" class="form-control" id="address" name="address" oninput="validateLength('address', 'addressError')" required>
        </div>
        <span id="addressError" style="font-size:0.7rem;color:red">${addressError}</span>
    </div>

    <div class="col-md-6">
        <!-- Field for Password -->
        <label for="password" class="form-label">Password *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-lock"></i></span>
            <input type="password" class="form-control" id="password" name="password" oninput="checkPasswords()" required>
            <span class="input-group-text">
                <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePassword('password', 'togglePassword')"></i>
            </span>
        </div>
        <span id="passwordError" style="font-size:0.7rem;color:red">${passwordError}</span>
    </div>
    <div class="col-md-6">
        <!-- Field for Confirm Password -->
        <label for="c_password" class="form-label">Confirm Password *</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
            <input type="password" class="form-control" id="c_password" name="c_password" oninput="checkPasswords()" required>
            <span class="input-group-text">
                <i class="bi bi-eye-slash" id="toggleConfirmPassword" onclick="togglePassword('c_password', 'toggleConfirmPassword')"></i>
            </span>
        </div>
        <span id="cPasswordError" style="font-size:0.7rem;color:red">${cPasswordError}</span>
    </div>
</div>
                <div><span id="cPasswordError"style="font-size:0.7rem;color:red">${cPasswordError}</span></div>
                <br>
                <button type="submit" id="signupBtn" class="btn" disabled>Sign Up</button>
                <p class="mt-3">Already have an account? <a href="signIn" class="text-success">Sign In</a></p>
            </form>
        </div>
        <div class="info-section">
            <img src="work.jpeg" alt="Marg ERP On Cloud">
            <h3>Access From Anywhere</h3>
            <p>Enjoy the convenience of 24/7 accessibility to Marg Cloud to monitor your business data, transactions, and expenses, keeping you up-to-date.</p>
        </div>
    </div>
        <!-- Footer -->
        <footer>
                    <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>

        </footer>
<script>
    const validateForm = () => {
        const companyName = document.getElementById("company_name").value;
        const contactPerson = document.getElementById("contact_person").value;
        const businessType = document.getElementById("businessType").value;
        const phone = document.getElementById("number").value;
        const email = document.getElementById("email").value;
        const address = document.getElementById("address").value;
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("c_password").value;

        // Check if email and phone errors are cleared
        const emailError = document.getElementById("emailError").textContent.trim();
        const phoneError = document.getElementById("phoneError").textContent.trim();

        const isFormValid =
            companyName &&
            contactPerson &&
            businessType &&
            phone &&
            email &&
            address &&
            password &&
            confirmPassword &&
            password === confirmPassword &&
            emailError === "" && // Ensure no email error
            phoneError === "" && // Ensure no phone error
            document.getElementById("companyNameError").textContent === "" &&
            document.getElementById("contactPersonError").textContent === "" &&
            document.getElementById("bussinessTypeError").textContent === "" &&
            document.getElementById("addressError").textContent === "";

        document.getElementById("signupBtn").disabled = !isFormValid;
    };

    const checkPasswords = () => {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("c_password").value;
        const errorElement = document.getElementById("cPasswordError");

        if (password !== confirmPassword) {
            errorElement.textContent = "Passwords do not match.";
        } else {
            errorElement.textContent = "";
        }

        validateForm();
    };

    const checkEmail = async () => {
        const email = document.getElementById("email").value;
        console.log(email);
        const response = await axios("http://localhost:8080/medi-sales/api/checkEmail/" + email);
        if (response.data === "Email Exists") {
            document.getElementById("emailError").innerHTML = response.data;
        } else {
            document.getElementById("emailError").innerHTML = " ";
        }
        validateForm(); // Validate form after checking email
    };

    const checkPhone = async () => {
        const number = document.getElementById("number").value;
        console.log(number);
        const response = await axios("http://localhost:8080/medi-sales/api/checkPhone/" + number);
        if (response.data === "Phone Number Exists") {
            document.getElementById("phoneError").innerHTML = response.data;
        } else {
            document.getElementById("phoneError").innerHTML = " ";
        }
        validateForm(); // Validate form after checking phone number
    };

const validateLength = (fieldId, errorMessageId) => {
    const value = document.getElementById(fieldId).value.trim();
    let minLength = 5;
    let maxLength = 50;
    let errorMessage = "Must be between 5 and 50 characters.";

    // Customize the length and error message based on the field name
    switch (fieldId) {
        case "company_name":
                    minLength = 5;
                    maxLength = 15;
                    errorMessage = "Company Name must be between 5 and 15 characters.";
                    break;
        case "contact_person":
                    minLength = 5;
                    maxLength = 20;
                    errorMessage = "Contact Person must be between 5 and 20 characters.";
                    break;
        case "bussiness_type":
            minLength = 3;
            maxLength = 30;
            errorMessage = "Business type must be between 3 and 30 characters.";
            break;
        case "email":
            minLength = 5;
            maxLength = 50;
            errorMessage = "Email must be between 5 and 50 characters.";
            break;
        case "address":
            minLength = 10;
            maxLength = 100;
            errorMessage = "Address must be between 10 and 100 characters.";
            break;
        case "number":
            minLength = 10;
            maxLength = 10;
            errorMessage = "Phone number must be exactly 10 digits.";
            break;
        case "password":
            minLength = 8;
            maxLength = 50;
            errorMessage = "Password must be between 8 and 50 characters.";
            break;
        case "c_password":
            minLength = 8;
            maxLength = 50;
            errorMessage = "Confirm password must match password and be between 8 and 50 characters.";
            break;
        default:
            break;
    }

    // Validate the length of the input
    if (value.length < minLength || value.length > maxLength) {
        document.getElementById(errorMessageId).textContent = errorMessage;
    } else {
        document.getElementById(errorMessageId).textContent = "";
    }

    // Trigger form validation
    validateForm();
};


    // Bind validation checks to input events
    document.getElementById("company_name").addEventListener("input", () => validateLength('company_name', 'companyNameError'));
    document.getElementById("contact_person").addEventListener("input", () => validateLength('contact_person', 'contactPersonError'));
    document.getElementById("number").addEventListener("input", () => validateLength('number', 'phoneError'));
    document.getElementById("email").addEventListener("input", () => validateLength('email', 'emailError'));
    document.getElementById("address").addEventListener("input", () => validateLength('address', 'addressError'));

</script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>