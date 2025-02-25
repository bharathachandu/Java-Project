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
            margin: 40px auto;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Jumbotron Section */
        .jumbotron {
            flex: 2;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 50px;
            border-radius: 10px;
            text-align: center;
            color: #333;
        }
        .jumbotron h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #006b5d;
        }
        .jumbotron .alert {
            font-size: 16px;
            margin-bottom: 20px;
            color: #155724;
            background-color: #d4edda;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #c3e6cb;
        }
        .jumbotron a.btn {
            margin: 10px;
            padding: 10px 20px;
            font-size: 14px;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }
        .jumbotron a.btn-primary {
            background-color: #006b5d;
        }
        .jumbotron a.btn-primary:hover {
            background-color: #004f43;
        }
        .jumbotron a.btn-secondary {
            background-color: #6c757d;
        }
        .jumbotron a.btn-secondary:hover {
            background-color: #5a6268;
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
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>X WORKZ</h1>
        <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
    </div>

    <!-- Container -->
    <div class="container">
        <!-- Jumbotron Section -->
        <div class="jumbotron">
            <h1 class="display-4">Password Update Status</h1>
            <div class="alert alert-success">
                <strong>Success!</strong> Your password has been updated successfully.
            </div>
            <hr class="my-4">
            <p>Please proceed with your login or try again if there was an issue.</p>
            <a href="signIn" class="btn btn-primary">Login</a>
            <a href="signup" class="btn btn-secondary">SignUp</a>
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
