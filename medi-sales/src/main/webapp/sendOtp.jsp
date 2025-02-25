<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SEND OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
            padding: 30px 20px;
        }
        .form-section h2 {
            font-size: 22px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .form-section p {
            color: #777;
            font-size: 13px;
            margin-bottom: 15px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-size: 13px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 8px 10px;
            font-size: 12px;
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
            width: auto;
            background-color: #006b5d;
            color: #fff;
            border: none;
            padding: 8px 15px;
            font-size: 12px;
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
            font-size: 13px;
        }

        /* Info Section */
        .info-section {
            flex: 1;
            background: linear-gradient(135deg, #e6f7f4, #f5f9fa);
            padding: 30px 15px;
            text-align: center;
        }
        .info-section img {
            width: 80px;
            margin-bottom: 10px;
        }
        .info-section h3 {
            font-size: 16px;
            color: #006b5d;
            margin-bottom: 10px;
        }
        .info-section p {
            color: #555;
            font-size: 12px;
            line-height: 1.5;
        }
        .card {
            opacity: 0.95;
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
        <!-- Form Section -->
        <div class="form-section">
            <h2>Send OTP</h2>
            <p>Access Your Account by Verifying OTP</p>
            <div class="card">
                <div class="card-body">
                    <form action="validateOtp" method="get">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <div class="input-group">
                                <input type="email" class="form-control" id="email" name="email" required>
                                <button type="button" class="btn btn-primary ms-2" onclick="otpSend()">Send OTP</button>
                            </div>
                        </div>
                        <div class="form-group mt-3" id="otpSection" style="display: none;">
                            <label for="otp">Enter OTP:</label>
                            <input type="text" class="form-control" id="otp" name="otp" required>
                        </div>
                        <div class="form-row d-flex justify-content-between mt-3">
                            <button type="submit" class="btn btn-primary">Validate OTP</button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <img src="work.jpeg" alt="Marg ERP On Cloud">
            <h3>Secure Access</h3>
            <p>Log in to Marg Cloud to access all your business data, monitor transactions, expenses, and more with complete security.</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const otpSend = async () => {
            const email = document.getElementById("email").value;
            if (!email) {
                alert("Please enter your email address.");
                return;
            }
            try  {
                const response = await axios.get("http://localhost:8080/medi-sales/api/sendOtp/" + email);
                if (response.data !== "OTP not sent. Email not found.") {
                    document.getElementById("otpSection").style.display = "block";
                    alert("OTP sent successfully to your email!");
                } else {
                    alert(response.data);
                }
            } catch (error) {
                console.error("Error sending OTP:", error);
                alert("Failed to send OTP. Please try again.");
            }
        };
    </script>
</body>
</html>
