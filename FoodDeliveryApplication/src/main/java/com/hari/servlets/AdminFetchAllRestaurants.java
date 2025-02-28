package com.hari.servlets;

import java.io.IOException;
import java.util.List;

import com.hari.daoimplementaion.RestaurantDaoImplementation;
import com.hari.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminFetchAllRestaurants")
public class AdminFetchAllRestaurants extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
		List<Restaurant> allRestaurants = restaurantDaoImplementation.getAllRestaurants();
		HttpSession session = request.getSession();
		session.setAttribute("restaurantList", allRestaurants);
		response.sendRedirect("adminHomePage.jsp");
	}
}

