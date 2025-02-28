<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="navigationBar.jsp" %> 
    
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    <%@ page import="com.hari.model.OrderHistory" %>
    <%@ page import="com.hari.model.Orders" %>
    <%@ page import="com.hari.model.Restaurant" %>
    <%@ page import="com.hari.daoimplementaion.OrdersDaoImplementation" %>
    <%@ page import="com.hari.daoimplementaion.RestaurantDaoImplementation" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order History</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
        color: #333;
      }
      .container {
        max-width: 900px;
        margin:100px auto ;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      .header {
        text-align: center;
        margin-bottom: 20px;
      }
      .noOrders{
      margin-top:100px;
      text-align: center;
        margin-bottom: 20px;
      }
      .noOrders h1{
     font-size: 36px;
        color: #28a745;
      }
      .noOrders p{
      margin:20px 0px;
     font-size: 19px;
        color: #28a745;
      }
      
      .header h1 {
       margin-top:70px;
        font-size: 36px;
        color: #28a745;
      }
      .header p {
        font-size: 16px;
        color: #555;
      }
      .order-history {
        margin-top: 20px;
      }
      .order-history table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      .order-history table,
      th,
      td {
        border: 1px solid #ddd;
      }
      th,
      td {
        padding: 12px;
        text-align: center;
      }
      th {
        background-color: #f8f9fa;
      }
      .total {
        font-size: 18px;
        font-weight: bold;
        color: #333;
      }
      .status {
        font-weight: bold;
      }
      .buttons {
        text-align: center;
        margin-top: 30px;
      }
     
      a{
      	 text-decoration: none;
      }
      .buttons a {
        text-decoration: none;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
      }
      
      .buttons a:hover {
        background-color: #0056b3;
      }
      .footer {
        text-align: center;
        margin-top: 50px;
        font-size: 14px;
        color: #888;
      }

      /* Responsive styles for mobile */
      @media (max-width: 768px) {
        .container {
          padding: 15px;
          margin: 20px;
        }
        .header h1 {
          font-size: 28px;
        }
        .order-history table {
          font-size: 14px;
        }
        th,
        td {
          padding: 8px;
        }
        .buttons a {
          padding: 8px 15px;
          font-size: 14px;
        }
      }

      /* Smaller screens (max-width: 480px) */
      @media (max-width: 480px) {
        .header h1 {
          font-size: 24px;
        }
        .header p {
          font-size: 14px;
        }
        .order-history table {
          font-size: 12px;
        }
        th,
        td {
          padding: 6px;
        }
        .buttons a {
          padding: 6px 12px;
          font-size: 12px;
        }
        .footer p {
          font-size: 12px;
        }
      }
    </style>
  </head>
  <body>
  
  
  <%List<OrderHistory> orderHistoryList = (ArrayList<OrderHistory>)session.getAttribute("orderHistoryDetails");
  RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
  String restaurantName = null; if(orderHistoryList!=null && !orderHistoryList.isEmpty()) {%>
   <div class="container">
      <div class="header">
        <h1>Your Order History</h1>
        <p>Here are the details of your past orders.</p>
      </div>

      <div class="order-history">
        <h3>Order History:</h3>
        <table>
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Restaurant Name</th>
              <th>Total</th>
              <th>Date & Time</th>              
              <th>Status</th>
              <th>View Details</th>
            </tr>
          </thead>
          <tbody>
          
            <% for(OrderHistory orderHistory : orderHistoryList){ %>
              <tr>
                <td><%= orderHistory.getOrderid()%></td>
                <%restaurantName = restaurantDaoImplementation.getRestaurantName(orderHistory.getRestaurantId()); %>
                <td><%=restaurantName %></td>
                <td><%= orderHistory.getTotal()%></td>
                <% OrdersDaoImplementation ordersDaoImplementation = new OrdersDaoImplementation();
    	        List<Orders> orderbyRestaurantId = ordersDaoImplementation.getAllOrdersbyOrderId(orderHistory.getOrderid());
    	         
    	          for (Orders orders : orderbyRestaurantId) {%>
                
                <td class="date"><%=orders.getOrderDateTime().toString().replace('T', ' ')%></td>
					<% }%>
                <td class="status"><%= orderHistory.getStatus() %></td>
                <td>
                  <a
                    href="FetchOrderDetails?orderId=<%= orderHistory.getOrderid() %>"
                    class="view-details"
                    >View Details</a
                  >
                </td>
          <% } %>  
              </tr>
          </tbody>
          
        </table>
      </div>
      <% } else{%>
      <div class="noOrders">
        <h1>Your Order History</h1>
        <p style="color:red">No orders to show.Please shop now</p>
      </div>
      <%} %>
      
      
   

      <div class="buttons">
        <a href="homePage.jsp">Continue Shopping</a>
      </div>
    </div>

   
  </body>
</html>
