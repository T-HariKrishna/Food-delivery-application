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
      max-width: 1200px;
      margin: 100px auto;
      padding: 20px;
    }
    
    .header {
      text-align: center;
      margin-bottom: 40px;
    }
    
    .header h1 {
      font-size: 36px;
      color: #28a745;
      margin-bottom: 10px;
    }
    
    .header p {
      font-size: 16px;
      color: #555;
    }
    
    .order-cards {
      display: grid;
      grid-template-columns: repeat(1, 1fr);
      gap: 20px;
    }
    
    @media (min-width: 768px) {
      .order-cards {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    
    @media (min-width: 1024px) {
      .order-cards {
        grid-template-columns: repeat(3, 1fr);
      }
    }
    
    .order-card {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      transition: box-shadow 0.3s ease;
    }
    
    .order-card:hover {
      box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
    }
    
    .card-body {
      padding: 20px;
    }
    
    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 15px;
    }
    
    .order-id {
      font-size: 18px;
      font-weight: bold;
      color: #333;
      display: flex;
      align-items: center;
    }
    
    .order-id svg {
      margin-right: 8px;
      color: #28a745;
    }
    
    .restaurant-name {
      font-size: 14px;
      color: #666;
      margin-top: 5px;
      display: flex;
      align-items: center;
    }
    
    .restaurant-name svg {
      margin-right: 5px;
      color: #777;
    }
    
    .status-badge {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: bold;
    }
    
    .status-delivered {
      background-color: #d4edda;
      color: #155724;
    }
    
    .status-processing {
      background-color: #cce5ff;
      color: #004085;
    }
    
    .status-cancelled {
      background-color: #f8d7da;
      color: #721c24;
    }
    
    .status-pending {
      background-color: #fff3cd;
      color: #856404;
    }
    
    .card-details {
      border-top: 1px solid #eee;
      padding-top: 15px;
    }
    
    .detail-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }
    
    .date-time {
      font-size: 14px;
      color: #666;
      display: flex;
      align-items: center;
    }
    
    .date-time svg {
      margin-right: 5px;
      color: #777;
    }
    
    .total-price {
      font-size: 14px;
      font-weight: bold;
      color: #333;
      display: flex;
      align-items: center;
    }
    
    .total-price svg {
      margin-right: 5px;
      color: #28a745;
    }
    
    .card-footer {
      background-color: #f8f9fa;
      padding: 12px 20px;
      border-top: 1px solid #eee;
    }
    
    .view-details-link {
      display: flex;
      justify-content: space-between;
      align-items: center;
      text-decoration: none;
      color: #28a745;
      font-size: 14px;
      font-weight: bold;
    }
    
    .view-details-link:hover {
      color: #218838;
    }
    
    .view-details-text {
      display: flex;
      align-items: center;
    }
    
    .view-details-text svg {
      margin-right: 5px;
    }
    
    .no-orders {
      text-align: center;
      background-color: #fff;
      padding: 60px 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .no-orders svg {
      width: 48px;
      height: 48px;
      color: #aaa;
      margin-bottom: 15px;
    }
    
    .no-orders h3 {
      font-size: 24px;
      color: #333;
      margin-bottom: 10px;
    }
    
    .no-orders p {
      font-size: 16px;
      color: #666;
      margin-bottom: 20px;
    }
    
    .continue-shopping {
      display: inline-block;
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      text-decoration: none;
      font-weight: bold;
      transition: background-color 0.3s;
    }
    
    .continue-shopping:hover {
      background-color: #218838;
    }
    
    .buttons {
      text-align: center;
      margin-top: 40px;
    }
    
    .footer {
      text-align: center;
      margin-top: 60px;
      padding-top: 20px;
      border-top: 1px solid #eee;
      color: #888;
    }
  </style>
</head>
<body>
  <!-- SVG Icons for use in the page -->
  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="icon-bag" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
      <line x1="3" y1="6" x2="21" y2="6"></line>
      <path d="M16 10a4 4 0 0 1-8 0"></path>
    </symbol>
    <symbol id="icon-store" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
      <polyline points="9 22 9 12 15 12 15 22"></polyline>
    </symbol>
    <symbol id="icon-calendar" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
      <line x1="16" y1="2" x2="16" y2="6"></line>
      <line x1="8" y1="2" x2="8" y2="6"></line>
      <line x1="3" y1="10" x2="21" y2="10"></line>
    </symbol>
    <symbol id="icon-dollar" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <line x1="12" y1="1" x2="12" y2="23"></line>
      <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
    </symbol>
    <symbol id="icon-eye" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
      <circle cx="12" cy="12" r="3"></circle>
    </symbol>
    <symbol id="icon-chevron-right" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <polyline points="9 18 15 12 9 6"></polyline>
    </symbol>
  </svg>

  <% List<OrderHistory> orderHistoryList = (ArrayList<OrderHistory>)session.getAttribute("orderHistoryDetails");
  RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
  String restaurantName = null; %>
  
  <div class="container">
    <div class="header">
      <h1>Your Order History</h1>
      <p>Here are the details of your past orders.</p>
    </div>

    <% if(orderHistoryList != null && !orderHistoryList.isEmpty()) { %>
      <div class="order-cards">
        <% for(OrderHistory orderHistory : orderHistoryList) { 
          restaurantName = restaurantDaoImplementation.getRestaurantName(orderHistory.getRestaurantId());
          OrdersDaoImplementation ordersDaoImplementation = new OrdersDaoImplementation();
          List<Orders> orderbyRestaurantId = ordersDaoImplementation.getAllOrdersbyOrderId(orderHistory.getOrderid());
          String orderDateTime = "";
          for (Orders orders : orderbyRestaurantId) {
            orderDateTime = orders.getOrderDateTime().toString().replace('T', ' ');
          }
          
          String statusClass = "";
          if(orderHistory.getStatus().equalsIgnoreCase("Delivered")) {
            statusClass = "status-delivered";
          } else if(orderHistory.getStatus().equalsIgnoreCase("Processing")) {
            statusClass = "status-processing";
          } else if(orderHistory.getStatus().equalsIgnoreCase("Cancelled")) {
            statusClass = "status-cancelled";
          } else {
            statusClass = "status-pending";
          }
        %>
          <div class="order-card">
            <div class="card-body">
              <div class="card-header">
                <div>
                  <div class="order-id">
                    <svg width="20" height="20"><use xlink:href="#icon-bag"></use></svg>
                    Order #<%= orderHistory.getOrderid() %>
                  </div>
                  <div class="restaurant-name">
                    <svg width="16" height="16"><use xlink:href="#icon-store"></use></svg>
                    <%= restaurantName %>
                  </div>
                </div>
                <span class="status-badge <%= statusClass %>">
                  <%= orderHistory.getStatus() %>
                </span>
              </div>
              
              <div class="card-details">
                <div class="detail-row">
                  <div class="date-time">
                    <svg width="16" height="16"><use xlink:href="#icon-calendar"></use></svg>
                    <%= orderDateTime %>
                  </div>
                  <div class="total-price">
                    <svg width="16" height="16"><use xlink:href="#icon-rupee"></use>
</svg>
                     ₹<%= String.format("%.2f", orderHistory.getTotal()) %>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="card-footer">
              <a href="FetchOrderDetails?orderId=<%= orderHistory.getOrderid() %>" class="view-details-link">
                <span class="view-details-text">
                  <svg width="16" height="16"><use xlink:href="#icon-eye"></use></svg>
                  View Order Details
                </span>
                <svg width="16" height="16"><use xlink:href="#icon-chevron-right"></use></svg>
              </a>
            </div>
          </div>
        <% } %>
      </div>
    <% } else { %>
      <div class="no-orders">
        <svg width="48" height="48"><use xlink:href="#icon-bag"></use></svg>
        <h3>No orders to show</h3>
        <p style="color: red;">Start shopping to see your orders here.</p>
        <a href="homePage.jsp" class="continue-shopping">Continue Shopping</a>
      </div>
    <% } %>
    
    <% if(orderHistoryList != null && !orderHistoryList.isEmpty()) { %>
      <div class="buttons">
        <a href="homePage.jsp" class="continue-shopping">Continue Shopping</a>
      </div>
    <% } %>
  </div>
</body>
</html>