package com.hari.servlets;

import java.io.IOException;
import java.util.List;

import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/FetchMenuDetails")
public class FetchMenuDetails extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
		String restaurantName=request.getParameter("restaurantName");
		System.out.println(restaurantId);
		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
		
		List<Menu> menuListByRestaurantId = menuDaoImplementation.getAllMenuByRestaurantId(restaurantId);
		
		//Add menu items into the session to make  web functionality easy
		request.getSession().setAttribute("menuList", menuListByRestaurantId);
		
		request.getSession().setAttribute("restaurantName", restaurantName);
		
		
		for (Menu menu : menuListByRestaurantId){
			System.out.println(menu);
		}
		response.sendRedirect("showMenuPageByRestaurantId.jsp");
	}	
}
