<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to Dashboard - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('dashboard-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            max-width: 1100px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 40px;
            text-align: center;
        }
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
        .dashboard-btn {
            background-color: #006b5d;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        .dashboard-btn:hover {
            background-color: #004d46;
        }
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
    </style>
    <script>
        if (performance.navigation.type === 1) {
            window.location.href = "response.jsp";
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>X WORKZ</h1>
        <a href="dashboard.jsp" class="dashboard-btn">Go to Dashboard</a>
    </div>
    <div class="container">
        <h2>Welcome, <%= request.getParameter("contact_person") %>!</h2>
        <p>Thank you for signing up on Marg ERP Cloud.</p>
        <p>You can now access your dashboard and manage your business operations efficiently.</p>
        <a href="dashboard.jsp" class="dashboard-btn">Proceed to Dashboard</a>
    </div>
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
