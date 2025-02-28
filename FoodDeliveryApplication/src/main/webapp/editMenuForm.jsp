<%@page import="com.hari.daoimplementaion.RestaurantDaoImplementation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navigationBar.jsp" %>
    <%@ page import="com.hari.model.Menu" %>
    <%@ page import="com.hari.dao.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Menu Details</title>
    <style>
    
    body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin-top: 60px;
	padding: 0;
}

h1 {
	color: green;
	text-align: center;
	margin-top: 30px;
}
      .form-container {
        width: 400px;
        /* max-height: 500px;
        overflow-y: auto; */
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
      margin-top:20px;
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
    
    <%Menu menu=(Menu)session.getAttribute("menuDetails"); 
    	RestaurantDaoImplementation restaurantDao=new RestaurantDaoImplementation();
    %>
    
    <div class="form-container">
     <h1>Update Menu Details</h1>
        <form action="UpdateMenu" method="post">
        <input type="hidden" id="menuId" name="menuId"  value="<%=menu.getMenuId() %>" readonly/>
      
        <label for="restaurantId">Restaurant ID:</label>
        <input type="text" id="restaurantId" name="restaurantId"  value="<%=menu.getRestaurantId() %>" readonly/>
      
        <label for="restaurantId">Restaurant Name:</label>
        <input type="text" id="restaurantName" name="restaurantName"  value="<%=restaurantDao.getRestaurantName(menu.getRestaurantId()) %>" readonly/>
      
        <label for="name">Item Name:</label>
        <input type="text" id="name" name="name" value="<%=menu.getItemName() %>" />

        <label for="phone">Description:</label>
        <input type="text" id="description" name="description" value="<%=menu.getDescription() %>" />

        <label for="address">Price:</label>
        <input type="number" id="price" name="price" step="0.1" value="<%=menu.getPrice() %>" />


        <label for="rating">Rating (0 to 5):</label>
        <input
          type="number"
          id="rating"
          name="rating"
          min="0"
          max="5"
          step="0.10"
          value="<%=menu.getRatings() %>"
        />

        
        <label for="isAvailable">Is Available:</label>
        <select id="isAvailable" name="isAvailable" required>
          <option value="1" <%=menu.isAvailable()==1?"selected":"" %> >Yes</option>
          <option value="0"  <%=menu.isAvailable()==0?"selected":"" %> >No</option>
        </select>

       
        <label for="imagePath">Image Path (URL):</label>
        <input type="text" id="imagePath" name="imagePath" value="<%=menu.getImagePath() %>" />

        <button type="submit" class="submit-btn">Submit</button>
      </form>
    </div>
  </body>
</html>
