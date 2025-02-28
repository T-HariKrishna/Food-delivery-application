package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.hari.daoimplementaion.CartItemDaoImplementation;
import com.hari.model.CartItem;

/**
 * Servlet implementation class ClearCartItem
 */

@WebServlet("/ClearCartItems")
public class ClearCartItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

		    System.out.println("\ncart from update cart servlet"+cart);
		    
		    // Ensure the cart is initialized
		    if (cart != null) {
		    	CartItemDaoImplementation cartItemDaoImplementation = new CartItemDaoImplementation();
		    	cartItemDaoImplementation.clearAllItems();
		    	response.sendRedirect("cart.jsp");
		    }
//		    else {
//		    	response.sendRedirect("cart.jsp");
//		    }
		
		
	}
}
