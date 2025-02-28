package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hari.daoimplementaion.RestaurantDaoImplementation;
import com.hari.model.Restaurant;

/**
 * Servlet implementation class Search
 */

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @Override
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   String restaurnatName=request.getParameter("search").trim();
    	   
    	   System.out.println(restaurnatName);
   	   RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
   		List<Restaurant> restaurantDetails = restaurantDaoImplementation.searchRestaurantByName(restaurnatName);
   		System.out.println(restaurantDetails);
   		
   		request.getSession().setAttribute("restaurantList", restaurantDetails);
   		response.sendRedirect("homePage.jsp");
   		
       
       }
   

}
