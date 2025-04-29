<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In - Food Delivery</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f8f9fa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 400px;
    }

    h2 {
      text-align: center;
      color: #ff6f61;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 15px;
      position: relative;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .toggle-btn {
      position: absolute;
      right: -190px;
      top: 20px;
      background: none;
      border: none;
      font-size: 20px;
      cursor: pointer;
    }

    .error {
      color: red;
      margin-bottom: 15px;
      text-align: center;
    }

    .forgot {
      display: block;
      text-align: right;
      font-size: 14px;
      margin-bottom: 10px;
      color: #333;
      text-decoration: none;
    }

    .forgot:hover {
      text-decoration: underline;
    }

    button {
      width: 100%;
      padding: 12px;
      background: #ff6f61;
      color: white;
      border: none;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
    }

    .register {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .register a {
      color: #ff6f61;
      text-decoration: none;
    }

    .register a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Sign In</h2>

    <% 
      String password_message = (String) request.getAttribute("invalid_password_message");
      String user_message = (String) request.getAttribute("invalid_user_message"); 
    %>

    <% if (user_message != null) { %>
      <div class="error"><%= user_message %></div>
    <% } else if (password_message != null) { %>
      <div class="error"><%= password_message %></div>
    <% } %>

    <form action="SignInValidation" method="POST">
      <div class="form-group">
        <label for="username">Username or Email</label>
        <input type="text" id="username" name="username" required />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />
        <button type="button" class="toggle-btn" onclick="togglePassword()">🙂</button>
      </div>

      <a class="forgot" href="forgotPassword.jsp">Forgot password?</a>

      <button type="submit">Sign In</button>
    </form>

    <div class="register">
      Don't have an account? <a href="registerPage.html">Register here</a>
    </div>
  </div>

  <script>
    function togglePassword() {
      const password = document.getElementById("password");
      const toggleBtn = document.querySelector(".toggle-btn");
      if (password.type === "password") {
        password.type = "text";
        toggleBtn.textContent = "😎";
      } else {
        password.type = "password";
        toggleBtn.textContent = "🙂";
      }
    }
  </script>
</body>
</html>
