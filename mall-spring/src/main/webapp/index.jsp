<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Event Form</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-image: url('image.jpg'); /* Replace with your background image path */
      background-size: cover;
      background-position: center;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      overflow: hidden;
      position: relative;
      color: white;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5); /* Dark overlay */
      z-index: 1;
    }

    form {
      background: transparent;
      padding: 40px;
      border-radius: 10px;
      backdrop-filter: blur(2px); /* Glassmorphism effect */
      width: 100%;
      max-width: 500px;
      position: relative;
      z-index: 2;
      text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 2.5rem;
      font-weight: bold;
      animation: fadeIn 1.5s ease-in-out;
    }

    .form-group label {
      font-size: 1.2rem;
      color: #f1f1f1;
      font-weight: 600;
    }

    .form-control {
      background: transparent;
      border: none;
      border-bottom: 2px solid #fff;
      border-radius: 0;
      color: white;
      font-size: 1.1rem;
      padding-left: 5px;
      box-shadow: none;
      transition: border-color 0.3s, background-color 0.3s;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.7);
    }

    .form-control:focus {
      border-bottom: 2px solid #17a2b8;
      box-shadow: none;
      outline: none;
    }

    .btn-primary {
      background: #17a2b8;
      border: none;
      border-radius: 50px;
      padding: 12px;
      font-size: 1.3rem;
      transition: all 0.3s ease-in-out;
    }

    .btn-primary:hover {
      background: #138496;
      transform: scale(1.05);
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
  <form action="shop" method="post">
    <h2>Please, Register Here</h2>
    <div class="form-group">
      <label for="shopName">Shop Name:</label>
      <input type="text" class="form-control" id="shopName" name="shopName" placeholder="Enter shopName" required>
    </div>
    <div class="form-group">
      <label for="ownerName">Owner Name:</label>
      <input type="text" class="form-control" id="ownerName" name="ownerName" placeholder="Enter ownerName" required>
    </div>
    <div class="form-group">
      <label for="location">Location:</label>
      <input type="text" class="form-control" id="location" name="location" placeholder="Enter location" required>
    </div>
    <div class="form-group">
      <label for="revenue">Revenue:</label>
      <input type="text" class="form-control" id="revenue" name="revenue" placeholder="Enter revenue" required>
    </div>
    <div class="form-group">
      <label for="size">Size:</label>
      <input type="text" class="form-control" id="size" name="size" placeholder="Enter size" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block btn-lg">Register Now</button>
    <a href="allShop" class="btn btn-primary btn-block btn-lg">Get Details</a>

  </form>

</body>
</html>
