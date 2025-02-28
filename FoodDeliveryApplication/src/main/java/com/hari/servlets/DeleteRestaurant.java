package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hari.daoimplementaion.RestaurantDaoImplementation;

/**
 * Servlet implementation class DeleteRestaurant
 */

@WebServlet("/DeleteRestaurant")
public class DeleteRestaurant extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("restaurantId")!=null) {
			
			int  restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
			System.err.println(restaurantId);
			RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
	        int rowEffected = restaurantDaoImplementation.deleteRestaurant(restaurantId);
	        System.out.println(rowEffected);
	        
	        response.sendRedirect("AdminFetchAllRestaurants");
			
		}
		
		
		
		
	}

}
