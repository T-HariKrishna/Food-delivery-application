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
 * Servlet implementation class AddRestauarnt
 */
@WebServlet("/AddRestaurant")
public class AddRestauarnt extends HttpServlet {
	private static final long serialVersionUID = 1L;
   @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   String restaurantName = request.getParameter("name");
		String phone = request.getParameter("phone");
		System.out.println("phone "+phone);
		String address = request.getParameter("address");
		System.out.println("address "+address);
		String format = String.format("%.2f", Double.parseDouble(request.getParameter("rating")));
		
		double rating=Double.parseDouble(format);
		int isActive = Integer.parseInt(request.getParameter("isActive"));
		String cuisineType = request.getParameter("cuisineType");
		int adminUserId = Integer.parseInt(request.getParameter("adminUserId"));
		String imagePath = request.getParameter("imagePath");
		
		System.out.println(restaurantName+" "+phone+" "+address+" "+rating+" "+isActive+" "+cuisineType+" "+adminUserId+" "+imagePath);
		
		RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
		Restaurant restaurant = new Restaurant(restaurantName,phone,address,rating,cuisineType,isActive,adminUserId,imagePath);
		restaurantDaoImplementation.addRestaurant(restaurant);
		
		response.sendRedirect("AdminFetchAllRestaurants");
	}
}
