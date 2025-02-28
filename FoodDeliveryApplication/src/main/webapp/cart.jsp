<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp" %>

<%@ page import="java.util.Map"%>
<%@ page import="com.hari.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            margin-top: 100px;
            text-align: center;
            color: #1a73e8;
            font-size: 28px;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            border-collapse: collapse;
        }

        th {
            background: #1a73e8;
            color: white;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .quantity-input {
            width: 60px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: center;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
            color: white;
        }

        .update-btn {
            background: #1a73e8;
        }

        .update-btn:hover {
            background: #1557b0;
        }

        .remove-btn {
            background: #dc3545;
        }

        .remove-btn:hover {
            background: #c82333;
        }

        .checkout-btn,.back {
            background: #28a745;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
        }

        .checkout-btn:hover {
            background: #218838;
        }

        .clear-cart-btn,.back {
            background: #6c757d;
        }

        .clear-cart-btn,.back:hover {
            background: #5a6268;
        }

        .total-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .total-section h2 {
            color: #1a73e8;
            margin: 0 0 10px 0;
        }

        .price {
            color: #28a745;
            font-size: 20px;
            font-weight: bold;
        }

        .empty-cart {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        a{
        	text-decoration: none;
        }
        

        .empty-cart p {
            color: #666;
            margin-bottom: 20px;
        }

        .continue-shopping-btn {
            background: #1a73e8;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            display: inline-block;
        }

        .continue-shopping-btn:hover {
            background: #1557b0;
        }

        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        /* .back{
            	margin-left: -10px;
            	margin-right: 130px;
            } */

        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 10px;
            }

            table {
                font-size: 14px;
            }

            .btn {
                padding: 6px 12px;
            }
           /*  .back{
            	margin-left: -10px;
            	margin-right: 130px;
            } */
            
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Shopping Cart</h1>
        
        <% 
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        %>

        <% if (cart != null && !cart.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    double total = 0; 
                    for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                        CartItem cartItem = entry.getValue();
                    %>
                    <tr>
                        <td><%= cartItem.getName() %></td>
                        <td>₹<%= cartItem.getPrice() %></td>
                        <td>
                            <form action="UpdateCart" method="post" style="display: flex; align-items: center;">
                                <input type="hidden" name="menuId" value="<%= cartItem.getItemId() %>" /><!-- menuId and itemId are same -->
                                <input type="number" name="quantity" value="<%= cartItem.getQuantity() %>" min="1" class="quantity-input" />
                                <button type="submit" class="btn update-btn">Update</button>
                            </form>
                        </td>
                        <td class="price">₹<%= String.format("%.2f", cartItem.getQuantity() * cartItem.getPrice()) %></td>
                        <td>
                            <form action="RemoveCartItem" method="post">
                                <input type="hidden" name="menuId" value="<%= cartItem.getItemId() %>" />
                                <button type="submit" class="btn remove-btn">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                        total += cartItem.getQuantity() * cartItem.getPrice(); 
                    } 
                    %>
                </tbody>
            </table>

            <% session.setAttribute("totalAmount", total); %>
            
            <div class="total-section">
                <h2>Total Amount</h2>
                <p class="price">₹<%= String.format("%.2f ", total) %></p>
            </div>

            <div class="action-buttons">
                <a href="showMenuPageByRestaurantId.jsp" class="btn  back ">&larr;  Back</a>
                <form action="ClearCartItems" style="display: inline;">
                    <button type="submit" class="btn clear-cart-btn">Clear Cart</button>
                </form>
                
                <a href="homePage.jsp" class="btn checkout-btn">Add More Items</a>
                <a href="checkOutPage.jsp" class="btn checkout-btn">Proceed to Checkout</a>
            </div>

        <% } else { %>
            <div class="empty-cart">
                <p>Your cart is empty. Please add some items to the cart.</p>
                <a href="homePage.jsp" class="continue-shopping-btn">Continue Shopping</a>
            </div>
        <% } %>
    </div>
</body>
</html>