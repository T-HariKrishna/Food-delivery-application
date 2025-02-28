<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp" %>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hari.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu - Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        padding-bottom: 80px; /* Space for fixed footer */
    }
    h1 {
        color: #2c3e50;
        text-align: center;
        margin-top: 100px;
        font-size: 2.2em;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .card-container {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        padding: 30px;
        max-width: 1400px;
        margin: 0 auto;
    }
    .card {
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 20px;
        transition: all 0.3s ease;
    }
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 8px;
        margin-bottom: 15px;
    }
    .card h3 {
        color: #2c3e50;
        margin-bottom: 15px;
        font-size: 1.3em;
    }
    .card p {
        color: #666;
        margin: 8px 0;
        font-size: 0.95em;
    }
    .card .rating {
        color: #f39c12;
        font-weight: bold;
    }
    .card .price {
        color: #27ae60;
        font-weight: bold;
        font-size: 1.2em;
    }
    .card .is-available {
        color: #3498db;
    }
    .card .quantity {
        margin-top: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .quantity-controls {
        display: flex;
        align-items: center;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
    }
    .quantity-btn {
        background: #f8f9fa;
        border: none;
        padding: 8px 12px;
        cursor: pointer;
        font-size: 18px;
        color: #2c3e50;
        transition: all 0.2s ease;
    }
    .quantity-btn:hover {
        background: #e9ecef;
    }
    .quantity-input {
        width: 50px;
        text-align: center;
        border: none;
        border-left: 2px solid #e0e0e0;
        border-right: 2px solid #e0e0e0;
        padding: 8px 0;
        font-size: 16px;
        color: #2c3e50;
        -moz-appearance: textfield;
    }
    .quantity-input::-webkit-outer-spin-button,
    .quantity-input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    .add-to-cart {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        flex-grow: 1;
        transition: all 0.3s ease;
    }
    .add-to-cart:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
    }
    

    /* Fixed Footer */
    .footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        background: linear-gradient(135deg, #2c3e50, #3498db);
        padding: 15px;
        display: flex;
        justify-content: center;
        align-items: center;
        box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.1);
    }
    .show-cart-btn {
        background: white;
        color: #2c3e50;
        padding: 12px 30px;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .show-cart-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
    }
    .show-cart-btn i {
        font-size: 20px;
    }
    h3 {
    color: red;
    margin-top: 20px;
    text-align: center;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
}

	.menu-empty{
		display: flex;
		justify-content: center;
		align-content: center;
	}

    @media (max-width: 1200px) {
        .card-container {
            grid-template-columns: repeat(3, 1fr);
        }
    }
    @media (max-width: 900px) {
        .card-container {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media (max-width: 600px) {
        .card-container {
            grid-template-columns: 1fr;
            padding: 15px;
        }
    }
    @media (max-width: 600px) {
    h3 {
        width: 100%;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }
}
    
</style>
</head>
<body>

<%
ArrayList<Menu> menuList = (ArrayList<Menu>)session.getAttribute("menuList");
String restaurantName = (String) session.getAttribute("restaurantName");
%>

<h1>Menu List of <%= restaurantName %> Restaurant</h1>

<div id="menu-empty">
     	<% if(menuList.isEmpty() || menuList==null) {%>
    	<h3  >Restaurant doesn't have any menu, please visit some other time !!!</h3>
    	<% } %>
	</div>
<div class="card-container">
   <%if(!menuList.isEmpty()){ %>
   	 <% for(Menu menu: menuList) { %>
        <div class="card">
            <% if(menu.getImagePath() != null && !menu.getImagePath().isEmpty()) { %>
                <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %>">
            <% } else { %>
                <img src="https://via.placeholder.com/300x200" alt="Default Image">
            <% } %>

            <h3><%= menu.getItemName() %></h3>
            <p><strong>Menu ID: </strong><%=menu.getMenuId() %></p>
            <p><strong>Description:</strong> <%= menu.getDescription() %></p>
            <p class="price"><strong>Price:</strong> ₹<%= menu.getPrice() %></p>
            <p><strong>Ratings:</strong> <span class="rating"><%= menu.getRatings() %> ★</span></p>
            <p><strong>Available:</strong> <span class="is-available"><%= (int)menu.isAvailable()==1 ? "Yes" : "No" %></span></p>

            <form action="AddToCartServlet" method="get">
            
                <input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
                <div class="quantity">
                    <div class="quantity-controls">
                        <button type="button" class="quantity-btn minus" onclick="decrementQuantity(this)">-</button>
                        <input type="number" value="1" min="1" name="quantity" class="quantity-input" readonly>
                        <button type="button" class="quantity-btn plus" onclick="incrementQuantity(this)">+</button>
                    </div>
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </div>
                
            </form>
            
        </div>
    <% } }%>
    
  
</div>

   

<footer class="footer">
    <form action="ShowCart">
        <button type="submit" class="show-cart-btn">
            <i class="fas fa-shopping-cart"></i>
            View Cart
        </button>
    </form>
</footer>

<script>
    function incrementQuantity(button) {
        const input = button.parentElement.querySelector('.quantity-input');
        input.value = parseInt(input.value) + 1;
    }

    function decrementQuantity(button) {
        const input = button.parentElement.querySelector('.quantity-input');
        const currentValue = parseInt(input.value);
        if (currentValue > 1) {
            input.value = currentValue - 1;
        }
    }
</script>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</body>
</html>