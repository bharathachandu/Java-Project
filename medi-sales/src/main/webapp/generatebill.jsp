<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
     <meta charset="UTF-8">
     <title>Generate Bill - MEDI-SALES</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
     <style>
         /* General Styling */
         body {
             font-family: 'Segoe UI Emoji', Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f8f9fa;
         }
         .container {
             max-width: 1100px;
             margin: 50px auto;
             background-color: #fff;
             border-radius: 10px;
             box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
             padding: 30px;
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
         .form-row {
             margin-top: 20px;
         }
         .form-row input,
         .form-row select {
             margin-right: 10px;
         }
         .form-btn {
             background-color: #0056b3;
             color: white;
             padding: 10px 20px;
             border: none;
             border-radius: 5px;
             cursor: pointer;
         }
         .form-btn:hover {
             background-color: #003d80;
         }

         /* Table Styling */
         #sales-table {
             width: 100%;
             border-collapse: collapse;
             margin-top: 20px;
         }
         #sales-table th, #sales-table td {
             padding: 12px;
             text-align: left;
             border-bottom: 1px solid #ddd;
         }
         #sales-table th {
             background-color: #f5f9fa;
             font-weight: bold;
         }

         /* Custom styles for the max stock message */
         #maxStockMessage {
             font-size: 12px;  /* Small text */
             color: blue;      /* Blue color */
             margin-top: 5px;   /* Space below quantity field */
         }

         /* Styling for the form fields to align them in one row */
         .form-row input, .form-row select {
             margin-bottom: 10px;
         }

         /* Adjust column width to ensure fields are properly aligned */
         .col-md-2, .col-md-3 {
             padding-right: 10px;
         }
         /* Styling for Total Amount */
         .total-amount {
             font-size: 22px;
             font-weight: bold;
             color: #006b5d;  /* Dark green for emphasis */
             text-align: right;
             padding: 10px;
             margin-top: 10px;
             background-color: #f1f1f1; /* Light gray background */
             border-radius: 5px;
             box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
         }
  /* Button Styling */
        .form-btn {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-btn:hover {
            background-color: #003d80;
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
         <!-- Sales Bill Form -->
         <form method="post" action="getBill">
             <h2 id="page-title">Generating Bill From ${bn}</h2>
             <h3>Billing for :${contact_person}</h3>
             <p>Address :${address}</p>

             <div class="row form-row">
                 <div class="col-md-3">
                     <select name="product_name" id="product_name" class="form-select" required onchange="fetchProductStock()">
                         <option value="">Select Product</option>
                     </select>
                 </div>
                 <div class="col-md-3">
                     <select name="contact_person" id="contact_person" class="form-select" required>
                         <option value="">Select Customer</option>
                     </select>
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="quantity" id="quantityEntered" class="form-control" placeholder="Quantity" required />
                  <div id="maxStockMessage"></div>
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="gst" id="gstEntered" class="form-control" placeholder="GST (%)" required />
                 </div>
                 <div class="col-md-2">
                     <input type="number" name="discount" id="discountEntered" class="form-control" placeholder="Discount (%)" required />
                 </div>
             </div>

             <!-- Max Stock message below the Quantity -->


             <!-- Submit Button -->
             <div class="form-row mt-3">
                 <button type="submit" class="form-btn">Generate Bill</button>
             </div>
         </form>

         <!-- Table for Bill Details -->
         <h3 class="mt-4">Sales Bill Details</h3>
         <table id="sales-table">
             <thead>
                 <tr>
                     <th>Sl.no</th>
                     <th>Product</th>
                     <th>HSN No</th>
                     <th>Description</th>
                     <th>Exp. Date</th>
                     <th>Quantity</th>
                     <th>Rate</th>
                     <th>GST</th>
                     <th>Discount</th>
                     <th>Total</th>
                 </tr>
             </thead>
             <tbody>
               <c:forEach var="dto" items="${dtoList}" varStatus="status">
                 <tr>
                     <td>${status.index + 1}</td>
                     <td>${dto.product_name}</td>
                     <td>${dto.hsn}</td>
                     <td>${dto.product_Company}</td>
                     <td>${dto.exp_date}</td>
                     <td>${dto.quantity}</td>
                     <td>${dto.rate}</td>
                     <td>${dto.gst}</td>
                     <td>${dto.discount}</td>
                     <td>${dto.totalAmount}</td>
                 </tr>
              </c:forEach>
             </tbody>
         </table>
         <h4 class="total-amount">Total: ₹${total}</h4>
         <br>
         <a href="generatePdf/${dto}" class="form-btn" >Print Receipt</a>
     </div>

     <!-- Footer -->
         <footer>
             <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
         </footer>

   <script>
      document.addEventListener("DOMContentLoaded", function() {
          fetchProducts();
          fetchCustomers();
      });

      function fetchProducts() {
          fetch('http://localhost:8080/medi-sales/api/getProducts')
              .then(response => response.json())
              .then(data => {
                  let selectElement = document.getElementById("product_name");
                  selectElement.innerHTML = '<option value="">Select Product</option>';
                  data.forEach(product => {
                      let option = document.createElement("option");
                      option.value = product;
                      option.text = product;
                      selectElement.appendChild(option);
                  });
              })
              .catch(error => console.error('Error fetching products:', error));
      }

      function fetchCustomers() {
          fetch('http://localhost:8080/medi-sales/api/getCustomer')
              .then(response => response.json())
              .then(data => {
                  let selectElement = document.getElementById("contact_person");
                  selectElement.innerHTML = '<option value="">Select Customer</option>';
                  data.forEach(customer => {
                      let option = document.createElement("option");
                      option.value = customer;
                      option.text = customer;
                      selectElement.appendChild(option);
                  });
              })
              .catch(error => console.error('Error fetching customers:', error));
      }

      function fetchProductStock() {
          const name = document.getElementById("product_name").value;
          if (name) {
              fetch("http://localhost:8080/medi-sales/api/getStockByProduct?product_name=" + name)
                  .then(response => response.json())
                  .then(stock => {
                      const maxStockMessage = document.getElementById("maxStockMessage");
                      maxStockMessage.textContent = "Maximum quantity available is " + stock;

                      const quantityInput = document.getElementById("quantityEntered");
                      quantityInput.setAttribute("max", stock);
                      quantityInput.setAttribute("placeholder", "Enter quantity (max " + stock + ")");

                      const submitButton = document.querySelector(".form-btn");
                      submitButton.disabled = stock === 0;
                  })
                  .catch(error => console.error('Error fetching product stock:', error));
          } else {
                   const maxStockMessage = document.getElementById("maxStockMessage");
                   maxStockMessage.textContent = '';

                   const quantityInput = document.getElementById("quantity");
                   quantityInput.setAttribute("placeholder", "Enter quantity");
                  }
      }
   </script>
</body>
</html>