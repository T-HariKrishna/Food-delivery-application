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
 * Servlet implementation class AdminSearchMenuItems
 */
public class AdminSearchMenuItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menuName = request.getParameter("search");
		
		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
		List<Menu> searchMenuItemsByName = menuDaoImplementation.searchMenuItemsByName(menuName);
		
		request.getSession().setAttribute("menuList", searchMenuItemsByName);

		response.sendRedirect("adminshowMenuPageByRestaurantId.jsp");
	}
}
