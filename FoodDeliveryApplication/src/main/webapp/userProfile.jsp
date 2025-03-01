<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 <%@ include file="navigationBar.jsp" %>

<%@ page import="java.util.*" %> 
<%@ page import="com.hari.model.User" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Profile</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", system-ui, -apple-system, sans-serif;
      }

      body {
        background: white;
        min-height: 100vh;
        padding: 40px 20px;
        line-height: 1.6;
      }

      .container {
        background-color: #fff;
        max-width: 800px;
        margin: 50px auto;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      }

      h1 {
        text-align: center;
        font-size: 36px;
        color: #d9534f;
        margin-bottom: 40px;
        font-weight: 700;
        position: relative;
      }

      h1::after {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, #ff6f61, #d9534f);
        border-radius: 2px;
      }

      form {
        display: grid;
        gap: 24px;
      }

      .form-group {
        display: grid;
        gap: 8px;
      }

      label {
        font-size: 14px;
        color: #444;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.05em;
      }
      
     
		
     .input-field {
        width: 100%;
       padding: 14px 16px ; 
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 16px;
        color: #333;
        background-color: #fafafa;
        transition: all 0.3s ease;
      }

      .input-field:focus{
        border-color: #ff6f61;
        background-color: #fff;
        outline: none;
        box-shadow: 0 0 0 4px rgba(255, 111, 97, 0.2);
      }

       input[readonly],
      textarea[readonly] {
        background-color: #f1f5f9;
        border-color: #e2e8f0;
        cursor: not-allowed;
        color: #64748b;
      }  
      textarea {
      padding-left:0px;
        min-height: 100px;
        resize: vertical;
      }

      .form-actions {
        display: flex;
        gap: 16px;
        justify-content: center;
        margin-top: 20px;
      }

      .btn,.back {
        padding: 14px 32px;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        border: none;
        outline: none;
      }

      .btn-primary {
        background: linear-gradient(135deg, #ff6f61 0%, #d9534f 100%);
        color: white;
        box-shadow: 0 4px 12px rgba(255, 111, 97, 0.2);
      }

      .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(255, 111, 97, 0.3);
      }

      .btn-secondary,.back{
        background: linear-gradient(135deg, #6c757d 0%, #a6b1b7 100%);
        color: white;
      }
      .back{
      	text-decoration: none;
      }
      

      .btn-secondary,.back:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(108, 117, 125, 0.3);
      }

      @media (max-width: 768px) {
        .container {
          padding: 24px;
        }

        h1 {
          font-size: 28px;
          margin-bottom: 30px;
        }

         .input-field {
          padding: 12px;
          font-size: 14px;
        }
        .btn,.back {
          padding: 12px 24px;
          font-size: 14px;
        }
      }

      /* Styling for Show/Hide button */
      .password-wrapper {
        display: flex;
        align-items: center;
      }

      .password-wrapper button {
        margin-left: 10px;
        padding: 6px 12px;
        font-size: 14px;
        cursor: pointer;
        border: none;
        border-radius: 8px;
        background-color: #ff6f61;
        color: white;
        transition: background-color 0.3s;
      }

      .password-wrapper button,.back:hover {
        background-color: #d9534f;
      }
      
      
      select {
  margin-bottom: 15px;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  outline: none;
  background-color: #fff;
}

/* Highlight the select field when focused */
select:focus {
  border-color: #ff6f61; /* Highlight with the food delivery color */
  background-color: #f8f8f8; /* Light background on focus */
}

/* Add some padding and style to the options (if desired) */
select option {
  padding: 10px;
  font-size: 16px;
}
    </style>
  </head>
  <body>
    <div class="container">
      <h1>User Profile1</h1>
      <% User user = (User) session.getAttribute("user"); %>
      <form action="EditProfile" method="POST" class="profile-form">
        <div class="form-group">
          <label for="role">Role</label>
          
          
          
          <select name="role" id="role">
          	<option value="admin" <%="admin".equalsIgnoreCase(user.getRole())?"selected":"" %> >Admin</option>
          	<option value="user" <%="user".equalsIgnoreCase(user.getRole())?"selected":"" %> >User</option>
          </select>
         
        </div>
        
        <div class="form-group">
          <label for="name">Full Name</label>
          <input
          class="input-field"
            type="text"
            id="name"
            name="name"
            value="<%= user.getName().toUpperCase() %>"
            readonly
          />
        </div>
        

        <div class="form-group">
          <label for="username">Username</label>
          <input
          class="input-field"
            type="text"
            id="username"
            name="username"
            value="<%= user.getUsername() %>"
            readonly
          />
        </div>

        <div class="form-group">
          <label for="email">Email Address</label>
          <input
          class="input-field"
            type="email"
            id="email"
            name="email"
            value="<%= user.getEmail() %>"
            readonly
          />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <div class="password-wrapper">
            <input
            class="input-field"
              type="password"
              id="password"
              name="password"
              value="<%= user.getPassword() %>"
              readonly
            />
            <button type="button" onclick="togglePassword()">Show</button>
          </div>
        </div>

        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input
          class="input-field"
            type="tel"
            id="phone"
            name="phone"
            value="<%= user.getPhone() %>"
            readonly
          />
        </div>

        <div class="form-group">
          <label for="address">Address</label>
          <textarea class="input-field" id="address" name="address" readonly>
            <%= user.getAddress().trim() %>
          </textarea>
        </div>



		
        <div class="form-actions">
        
        
        <%if(user != null && "admin".equals(user.getRole())) {%>
     			 <a href="adminHomePage.jsp" class="back">&larr; </a>
      	<%} %>
        
        <%if(user != null && "user".equals(user.getRole())) {%>
     			 <a href="homePage.jsp" class="back">&larr; </a>
      	<%} %>


       <a href="LogOut" class="back">Log Out</a>
          <button
            type="button"
            class="btn btn-secondary"
            onclick="toggleEdit()"
          >
            Edit Profile
          </button>
          
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </form>
    </div>

    <script>
      function toggleEdit() {
        const fields = document.querySelectorAll(".profile-form input, .profile-form textarea");
        const editButton = document.querySelector(".btn-secondary");

        fields.forEach((field) => {
          if (field.type !== "submit") {
            field.readOnly = !field.readOnly; // Toggle readOnly for fields
            /* if (!fields[0].readOnly) {
            	  fields[0].focus();  // Focus on the first field when editable
            	} */
          }
        });

        // Toggle the button text
        if (editButton.textContent === "Edit Profile") {
          editButton.textContent = "Cancel Edit"; // Change to "Cancel Edit" when editable
        } else {
          editButton.textContent = "Edit Profile"; // Revert to "Edit Profile" when not editable
        }
      }

      function togglePassword() {
        const passwordField = document.getElementById("password");
        const passwordButton = document.querySelector(
          ".password-wrapper button"
        );

        if (passwordField.type === "password") {
          passwordField.type = "text";
          passwordButton.textContent = "Hide"; // Change button text to "Hide"
        } else {
          passwordField.type = "password";
          passwordButton.textContent = "Show"; // Change button text to "Show"
        }
      }
    </script>
  </body>
</html>
