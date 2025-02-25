<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Password - Marg ERP Cloud</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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

        /* Container Styling */
        .container {
            max-width: 900px;
            margin: 50px auto;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
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
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
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

        /* Info Section */
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
        .info-section h3 {
            font-size: 20px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .info-section p {
            color: #555;
            font-size: 14px;
            line-height: 1.6;
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
            <h2>Update Password</h2>
            <p>Reset your password to regain access to your account.</p>
            <form action="updatePass" method="post">
                <div class="form-group">
                    <label for="email">Registered Email *</label>
                    <input type="email" class="form-control" id="email" name="email" required readonly value="${email}">
                </div>
                <div class="form-group">
                    <label for="password">New Password *</label>
                    <div class="password-toggle">
                        <input type="password" class="form-control" id="password" name="password" required>
                        <span class="toggle-btn" id="toggleNewPassword" onclick="togglePassword('password', 'togglePassword')">👁️</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="c_Password">Confirm Password *</label>
                    <div class="password-toggle">
                        <input type="password" class="form-control" id="c_Password" name="c_Password" required>
                        <span class="toggle-btn" id="toggleConfirmPassword" onclick="togglePassword('c_Password', 'toggleC_Password')">👁️</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Update Password</button>
            </form>
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <img src="work.jpeg" alt="Marg ERP On Cloud">
            <h3>Secure Your Account</h3>
            <p>Ensure your password is strong and unique. Keep your account secure and access all your data with confidence.</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
