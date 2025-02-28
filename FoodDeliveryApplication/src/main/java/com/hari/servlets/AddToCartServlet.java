package com.hari.servlets;

import java.io.IOException;
import java.util.Map;

import com.hari.daoimplementaion.CartItemDaoImplementation;
import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.model.CartItem;
import com.hari.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	
	
 		@Override
 		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 			
 			
 			
 			HttpSession session = request.getSession();
 			
 			int menuId =(Integer.parseInt(request.getParameter("menuId")));
 			int quantity =(Integer.parseInt(request.getParameter("quantity")));
 			
 			MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
 			Menu menu = menuDaoImplementation.getMenu(menuId);
 			
 			CartItem cartItem = new CartItem(menuId, menu.getRestaurantId(), menu.getItemName(), quantity, menu.getPrice());
 			
 			
 			CartItemDaoImplementation cartItemDaoImplementation = new CartItemDaoImplementation();
 			Map<Integer, CartItem> item = cartItemDaoImplementation.addItem(cartItem);
 			
 			System.out.println(item);
 			
 			session.setAttribute("cart", item);
 			
 			System.out.println("from session"+session.getAttribute("cart"));
 			
 			response.sendRedirect("showMenuPageByRestaurantId.jsp");
 			
 			
 			
 			
 			
 		}    
}


