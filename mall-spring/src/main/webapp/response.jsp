<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false"%>
<html>
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      body {
        background-image: url('image.jpg');
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
        color: black;
        text-align: center;
      }

      .moving-text {
        font-size: 2.5em;
        animation: moveText 5s infinite linear;
        color: black;
      }

      h2 {
        font-size: 1.5em;
        font-family: Arial, sans-serif;
      }

      @keyframes moveText {
        0% { transform: translateX(100%); }
        100% { transform: translateX(-100%); }
      }

      .btn-container {
        margin-top: 20px;
      }

      .btn-primary {
        background-color: blue;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
      }

      .btn-primary:hover {
        background-color: #45a049;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="moving-text">
      <h2>THANK YOU, ${name} FOR REGISTERING &#128512;</h2>
    </div>
    <div class="btn-container">
      <a href="index.jsp" class="btn-primary">Add User</a>
    </div>
  </body>
</html>
