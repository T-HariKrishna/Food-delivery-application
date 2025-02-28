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
import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.model.CartItem;
import com.hari.model.Menu;

/**
 * Servlet implementation class UpdateCart
 */

@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve menuId and quantity from request
	    int menuId = Integer.parseInt(request.getParameter("menuId"));
	    int quantity = Integer.parseInt(request.getParameter("quantity"));

	    // Get the cart from the session
	    HttpSession session = request.getSession();
	    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

	    System.out.println("\ncart from update cart servlet"+cart);
	    
	    // Ensure the cart is initialized
	    if (cart == null) {
	        cart = new HashMap<>();
	    }

	    // Log current cart state for debugging
	    System.out.println("menuId & quantity "+menuId+" "+quantity);
	    System.out.println("Current cart: " + cart);

	    // Update the item in the cart
	    CartItemDaoImplementation cartItemDaoImplementation = new CartItemDaoImplementation();
	    cart = cartItemDaoImplementation.updateItem(menuId, quantity);

	    // Log updated cart for debugging
	    System.out.println("Updated cart: " + cart);

	    // Save the updated cart back to the session
	    session.setAttribute("cart", cart);

	    // Redirect back to the cart page
	    response.sendRedirect("cart.jsp");
	}


}
