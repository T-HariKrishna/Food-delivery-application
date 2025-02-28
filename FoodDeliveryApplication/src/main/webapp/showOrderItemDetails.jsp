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
	max-width: 900px;
	margin: 50px auto;
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
	font-size: 36px;
	color: #28a745;
}

.header p {
	font-size: 16px;
	color: #555;
}

.order-item-details {
	margin-top: 20px;
}

.order-item-details table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.order-item-details table, th, td {
	border: 1px solid #ddd;
}

th, td {
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

#back {
	display: inline-block;
	padding: 8px 16px;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	font-size: 14px;
	color: white;
	background-color: #6c757d;
	text-decoration: none;
	margin-top: 20px; /* Adds spacing to the top of the back arrow button */
}

#back:hover {
	background-color: #5a6268;
}

.buttons {
	display: flex;
	justify-content: center;
	gap: 20px; /* Adds spacing between buttons */
	margin-top: 30px;
}

.buttons a {
	text-decoration: none;
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	text-align: center;
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

</style>
</head>
<body>

	<%
	List<OrderItem> orderItemList = (List<OrderItem>) session.getAttribute("orderItemDetails");

	if (orderItemList == null || orderItemList.isEmpty()) {
	%>
	<p>No order items found.</p>
	<%
	} else {
	%>
	<div class="container">
		<div class="header">
			<h1>Order Item Details</h1>
			<p>Here are the details of the items in the order.</p>
		</div>

		<div class="order-item-details">
			<h3>Order Items:</h3>
			<table>
				<thead>
					<tr>
						<th>Order Item ID</th>
						<th>Order ID</th>
						<th>Item Name</th>
						<th>Quantity</th>
						<th>Total Price</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (OrderItem orderItem : orderItemList) {
					%>
					<tr>
						<td><%=orderItem.getOrderItemId()%></td>
						<td><%=orderItem.getOrderId()%></td>

						<%
						MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
						Menu menu = menuDaoImplementation.getMenu(orderItem.getMenuId());
						%>
						<td><%=menu.getItemName()%></td>
						<td><%=orderItem.getQuantity()%></td>
						<td><%=orderItem.getTotalPrice()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<a href="showOrderHistoryDetails.jsp" id="back">&larr; </a> 

		<div class="buttons">
			<a href="homePage.jsp">Back to Home</a>
		</div>

	</div>
	<%
	}
	%>

</body>
</html>
