<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="navigationBar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hari.model.OrderItem"%>
<%@ page import="com.hari.model.Menu"%>
<%@ page import="com.hari.daoimplementaion.MenuDaoImplementation"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Order Item Details</title>
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

.item-cards {
	display: grid;
	grid-template-columns: repeat(1, 1fr);
	gap: 20px;
}

@media (min-width: 768px) {
	.item-cards {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media (min-width: 1024px) {
	.item-cards {
		grid-template-columns: repeat(3, 1fr);
	}
}

.item-card {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: box-shadow 0.3s ease;
}

.item-card:hover {
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

.item-id {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	display: flex;
	align-items: center;
}

.item-id svg {
	margin-right: 8px;
	color: #28a745;
}

.order-id {
	font-size: 14px;
	color: #666;
	margin-top: 5px;
	display: flex;
	align-items: center;
}

.order-id svg {
	margin-right: 5px;
	color: #777;
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

.item-name {
	font-size: 16px;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
}

.quantity {
	font-size: 14px;
	color: #666;
	display: flex;
	align-items: center;
}

.quantity svg {
	margin-right: 5px;
	color: #777;
}

.price {
	font-size: 16px;
	font-weight: bold;
	color: #28a745;
	display: flex;
	align-items: center;
}

.price svg {
	margin-right: 5px;
	color: #28a745;
}

.no-items {
	text-align: center;
	background-color: #fff;
	padding: 60px 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.no-items svg {
	width: 48px;
	height: 48px;
	color: #aaa;
	margin-bottom: 15px;
}

.no-items h3 {
	font-size: 24px;
	color: #333;
	margin-bottom: 10px;
}

.no-items p {
	font-size: 16px;
	color: #666;
	margin-bottom: 20px;
}

.back-button {
	display: inline-flex;
	align-items: center;
	background-color: #6c757d;
	color: white;
	padding: 8px 16px;
	border-radius: 4px;
	text-decoration: none;
	font-weight: bold;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.back-button:hover {
	background-color: #5a6268;
}

.back-button svg {
	margin-right: 5px;
}

.buttons {
	text-align: center;
	margin-top: 40px;
}

.home-button {
	display: inline-block;
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s;
}

.home-button:hover {
	background-color: #218838;
}
</style>
</head>
<body>
	<!-- SVG Icons for use in the page -->
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
		<symbol id="icon-food" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<path
				d="M18 8h1a4 4 0 0 1 0 8h-1"></path>
			<path
				d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"></path>
			<line x1="6" y1="1" x2="6" y2="4"></line>
			<line x1="10" y1="1" x2="10" y2="4"></line>
			<line x1="14" y1="1" x2="14" y2="4"></line>
		</symbol>
		<symbol id="icon-bag" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<path
				d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
			<line x1="3" y1="6" x2="21" y2="6"></line>
			<path d="M16 10a4 4 0 0 1-8 0"></path>
		</symbol>
		<symbol id="icon-hash" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<line x1="4" y1="9" x2="20" y2="9"></line>
			<line x1="4" y1="15" x2="20" y2="15"></line>
			<line x1="10" y1="3" x2="8" y2="21"></line>
			<line x1="16" y1="3" x2="14" y2="21"></line>
		</symbol>
		<symbol id="icon-dollar" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<line x1="12" y1="1" x2="12" y2="23"></line>
			<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
		</symbol>
		<symbol id="icon-arrow-left" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<line x1="19" y1="12" x2="5" y2="12"></line>
			<polyline points="12 19 5 12 12 5"></polyline>
		</symbol>
		<symbol id="icon-home" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" stroke-linecap="round"
			stroke-linejoin="round">
			<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
			<polyline points="9 22 9 12 15 12 15 22"></polyline>
		</symbol>
	</svg>

	<%
	List<OrderItem> orderItemList = (List<OrderItem>) session.getAttribute("orderItemDetails");
	%>

	<div class="container">
		<div class="header">
			<h1>Order Item Details</h1>
			<p>Here are the details of the items in the order.</p>
		</div>

		<% if (orderItemList != null && !orderItemList.isEmpty()) { %>
		<div class="item-cards">
			<% 
			for (OrderItem orderItem : orderItemList) {
				MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
				Menu menu = menuDaoImplementation.getMenu(orderItem.getMenuId());
			%>
			<div class="item-card">
				<div class="card-body">
					<div class="card-header">
						<div>
							<div class="item-id">
								<svg width="20" height="20">
									<use xlink:href="#icon-food"></use>
								</svg>
								Item #<%= orderItem.getOrderItemId() %>
							</div>
							<div class="order-id">
								<svg width="16" height="16">
									<use xlink:href="#icon-bag"></use>
								</svg>
								Order #<%= orderItem.getOrderId() %>
							</div>
						</div>
					</div>

					<div class="card-details">
						<div class="item-name">
							<%= menu.getItemName() %>
						</div>
						<div class="detail-row">
							<div class="quantity">
								<svg width="16" height="16">
									<use xlink:href="#icon-hash"></use>
								</svg>
								Quantity: <%= orderItem.getQuantity() %>
							</div>
							<div class="price">
								<svg width="16" height="16">
									
								</svg>
								 ₹<%= String.format("%.2f", orderItem.getTotalPrice()) %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<% } %>
		</div>
		<% } else { %>
		<div class="no-items">
			<svg width="48" height="48">
				<use xlink:href="#icon-bag"></use>
			</svg>
			<h3>No order items found</h3>
			<p>There are no items to display for this order.</p>
		</div>
		<% } %>

		<a href="showOrderHistoryDetails.jsp" class="back-button">
			<svg width="16" height="16">
				<use xlink:href="#icon-arrow-left"></use>
			</svg>
			
		</a>

		<div class="buttons">
			<a href="homePage.jsp" class="home-button">
				<svg width="16" height="16" style="margin-right: 5px; vertical-align: text-bottom;">
					<use xlink:href="#icon-home"></use>
				</svg>
				Back to Home
			</a>
		</div>
	</div>
</body>
</html>