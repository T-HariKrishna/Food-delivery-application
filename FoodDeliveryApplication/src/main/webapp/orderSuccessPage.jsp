<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navigationBar.jsp" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.hari.model.Orders" %>
<!DOCTYPE html>

<html >
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Success</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
        color: #333;
      }
      .container {
        max-width: 800px;
        margin: 80px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      .header {
        text-align: center;
        margin-bottom: 20px;
      }
      .header h1 {
      ma
        font-size: 36px;
        color: #28a745;
      }
      .header p {
        font-size: 16px;
        color: #555;
      }
      .order-details {
        margin-top: 20px;
        font-size: 18px;
        line-height: 1.6;
      }
      .order-details table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      .order-details table,
      th,
      td {
        border: 1px solid #ddd;
      }
      th,
      td {
        padding: 12px;
        text-align: left;
      }
      th {
        background-color: #f8f9fa;
      }
      .total {
        font-size: 22px;
        font-weight: bold;
        margin-top: 20px;
        color: #333;
      }
      .buttons {
        text-align: center;
        margin-top: 30px;
      }
      .buttons a {
        text-decoration: none;
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
      }
      .buttons a:hover {
        background-color: #218838;
      }
      .footer {
        text-align: center;
        margin-top: 50px;
        font-size: 14px;
        color: #888;
      }
      
    </style>
  </head>
  <body>
  
  
  <% Orders order=(Orders)session.getAttribute("order");
  String restaurantName = (String) session.getAttribute("restaurantName");%>
    <div class="container">
      <div class="header">
        <h1>Order Placed Successfully!</h1>
        <p>
          Your order has been successfully placed and is now being processed.
        </p>
      </div>

      <div class="order-details">
        <h3>Order Details:</h3>
        <table>
          <tr>
            <th>Order ID</th>
            <td><%=order.getOrderId() %></td>
          </tr>
          <tr>
            <th>User ID</th>
            <td><%=order.getUserId() %></td>
          </tr>
          <tr>
            <th>Restaurant</th>
            <td><%= restaurantName %></td>
          </tr>
          <tr>
            <th>Payment Mode</th>
            <td><%= order.getPaymentMode()%></td>
          </tr>
          <tr>
            <th>Total Amount</th>
            <td><%= order.getTotalAmount() %></td>
          </tr>
        </table>
      </div>

      <div class="total">Total:<%= order.getTotalAmount() %></div>

      <div class="buttons">
        <a href="homePage.jsp">Continue Shopping</a>
        <a href="OrderHistoryDetails?userId=<%=order.getUserId() %>">View Order History</a>
      </div>
    </div>
  </body>
</html>
