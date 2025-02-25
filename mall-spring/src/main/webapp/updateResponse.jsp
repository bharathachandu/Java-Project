<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details Updated</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      body {
        background-image: url('image.jpg'); /* Replace with your image path */
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-family: Arial, sans-serif;
        color: black;
        margin: 0;
      }

      .moving-text {
        font-size: 2rem;
        font-weight: bold;
        animation: moveText 10s infinite linear;
        white-space: nowrap;
        color: #343a40;
        margin-bottom: 20px;
      }

      @keyframes moveText {
        0% {
          transform: translateX(100%);
        }
        100% {
          transform: translateX(-100%);
        }
      }

      .btn-primary {
        background: #007bff;
        border: none;
        border-radius: 50px;
        padding: 10px 20px;
        font-size: 1.2rem;
        transition: background-color 0.3s ease, transform 0.3s ease;
      }

      .btn-primary:hover {
        background-color: #0056b3;
        transform: scale(1.05);
      }
    </style>
  </head>
  <body>
    <div class="moving-text">
      <h2>${name}, YOUR DETAILS ARE UPDATED</h2>
    </div>
    <a href="allShop" class="btn btn-primary btn-lg">Get Details</a>
  </body>
</html>
