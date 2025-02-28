package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.model.Menu;

/**
 * Servlet implementation class AdminFetchMenuDetails
 */

@WebServlet("/AdminFetchMenuDetails")
public class AdminFetchMenuDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  
  System.err.println(request.getParameter("restaurantId"));
	  
	  System.out.println(request.getSession().getAttribute("restaurantId"));
	  int restaurantId=0;
	  if(request.getParameter("restaurantId")!=null) {
		  
		 restaurantId=Integer.parseInt(request.getParameter("restaurantId"));
	  }
	  else {
		  restaurantId=(int)request.getSession().getAttribute("restaurantId");
		  
		  System.out.println("\n\n"+restaurantId);
	  }
		String restaurantName=request.getParameter("restaurantName");
		System.out.println(restaurantId);
		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
		
		List<Menu> menuListByRestaurantId = menuDaoImplementation.getAllMenuByRestaurantId(restaurantId);
		
		//Add menu items into the session to make  web functionality easy
		request.getSession().setAttribute("menuList", menuListByRestaurantId);
		
		request.getSession().setAttribute("restaurantName", restaurantName);
		
		//helpful in add menu page
		request.getSession().setAttribute("restaurantId", restaurantId);
		
		
		
		
		
		for (Menu menu : menuListByRestaurantId){
			System.out.println(menu);
		}
		response.sendRedirect("adminshowMenuPageByRestaurantId.jsp");
	  
	
}

}
