package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hari.daoimplementaion.RestaurantDaoImplementation;
import com.hari.model.Restaurant;

/**
 * Servlet implementation class UpdateRestaurant
 */

@WebServlet("/UpdateRestaurant")
public class UpdateRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
	   String restaurantName = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String format = String.format("%.2f", Double.parseDouble(request.getParameter("rating")));
		
		double rating=Double.parseDouble(format);
		int isActive = Integer.parseInt(request.getParameter("isActive"));
		String cuisineType = request.getParameter("cuisineType");
		int adminUserId = Integer.parseInt(request.getParameter("adminUserId"));
		String imagePath = request.getParameter("imagePath");
		
		System.out.println(restaurantName+" "+phone+" "+address+" "+rating+" "+isActive+" "+cuisineType+" "+adminUserId+" "+imagePath);
		
		RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
		Restaurant restaurant = new Restaurant(restaurantId,restaurantName,phone,address,rating,cuisineType,isActive,adminUserId,imagePath);
		restaurantDaoImplementation.updateRestaurant(restaurant);
		
		response.sendRedirect("AdminFetchAllRestaurants");
	
	}

}
