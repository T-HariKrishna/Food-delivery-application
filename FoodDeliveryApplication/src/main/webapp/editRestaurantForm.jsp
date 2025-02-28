<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp"%>
    <%@ page import="com.hari.model.Restaurant" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Restaurant Details</title>
    <style>
    
        body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin-top: 70px;
	padding: 0;
}

h1 {
	color: green;
	text-align: center;
	margin-top: 30px;
}
      .form-container {
        width: 65%;
        
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 0 auto;
      }

      label {
        font-size: 14px;
        margin-top: 10px;
        display: block;
      }

      input,
      select {
        width: 100%;
        padding: 8px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .submit-btn {
        width: 100%;
        padding: 10px;
        background-color: #4caf50;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
      }

      .submit-btn:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
  <%   
  User user=(User)session.getAttribute("user");
  Restaurant restaurant=(Restaurant)session.getAttribute("restaurantDetails"); %>
    <div class="form-container">
      <h1>Update Restaurant Details</h1>
      <form action="UpdateRestaurant" method="post">
        <input type="hidden" id="restaurantId" name="restaurantId"  value="<%=restaurant.getRestaurantId() %>" />
        
        <label for="name">Restaurant Name:</label>
        <input type="text" id="name" name="name"  value="<%=restaurant.getName() %>" />

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" value="<%=restaurant.getPhone() %>" />

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%=restaurant.getAddress() %>" />


        <label for="rating">Rating (0 to 5):</label>
        <input
          type="number"
          id="rating"
          name="rating"
          min="0"
          max="5"
          step="0.1"
          value="<%=restaurant.getRating() %>"
        />

        <label for="cuisineType">Cuisine Type:</label>
        <input type="text" id="cuisineType" name="cuisineType" value="<%=restaurant.getCuisineType() %>" />

        <label for="isActive">Active:</label>
        <select id="isActive" name="isActive" required>
          <option value="1" <%=restaurant.isActive()==1?"selected":"" %> >Yes</option>
          <option value="0"<%=restaurant.isActive()==0?"selected":"" %> >No</option>
        </select>

        <label for="adminUserId">Admin User ID:</label>
        <input type="number" id="adminUserId" name="adminUserId" value="<%=user.getUserId() %>" readonly />

        <label for="imagePath">Image Path (URL):</label>
        <input type="text" id="imagePath" name="imagePath" value="<%=restaurant.getImagePath() %>" />

        <button type="submit" class="submit-btn">Update Details</button>
      </form>
    </div>
  </body>
</html>


 