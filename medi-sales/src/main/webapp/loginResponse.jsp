<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select Plan - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .header {
            background-color: #006b5d;
            padding: 10px;
            display: flex;
            align-items: center;
            color: white;
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
        }
        .toggle-btn {
            background: none;
            border: none;
            color: white;
            font-size: 20px;
            margin-right: 15px;
        }
        .header h1 {
            flex-grow: 1;
            font-size: 20px;
            margin: 0;
        }
        .home-btn {
            background-color: white;
            color: #006b5d;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
        .home-btn:hover {
            background-color: #e6f7f4;
        }
        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: -250px;
            width: 250px;
            height: 100vh;
            background-color: #004f43;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 60px;
            transition: left 0.3s ease-in-out;
        }
        .sidebar a {
            padding: 12px;
            color: white;
            text-decoration: none;
            display: block;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background-color: #006b5d;
        }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 24px;
            cursor: pointer;
            background: none;
            border: none;
            color: white;
        }
        .content {
            padding: 80px 20px;
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
              .content {
                  padding: 80px 20px;
                  transition: margin-left 0.3s ease-in-out; /* Smooth transition for content move */
              }

                        .stock-container {
                            margin-top: 20px;
                        }
                        .stock-card {
                            border: 1px solid #ddd;
                            border-radius: 8px;
                            padding: 15px;
                            background: white;
                            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
                        }
                        .stock-card h5 {
                            margin-bottom: 10px;
                        }
                        .offer-badge {
                            background-color: #28a745;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 5px;
                            font-size: 14px;
                        }
    </style>
    <script>
       function toggleSidebar() {
           var sidebar = document.getElementById("sidebar");
           var content = document.querySelector(".content"); // Get the content element
           if (sidebar.style.left === "-250px") {
               sidebar.style.left = "0";
               content.style.marginLeft = "250px"; // Move the content to the right
           } else {
               sidebar.style.left = "-250px";
               content.style.marginLeft = "0"; // Move the content back to its original position
           }
       }
    </script>
</head>
<body>
    <div class="header">
        <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
        <h1>X WORKZ</h1>
        <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
    </div>

    <div id="sidebar" class="sidebar">
        <button class="close-btn" onclick="toggleSidebar()">&times;</button>
        <a href="createStock.jsp">Create Stocks</a>
        <a href="viewStocks">View Stocks</a>
        <a href="generatebill">Generate Bill</a>
    </div>

    <div class="content">
        <div class="container stock-container">
                    <h2 class="text-center">Medical Stocks & Offers</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Paracetamol 500mg</h5>
                                <p>Effective for fever and pain relief.</p>
                                <span class="offer-badge">10% OFF</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Vitamin C Tablets</h5>
                                <p>Boosts immunity and improves skin health.</p>
                                <span class="offer-badge">Buy 1 Get 1 Free</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stock-card">
                                <h5>Blood Pressure Monitor</h5>
                                <p>Accurate readings for daily health monitoring.</p>
                                <span class="offer-badge">15% OFF</span>
                            </div>
                        </div>
                    </div>
                </div>
    </div>

    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
