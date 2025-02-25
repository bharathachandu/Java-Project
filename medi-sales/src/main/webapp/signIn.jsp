<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Marg ERP Cloud</title>
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
            padding: 6px 12px;
            font-size: 13px;
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

        /* Container Styling */
    .container {
        max-width: 800px;
        width: 90%; /* For responsive design */
        margin: 120px auto;
        display: flex;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

        /* Form Section */
        .form-section {
            flex: 2;
            padding: 30px 20px;
        }
        .form-section h2 {
            font-size: 24px;
            color: #006b5d;
            margin-bottom: 5px;
        }
        .form-section p {
            color: #777;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 8px 10px;
            font-size: 13px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .password-toggle {
            position: relative;
        }
        .password-toggle input {
            padding-right: 35px;
        }
        .password-toggle .toggle-btn {
            position: absolute;
            top: 50%;
            right: 8px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 14px;
            color: #aaa;
        }
        .password-toggle .toggle-btn:hover {
            color: #333;
        }
        .btn {
            width: 100%;
            background-color: #006b5d;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 14px;
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

        /* Info Section */
        .info-section {
            flex: 1;
            background: linear-gradient(135deg, #e6f7f4, #f5f9fa);
            padding: 30px 15px;
            text-align: center;
        }
        .info-section img {
            width: 90px;
            margin-bottom: 15px;
        }
        .info-section h3 {
            font-size: 18px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .info-section p {
            color: #555;
            font-size: 13px;
            line-height: 1.5;
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

    <!-- Container -->
    <div class="container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Login</h2>
            <p>Access Your Account on Marg ERP Cloud</p>
            <form action="sign" method="get">
                <div class="form-group">
                    <div class="text-danger fw-bold">${info}</div><br>
                    <label for="email">Registered Email *</label>
                    <input type="email" id="email" name="email" value="${email}" required ${isLocked ? 'readonly' : ''}>
                </div>
                <div class="form-group">
                    <label for="password">Password *</label>
                    <div class="password-toggle">
                        <input type="password" id="password" name="password" required ${isLocked ? 'readonly' : ''}>
                        <span class="toggle-btn" id="togglePassword" onclick="togglePassword('password', 'togglePassword')">👁️</span>
                    </div>
                </div>
                <div style="margin-bottom: 20px;">
                    <a href="sendOtp">Forgot Password?</a>
                </div>
                <button type="submit" class="btn" ${isLocked ? 'disabled' : ''}>Login</button>
                <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
            </form>
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <img src="work.jpeg" alt="Marg ERP On Cloud">
            <h3>Secure Access</h3>
            <p>Log in to Marg Cloud to access all your business data, monitor transactions, expenses, and more from anywhere in the world with complete security and ease of use.</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
