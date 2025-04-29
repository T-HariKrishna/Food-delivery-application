<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Reset Password</title>
    <style>
      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: rgb(221, 234, 200);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      form {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 400px;
      }

      h2 {
        text-align: center;
        color: #333333;
        margin-bottom: 20px;
      }

      .form-group {
        margin-bottom: 15px;
        position: relative;
      }

      label {
        display: block;
        margin-bottom: 8px;
        color: #555555;
      }

      input[type="text"],
      input[type="password"] {
        width: 99%;
        padding: 10px 12px;
        border: 1px solid #cccccc;
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s ease-in-out;
      }

      input[type="text"]:focus,
      input[type="password"]:focus {
        border-color: #f7797d;
        outline: none;
      }

      a {
        position: absolute;
        top: 34px;
        right: -10px;
        font-size: 20px;
        cursor: pointer;
        color: #007bff;
        text-decoration: none;
        user-select: none;
      }

      button {
        width: 100%;
        padding: 12px;
        border: none;
        background-color: #f7797d;
        color: white;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: #d65f65;
      }

      #err_msg {
        color: red;
        margin-bottom: 10px;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <% String userErrorMessage = (String)
    session.getAttribute("userErrorMessage"); %> 
    <form action="ResetPassword" method="post" id="resetForm">
      <h2>OTP Verified Successfully!</h2>

      <% if (userErrorMessage != null) { %>
      <p id="err_msg"><%= userErrorMessage %></p>
      <% } %> 

      <div class="form-group">
        <label>Enter Username</label>
        <input type="text" name="username" required />
      </div>

      <div class="form-group" id="newPasswordBlock">
        <label>Enter New Password</label>
        <input type="password" id="newPassword" name="newPassword" required />
        <a id="newPasswordButton" onclick="toggleNewPassword()">🙂</a>
      </div>

      <div class="form-group" id="confirmPasswordBlock">
        <label>Confirm Password</label>
        <input
          type="password"
          id="confirmPassword"
          name="confirmPassword"
          required
        />
        <a id="confirmPasswordButton" onclick="toggleConfirmPassword()">🙂</a>
      </div>

      <p
        id="passwordError"
        style="display: none; color: red; text-align: center"
      >
       password & confirm password mismatching.
      </p>

      <button type="submit">Submit</button>
      <%session.removeAttribute("userErrorMessage"); %>
    </form>

    <script type="text/javascript">
      function toggleNewPassword() {
        const passwordField = document.getElementById("newPassword");
        const passwordButton = document.getElementById("newPasswordButton");
        if (passwordField.type === "password") {
          passwordField.type = "text";
          passwordButton.textContent = "  😎 ";
        } else {
          passwordField.type = "password";
          passwordButton.textContent = "🙂";
        }
      }

      function toggleConfirmPassword() {
        const passwordField = document.getElementById("confirmPassword");
        const passwordButton = document.getElementById("confirmPasswordButton");
        if (passwordField.type === "password") {
          passwordField.type = "text";
          passwordButton.textContent = "😎";
        } else {
          passwordField.type = "password";
          passwordButton.textContent = "🙂";
        }
      }

      document
        .getElementById("resetForm")
        .addEventListener("submit", function (e) {
          const newPassword = document.getElementById("newPassword").value;
          const confirmPassword =
            document.getElementById("confirmPassword").value;
          const errorMsg = document.getElementById("passwordError");

          if (newPassword !== confirmPassword) {
            e.preventDefault();
            errorMsg.style.display = "block";
          } else {
            errorMsg.style.display = "none";
          }
        });
    </script>
  </body>
</html>
