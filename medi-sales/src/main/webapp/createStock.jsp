<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Marg ERP Cloud</title>
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

</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>X WORKZ</h1>
        <div>
            <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
            <button class="home-btn" onclick="history.back();">Back</button>
        </div>
    </div>

    <div class="container">
        <div class="form-section">
            <h2>Add Product</h2>
            <p>Enter Product Details for Marg ERP Cloud</p>
            <form action="stock" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <label for="product_Company" class="form-label">Product Company *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="product_Company" name="product_Company" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="product_name" class="form-label">Product Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-box"></i></span>
                            <input type="text" class="form-control" id="product_name" name="product_name" required>
                        </div>
                    </div>

                   <div class="col-md-6">
                        <label for="quantity" class="form-label">Quantity *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                   </div>
                    <div class="col-md-6">
                        <label for="mrp" class="form-label">MRP *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="number" class="form-control" id="mrp" name="mrp" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="pack" class="form-label">Pack Size *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-bar-chart"></i></span>
                            <input type="text" class="form-control" id="pack" name="pack" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="mfg_date" class="form-label">Manufacture Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                            <input type="date" class="form-control" id="mfg_date" name="mfg_date" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="exp_date" class="form-label">Expiry Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-x"></i></span>
                            <input type="date" class="form-control" id="exp_date" name="exp_date" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="rate" class="form-label">Rate *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="number" class="form-control" id="rate" name="rate" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                                            <label for="discount" class="form-label">Discount *</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-percent"></i></span>
                                                <input type="number" class="form-control" id="discount" name="discount" required>
                                            </div>
                                        </div>
                    <div class="col-md-6">
                                            <label for="gst" class="form-label">GST *</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="bi bi-percent"></i></span>
                                                <input type="number" class="form-control" id="gst" name="gst" required>
                                            </div>
                                        </div>
                </div>
                   <br>

                <button type="submit" class="btn">Add Product</button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
