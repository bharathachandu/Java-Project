<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - XWORKZ Pharm Cloud</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('draww.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        .header {
            background-color: rgba(0, 107, 93, 0.9);
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

        footer {
            background-color: rgba(245, 249, 250, 0.9);
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
        .container {
            text-align: center;

            margin: 150px 400px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 50px;
            display: inline-block;
        }
        h2 {
            font-size: 36px;
            color: #006b5d;
        }
        p {
            font-size: 18px;
            color: #555;
            margin: 20px 0;
        }
        .btn-group {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            background-color: #006b5d;
            color: #fff;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #004f43;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>X WORKZ</h1>
        <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Welcome to XWORKZ Pharm Cloud</h2>
        <p>Manage your business with ease, anytime and anywhere.</p>
        <div class="btn-group">
            <a href="signIn" class="btn">Login</a>
            <a href="signup" class="btn">Sign Up</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
