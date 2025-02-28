<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Navigation Bar</title>
<style>
    .navbar {
        background: linear-gradient(135deg, #2c3e50, #3498db);
        color: white;
        padding: 15px;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }
    .container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .restaurant-name {
        font-size:2em;
        font-weight: bold;
        margin: 0;
    }
    .nav-menu {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
    }
    .nav-menu li {
        margin-left: 25px;
    }
    .nav-menu a {
        color: white;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    .nav-menu a:hover {
        color: rgba(255, 255, 255, 0.7);
    }
    
    @media (max-width: 768px) {
        .container {
            flex-direction: column;
            align-items: flex-start;
        }
        .nav-menu {
            margin-top: 15px;
            width: 100%;
        }
        .nav-menu li {
            margin-left: 0;
            margin-right: 15px;
        }
    }
</style>
</head>
<body>

<%
    // Get restaurant name from session or set a default
    String restaurantName = (String) session.getAttribute("restaurantName");
    if(restaurantName == null) {
        restaurantName = "Restaurant Name";
    }
%>

<nav class="navbar">
    <div class="container">
        <h2 class="restaurant-name"><%= restaurantName %></h2>
        <ul class="nav-menu">
            <li><a href="homePage.jsp">Home</a></li>
            
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </div>
</nav>

</body>
</html>
