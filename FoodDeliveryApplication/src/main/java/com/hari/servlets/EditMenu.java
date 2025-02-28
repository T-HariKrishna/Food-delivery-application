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
 * Servlet implementation class EditMenu
 */

@WebServlet("/EditMenu")
public class EditMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @Override
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		int menuId = Integer.parseInt(request.getParameter("menuId"));
    		String restaurantName = request.getParameter("restaurantName");
    		request.getSession().setAttribute("restaurantName", restaurantName);
    		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
    		Menu menuDetails = menuDaoImplementation.getMenu(menuId);
    		
    		request.getSession().setAttribute("menuDetails", menuDetails);
    		
    		response.sendRedirect("editMenuForm.jsp");
    		
    		
    		
    	} 
   
}
