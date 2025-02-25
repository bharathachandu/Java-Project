<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Stock - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <style>
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
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                padding: 20px;
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
            .header .home-btn {
                background-color: #fff;
                color: #006b5d;
                border: none;
                padding: 8px 15px;
                font-size: 14px;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
            }
            .home-btn:hover {
                background-color: #e6f7f4;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #006b5d;
                color: white;
            }
            .btn-action {
                padding: 5px 10px;
                font-size: 14px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .btn-edit {
                background-color: #ffc107;
                color: white;
            }
            .btn-delete {
                background-color: #dc3545;
                color: white;
            }
            footer {
                background-color: #f5f9fa;
                color: #333;
                text-align: center;
                padding: 10px;
                position: fixed;
                bottom: 0;
                width: 100%;
                box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
            }
        </style>
</head>
<body>
    <div class="header">
        <h1>X WORKZ</h1>
        <div>
            <button class="home-btn" onclick="location.href='index.jsp';">Home</button>
            <button class="home-btn" onclick="history.back();">Back</button>
        </div>
    </div>
    <div class="container">
        <h2>Stock Details</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Company</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>MRP</th>
                    <th>Pack Size</th>
                    <th>Mfg Date</th>
                    <th>Exp Date</th>
                    <th>Rate</th>
                    <th>Discount</th>
                    <th>TotalAmount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${entity}">
                    <tr>
                        <td>${product.getId()}</td>
                        <td>${product.getProduct_Company()}</td>
                        <td>${product.getProduct_name()}</td>
                        <td>${product.getQuantity()}</td>
                        <td>${product.getMrp()}</td>
                        <td>${product.getPack()}</td>
                        <td>${product.getMfg_date()}</td>
                        <td>${product.getExp_date()}</td>
                        <td>${product.getRate()}</td>
                        <td>${product.getDiscount()}</td>
                        <td>${product.getTotalAmount()}</td>
                        <td>
                            <a href="bill? id =${product.id}" class="btn-action btn-edit" >bill</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
    <script>
        function editProduct(id) {
            window.location.href = 'editProduct.jsp?id=' + id;
        }
        function deleteProduct(id) {
            if (confirm('Are you sure you want to delete this product?')) {
                window.location.href = 'deleteProduct?id=' + id;
            }
        }
    </script>
</body>
</html>
