package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

import com.hari.daoimplementaion.CartItemDaoImplementation;
import com.hari.model.CartItem;


@WebServlet("/RemoveCartItem")
public class RemoveCartItem extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession();
		  
		  
		  System.out.println("Items from remove cart "+session.getAttribute("cart"));
		  
		  int menuId=Integer.parseInt(request.getParameter("menuId"));
		  System.out.println("menu ID: "+menuId);
		  
		  CartItemDaoImplementation cartItemDaoImplementation = new CartItemDaoImplementation();
		  Map<Integer, CartItem> removeItem = cartItemDaoImplementation.removeItem(menuId);
		  
		  
		  
		  session.setAttribute("cart", removeItem);
		  
		  System.out.println(removeItem);
		  
		  System.out.println("After removing the cart item : "+session.getAttribute("cart"));
		  
		  response.sendRedirect("cart.jsp");
		  
		
		  
	}

}
