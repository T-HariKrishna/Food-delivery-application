package com.hari.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.hari.daoimplementaion.CartItemDaoImplementation;
import com.hari.daoimplementaion.OrderHistoryDaoImplementation;
import com.hari.daoimplementaion.OrderItemDaoImplementation;
import com.hari.daoimplementaion.OrdersDaoImplementation;
import com.hari.model.CartItem;
import com.hari.model.Menu;
import com.hari.model.OrderHistory;
import com.hari.model.OrderItem;
import com.hari.model.Orders;
import com.hari.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrders")
public class PlaceOrders extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get the user from the session
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("signInPage.jsp");

		}

		int userId = user.getUserId();
//        System.out.println("userId " + userId);

		String paymentMode = request.getParameter("paymentMode");
		
		//b/c fields kept as required in jsp files
		if (paymentMode == null) {
			response.getWriter().write("<h1 style='color:red'>Add address to continue</h1>");
		}

		else {
			double totalAmount = (double) session.getAttribute("totalAmount");

			// Retrieve the cart from the session
			Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
			System.out.println("cart map " + cart);

			// Create a Set to store unique restaurant IDs
			Set<Integer> restaurantSet = new HashSet<>();

			// Check if the cart is not null and not empty
			if (cart != null && !cart.isEmpty()) {
				// Loop through each CartItem in the cart
				for (CartItem cartItem : cart.values()) {
					int restaurantId = cartItem.getRestaurantId();
					restaurantSet.add(restaurantId); // Set automatically handles duplicates
				}
			} else {
				System.out.println("Cart is empty or null.");
			}

			OrdersDaoImplementation ordersDaoImplementation = new OrdersDaoImplementation();
			for (Integer restaurantId : restaurantSet) {
				Orders orders = new Orders(userId, restaurantId, totalAmount, "success", paymentMode);
				ordersDaoImplementation.addOrder(orders);
			}
			System.out.println("In orders table data inserted succsessfully");

			Orders order = ordersDaoImplementation.getOrderId();

			session.setAttribute("order", order);
//            
//            ArrayList<Menu> menuList = (ArrayList<Menu>)session.getAttribute("menuList");
//            
//            System.out.println(menuList);
//            
//            
			//item is nothing but menu(item)when it is in restaurant but in cart it is item

			OrderItemDaoImplementation orderItemDaoImplementation = new OrderItemDaoImplementation();
			// Assuming cart is a Map of CartItem
			for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
				CartItem cartItem = entry.getValue();//gives current key value

				int orderId = order.getOrderId();
				// Retrieve the menu item details (assuming menuId is a field in CartItem)
				int menuId = cartItem.getItemId();
				int quantity = cartItem.getQuantity();
				double totalPrice = cartItem.getPrice() * quantity;

				System.err.println("menuId :" + menuId + " " + quantity + " -> " + totalPrice);
				// Create an OrderItem object
				OrderItem orderItem = new OrderItem(orderId, menuId, quantity, totalPrice);

				// Insert the order item into the database
				orderItemDaoImplementation.addOrderItem(orderItem);
			}

			OrderHistoryDaoImplementation orderHistoryDaoImplementation = new OrderHistoryDaoImplementation();
			OrderHistory orderHistory = new OrderHistory(order.getOrderId(), userId, order.getRestaurantId(),
					totalAmount, "success");

			int result = orderHistoryDaoImplementation.addOrderHistory(orderHistory);

			if (result == 1) {
				System.out.println("Order Success");
				CartItemDaoImplementation cartItemDaoImplementation = new CartItemDaoImplementation();
				cartItemDaoImplementation.clearAllItems();
				response.sendRedirect("orderSuccessPage.jsp");
			}

			else {
				response.sendRedirect("orderFailedPage.jsp");
			}

		}

	}
}
