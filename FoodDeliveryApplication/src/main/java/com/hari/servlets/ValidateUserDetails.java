package com.hari.servlets;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;



@WebServlet("/ValidateUserDetails")
public class ValidateUserDetails extends HttpServlet {

    
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
//		String name=request.getParameter("name");
//		String age=request.getParameter("age");
//		String email=request.getParameter("email");
		
		String password=request.getParameter("password");
		String confirmPassword=request.getParameter("confirmPassword");
		
		
		
		if(password.equals(confirmPassword)) {
			
			
//			out.print(" validate servlet is included");
//			out.println(password);

			out.println(confirmPassword);
			
			System.out.println("Password matched");

			
		
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserServlet");
//			requestDispatcher.include(request, response);
			requestDispatcher.forward(request, response);
			
			
			
//			response.sendRedirect("success.html"); if two statements present inside the file Cannot call sendRedirect() after the response has been committed

			
			

		}
		else {
			
			System.out.println("Password unmatched");
//			out.print(" validate servlet is included");
//			out.println(password);
//
//			out.println(confirmPassword);
		}
		
		
		
	}


}

