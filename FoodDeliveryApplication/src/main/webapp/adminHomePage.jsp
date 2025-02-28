<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.hari.model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home - Food Delivery</title>
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
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* Ensures button is always at the bottom */
    height: 100%; /* Ensure all cards are the same height */
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

.add-card {
    background: #707070;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}

.add-card:hover {
    background: #484848;
    color: white;
}

.add-card a {
    color: #fff;
    font-size: 18px;
    text-decoration: none;
    padding: 20px;
}

.delete,.edit {
    background: #EF0107;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s ease;
    margin-top: 20px; /* Ensure it's at the bottom of the card */
}
.edit{
 background: #707070;
    color: white;
}

.edit:hover {
background: #484848;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
}

.delete:hover {
 background: #D2122E;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
}

</style>
</head>
<body>

<h1>Restaurant Lists</h1>

<div class="card-container">
    <%
    ArrayList<Restaurant> restList = (ArrayList<Restaurant>) session.getAttribute("restaurantList");
    for (Restaurant restaurant : restList) {
    %>
    <div class="card">
        <!-- Add image path here -->
        <a href="AdminFetchMenuDetails?restaurantId=<%=restaurant.getRestaurantId()%>&restaurantName=<%=restaurant.getName()%>">
            <img src="<%=restaurant.getImagePath() %>" alt="<%=restaurant.getName()%> Image">
        </a>

        <h3><%=restaurant.getName()%></h3>
        <p><strong>Restaurant ID:</strong> <%=restaurant.getRestaurantId()%></p>
        <p><strong>Address:</strong> <%=restaurant.getAddress()%></p>
        <p><strong>Phone:</strong> <%=restaurant.getPhone()%></p>
        <p><strong>Rating:</strong> <span class="rating"><%=restaurant.getRating()%></span></p>
        <p><strong>Cuisine Type:</strong> <%=restaurant.getCuisineType()%></p>
        <p><strong>Is Active:</strong> <span class="is-active"><%=(restaurant.isActive() == 1) ? "Yes" : "No"%></span></p>
        <p><strong>ETA:</strong> <span class="eta"><%=restaurant.getEta()%></span></p>

        <a href="EditRestaurant?restaurantId=<%=restaurant.getRestaurantId()%>">
            <center><button class="edit">Edit Restaurant</button></center>
        </a>
        <a href="DeleteRestaurant?restaurantId=<%=restaurant.getRestaurantId()%>">
            <center><button class="delete">Delete Restaurant</button></center>
        </a>
    </div>
    <% } %>

    <div class="card add-card">
        <a href="addRestaurantForm.jsp">Add New Restaurant</a>
    </div>
</div>

</body>
</html>
