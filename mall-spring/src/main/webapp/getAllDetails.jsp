<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ID Input Form</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
     body {
       background-image: url('travel.jpg'); /* Replace with your background image path */
       background-size: cover;
       background-position: center;
       height: 100vh;
       display: flex;
       justify-content: center;
       align-items: center;
       font-family: 'Poppins', sans-serif;
       margin: 0;
       padding: 0;
     }

     h2 {
       text-align: center;
       color: #333;
       margin-bottom: 25px;
       font-size: 2.2rem;
       font-weight: bold;
       text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
     }

     table {
       width: 100%;
       max-width: 1000px;
       border-collapse: collapse;
       border-radius: 10px;
       overflow: hidden;
       background-color: transparent; /* Make the table background fully transparent */
       box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
     }

     th, td {
       padding: 15px;
       text-align: center;
       font-size: 1.1rem;
     }

     th {
       background-color: rgba(0, 123, 255, 0.8); /* Slight opacity for header */
       color: white;
       border-bottom: 2px solid #0056b3;
     }

     td {
       background-color: rgba(248, 249, 250, 0.9); /* Slight opacity for cells */
       border-bottom: 1px solid #ddd;
     }

     tr:hover {
       background-color: #f1f1f1;
       transform: scale(1.02);
       transition: background-color 0.3s ease, transform 0.3s ease;
     }

     .button-container {
       text-align: center;
       margin-top: 25px;
     }

     .btn-primary {
       background-color: #007bff;
       border: none;
       border-radius: 30px;
       padding: 12px 30px;
       font-size: 1.2rem;
       color: white;
       transition: all 0.3s ease-in-out;
     }

     .btn-primary:hover {
       background-color: #0056b3;
       transform: scale(1.05);
     }

     a {
       text-decoration: none;
       color: #007bff;
       transition: color 0.3s ease;
     }

     a:hover {
       color: #0056b3;
     }
     .btn-small {
         background-color: blue;
         color: white;
         padding: 6px 12px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         font-size: 14px;
         text-decoration: none;
         margin-right: 5px;
     }

     .btn-small:hover {
         background-color: #45a049;
     }
     .btn-small-delete {
         background-color: blue;
     }

     .btn-small-delete:hover {
         background-color: darkred;
     }

     .btn-container {
         display: flex;
         justify-content: flex-start;
         gap: 10px;
     }
</style>

</head>
<body>
  <div class="mx-auto">
    <h2>User Details</h2>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>ID</th>
          <th>ShopName</th>
          <th>OwnerName</th>
          <th>Location</th>
          <th>Revenue</th>
          <th>Size</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="dto" items="${allShops}">
          <tr>
            <td>${dto.getShopId()}</td>
            <td>${dto.getShopName()}</td>
            <td>${dto.getOwnerName()}</td>
            <td>${dto.getLocation()}</td>
            <td>${dto.getRevenue()}</td>
            <td>${dto.getSize()}</td>
           <td>
           <a href="fetchApp?id=${dto.getShopId()}" class="btn-small" >Edit</a>
           <a href="delete/${dto.getShopId()}" class="btn-small btn-small-delete">Delete</a>
           </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="button-container">
      <a href="index.jsp" class="btn btn-primary">Add User</a>
    </div>
  </div>
</body>
</html>







