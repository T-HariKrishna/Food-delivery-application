package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.model.Menu;

/**
 * Servlet implementation class UpdateMenu
 */
@WebServlet("/UpdateMenu")

public class UpdateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 @Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		   System.err.println(request.getParameter("restaurantId"));
		   System.err.println("menuId:"+request.getParameter("menuId"));
		   
		   int menuId = Integer.parseInt(request.getParameter("menuId"));
		   int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
		   
		   System.out.println(restaurantId);
		   
		   
		   String itemName = request.getParameter("name");
		   String description = request.getParameter("description");
		   double price = Double.parseDouble(request.getParameter("price"));
		   double rating = Double.parseDouble(request.getParameter("rating"));
		   int isAvailable = Integer.parseInt(request.getParameter("isAvailable"));
		   String imagePath = request.getParameter("imagePath");
		      
		   System.out.println(restaurantId+" "+itemName+" "+description+" "+price+" "+rating+" "+isAvailable+" "+imagePath);
		
		   MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
		   Menu menu = new Menu(menuId,restaurantId,itemName,description,price,rating,isAvailable,imagePath);
		   
		   menuDaoImplementation.updateMenu(menu);
		   
		   response.sendRedirect("AdminFetchMenuDetails");
	   }
	  

}
