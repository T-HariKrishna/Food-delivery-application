<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In - Food Delivery</title>
 <style>
      /* Basic reset */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Arial", sans-serif;
        background-color: #f8f8f8;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .signin-container {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
      }

      h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #ff6f61; /* Bright red/orange color for food delivery */
      }

      .signin-form {
        display: flex;
        flex-direction: column;
      }

      label {
        margin-bottom: 5px;
        font-size: 14px;
        font-weight: bold;
      }

      input {
        margin-bottom: 15px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
      }

      input:focus {
        border-color: #ff6f61; /* Highlight with food delivery color */
      }

      button.submit-btn {
        background-color: #ff6f61;
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
      }

      button.submit-btn:hover {
        background-color: #ff3e2a; /* Darker red-orange on hover */
      }

      button.submit-btn:active {
        background-color: #e1361c; /* Active state */
      }

      /* Register Link styling */
      .register-link {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
      }

      .register-link a {
        color: #ff6f61;
        text-decoration: none;
      }

      .register-link a:hover {
        text-decoration: underline;
      }
      #forgotPassword{
      margin-bottom: 5px; 
      text-decoration: none;
      color:black ;
      }
      #forgotPassword:hover{
      text-decoration: underline;
      color:red;
      }
      
      
    </style>
  </head>
  <body>
    <div class="signin-container">
      <h2>Sign In to Food Delivery</h2>
      
      
      <% String message = (String) request.getAttribute("message"); %>
   
      <form action="SignInValidation" method="POST" class="signin-form">
        <label for="username">Username or Email</label>
        <input
          type="text"
          id="username"
          name="username"
          placeholder="Enter your username or email"
          required
        />

        <label for="password">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          placeholder="Enter your password"
          required
        />
		<span><a href="forgotPassword.jsp" id="forgotPassword">Forgot password?</a></span>
		 <% if (message != null) { %>
        <p style="color:red; margin:10px 0px;"><%= message %></p>
    <% } %>
        <button type="submit" class="submit-btn">Sign In</button>
      </form>

      <!-- Register Link -->
      <p class="register-link">
        Don't have an account? <a href="registerPage.html">Register here</a>
      </p>
    </div>
  </body>
</html>