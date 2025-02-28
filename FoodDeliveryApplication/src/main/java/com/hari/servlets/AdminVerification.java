package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;

/**
 * Servlet implementation class AdminVerification
 */
@WebServlet("/AdminVerification")
public class AdminVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		PrintWriter out=response.getWriter();
		
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User user = userDaoImplementation.getUserByUsername(username);
		
		
//		Cookie cookie1 = new Cookie("username",username);
//		Cookie cookie2 = new Cookie("password",password);
		
		
		System.out.println(user);
		
		
		if(user!=null) { 
			if(user.getRole()!=null && user.getRole().equalsIgnoreCase("admin")) {
				if(password.equals(user.getPassword())) {
					
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					
					response.sendRedirect("AdminFetchAllRestaurants");
					}
					else {
						
						out.println("<h1 style='color: red';>Password Mismatch</h1>");
						
					}
			}
			else {
				out.println("<h1 style='color: red';>Your not a admin</h1>");
				
			}
		}else{
			out.println("<h1 style=\"color: red\";>No data is registered with this username</h1>");
			
		}
	}
    
}
