package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


import com.hari.daoimplementaion.MenuDaoImplementation;

/**
 * Servlet implementation class DeleteMenu
 */

@WebServlet("/DeleteMenu")
public class DeleteMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @Override
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		int menuId=Integer.parseInt(request.getParameter("menuId"));
    		
    		
    		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
    		
    		menuDaoImplementation.deleteMenu(menuId);
    		
    		response.sendRedirect("AdminFetchMenuDetails");
    	}

}
