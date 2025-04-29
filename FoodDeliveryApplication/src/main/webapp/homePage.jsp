<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navigationBar.jsp" %>
    
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hari.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Food Delivery</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    h1 {
        color: green;
        text-align: center;
        margin-top: 30px;
    }
    .card-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        padding: 30px;
    }
    .card {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        transition: transform 0.3s ease;
    }
    .card:hover {
        transform: translateY(-10px);
    }
    .card img {
        width: 100%;
         height: 200px; /* Fixed height for images */
    object-fit: cover; /* Ensures images don't stretch or distort */
        border-radius: 8px;
        margin-bottom: 15px;
    }
    .card h3 {
        color: #333;
        margin-bottom: 15px;
    }
    .card p {
        color: #666;
        margin: 5px 0;
    }
    .card .rating {
        color: #f39c12;
        font-weight: bold;
    }
    .card .is-active {
        color: #27ae60;
    }
    .card .eta {
        color: #3498db;
        font-weight: bold;
    }
    
    

</style>
</head>
<body>

<h1>Restaurant Lists</h1>

<div class="card-container">
<% 
User user=(User)session.getAttribute("user");
ArrayList<Restaurant> restList = (ArrayList<Restaurant>) session.getAttribute("restaurantList");
for (Restaurant restaurant : restList) { 
%>
    <div class="card">
        <!-- Add image path here -->
        <a href="FetchMenuDetails?restaurantId=<%= restaurant.getRestaurantId() %>&restaurantName=<%= restaurant.getName() %>">
  <img src="<%=restaurant.getImagePath() %>" alt="<%= restaurant.getName() %> Image">
</a>
        
        <%-- <a href=""><img src="<%= restaurant.getImagePath() %>" alt="<%= restaurant.getName() %> Image"></a>
        <a href="FetchMenuDetails?restaurantId=<%=restaurant.getRestaurantId() %>"><img src="https://img.freepik.com/free-photo/side-view-chicken-kebab-with-grilled-hot-green-pepper-tomato-pickled-cabbage-rice-pita_141793-4837.jpg" alt="<%= restaurant.getName() %> Image"></a> --%>
        <h3><%= restaurant.getName() %></h3>
        <p><strong>Restaurant ID:</strong> <%= restaurant.getRestaurantId() %></p>
        <p><strong>Address:</strong> <%= restaurant.getAddress() %></p>
        <p><strong>Phone:</strong> <%= restaurant.getPhone() %></p>
        <p><strong>Rating:</strong> <span class="rating"><%= restaurant.getRating() %></span></p>
        <p><strong>Cuisine Type:</strong> <%= restaurant.getCuisineType() %></p>
        <p><strong>Is Active:</strong> <span class="is-active"><%= (restaurant.isActive() == 1) ? "Yes" : "No" %></span></p>
        <p><strong>ETA:</strong> <span class="eta"><%= restaurant.getEta() %></span></p>
        <!-- Display the image path (optional) -->
       <%--  <p><strong>Image Path:</strong> <%= restaurant.getImagePath() %></p> --%>
    </div>
<% } %>


</div>

<script type="text/javascript">
    var userName = "<%= user.getName() %>";
    let visit=0;
    window.confirm("Welcome back, "+userName);
</script>
</body>
</html>
