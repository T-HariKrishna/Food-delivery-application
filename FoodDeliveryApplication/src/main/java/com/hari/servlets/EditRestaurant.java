package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hari.daoimplementaion.RestaurantDaoImplementation;
import com.hari.model.Restaurant;

/**
 * Servlet implementation class EditRestaurant
 */
@WebServlet("/EditRestaurant")
public class EditRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		System.out.println(restaurantId);
		
		HttpSession session = request.getSession();
		
		
		RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
		Restaurant restaurantDetails = restaurantDaoImplementation.getRestaurantById(restaurantId);
		
		System.out.println(restaurantDetails);
		session.setAttribute("restaurantDetails", restaurantDetails);
		
		response.sendRedirect("editRestaurantForm.jsp");
			
		
		
	}

}
