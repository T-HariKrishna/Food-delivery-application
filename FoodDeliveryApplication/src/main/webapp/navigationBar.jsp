<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hari.model.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Food Delivery App</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          "Helvetica Neue", Arial, sans-serif;
      }

      body {
        background-color: #f5f5f5;
        min-height: 100vh;
      }

      .navbar {
        background-color: white;
        padding: 16px 32px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
      }

      .logo {
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
      }

      .logo-icon {
        font-size: 32px;
      }

      .logo-text {
        font-size: 24px;
        font-weight: 700;
        color: #ff4d4d;
      }

      .search-container {
        flex: 1;
        max-width: 600px;
        margin: 0 48px;
        position: relative;
      }
      
       .search-btn {
     
    background-color: #ff4d4d;
    color: white;
    border: none;
    padding: 12px 24px;
    font-size: 16px;
    border-radius: 25px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;
  }

  .search-btn:hover {
    background-color: #ff3333;
   /*  transform: translateY(-1px); */
    box-shadow: 0 4px 12px rgba(255, 77, 77, 0.2);
  }
  .search-container button {
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    padding: 12px 24px;
    border-radius: 25px;
    background-color: #ff4d4d;
    color: white;
    border: none;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .search-container button:hover {
    background-color: #ff3333;
    box-shadow: 0 4px 12px rgba(255, 77, 77, 0.2);
  }

      .search-icon {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #666;
      }

      .search-input {
        width: 100%;
        padding: 12px 100px 12px 45px;
        border: 2px solid #eee;
        border-radius: 25px;
        font-size: 16px;
        outline: none;
        transition: all 0.3s ease;
        background-color: #f8f8f8;
      }

      .search-input:focus {
        border-color: #ff4d4d;
        background-color: white;
        box-shadow: 0 0 0 4px rgba(255, 77, 77, 0.1);
      }

      .nav-items {
        display: flex;
        align-items: center;
        gap: 32px;
      }

      .nav-item {
        display: flex;
        align-items: center;
        gap: 6px;
        text-decoration: none;
        color: #333;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .nav-item:hover {
        color: #ff4d4d;
      }

      .nav-item i {
        font-size: 20px;
      }

      .sign-in {
        background-color: #ff4d4d;
        color: white;
        padding: 10px 24px;
        border-radius: 25px;
        font-weight: 600;
        transition: all 0.3s ease;
      }

      .sign-in:hover {
        background-color: #ff3333;
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(255, 77, 77, 0.2);
      }

      @media (max-width: 1024px) {
        .search-container {
          margin: 0 24px;
        }
        .nav-items {
          gap: 24px;
        }
      }

      @media (max-width: 768px) {
        .navbar {
          padding: 16px;
        }
        .search-container {
          margin: 0 16px;
        }
        .nav-item span {
          display: none;
        }
        .nav-items {
          gap: 16px;
        }
        
      }
    </style>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
  </head>
  <body>
   <% 
     // Get the user object from the session
     User user2 = (User) session.getAttribute("user"); 
   %>
    <nav class="navbar">
     <%if(user2 != null && "user".equals(user2.getRole())) {%>
      <a href="homePage.jsp" class="logo">
        <i class="fas fa-utensils logo-icon"></i>
        <span class="logo-text">FoodHub</span>
      </a>
      <%} %>

	<%if(user2 != null && "admin".equals(user2.getRole())) {%>
      <a href="adminHomePage.jsp" class="logo">
        <i class="fas fa-utensils logo-icon"></i>
        <span class="logo-text">FoodHub</span>
      </a>
      <%} %>



      <div class="search-container">
     <form action="Search">
        <i class="fas fa-search search-icon"></i>
        <input
          type="text"
          placeholder="Search for restaurants or items..."
          class="search-input"
          name="search"
        />
		<button type="submit" class="search-btn">Search</button>
 
		</form>
      </div>




		<div class="nav-items">
        <!-- Display Order History link only if user is logged in (i.e., user is not null) -->
        <% if (user2 != null && "user".equals(user2.getRole())) { %>
          <a href="OrderHistoryDetails?userId=<%= user2.getUserId() %>" class="nav-item">
            <i class="fas fa-history"></i>
            <span>Order History</span>
          </a>
        <% } %>
        
       <%if(user2 != null && "user".equals(user2.getRole())){ %>
        <!-- Display Cart link for all users -->
        <a href="cart.jsp" class="nav-item">
          <i class="fas fa-shopping-cart"></i>
          <span>Cart</span>
        </a>
        <%} %>
        
        <!-- Display Profile link only if user is logged in -->
        <% if (user2 != null) { %>
          <a href="UserProfile" class="nav-item">
            <i class="fas fa-user"></i>
            <span>Profile</span>
          </a>
        <% } %>
        
        <!-- Display Sign In link only if user is not logged in -->
        <% if (user2 == null) { %>
          <a href="signInPage.html" class="nav-item sign-in">Sign In</a>
        <% } %>
      </div>
    </nav>
  </body>
</html>
