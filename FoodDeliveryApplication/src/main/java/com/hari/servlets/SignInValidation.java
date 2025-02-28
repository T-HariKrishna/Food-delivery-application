package com.hari.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SignInValidation")

public class SignInValidation extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.err.println("\n\n"+password);
		
		PrintWriter out=response.getWriter();
		
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User userByUsername = userDaoImplementation.getUserByUsername(username);
		User userByEmail = userDaoImplementation.getUserByEmail(username);
		
		
		
		
		
		String userByusernamePassword=null;
		String userByEmailPassword=null;
		if (userByUsername!=null) {
			 userByusernamePassword = userByUsername.getPassword();
		}
		
		if(userByEmail!=null) {
			userByEmailPassword=userByEmail.getPassword();
		}
		
		Cookie cookie1 = new Cookie("username",username);
		Cookie cookie2 = new Cookie("password",password);
		
		
		System.out.println(userByUsername);
		
		
		
		if(userByUsername!=null || userByEmail!=null) { 
			if(password.equals(userByusernamePassword) ||password.equals(userByEmailPassword) ) {
				
				HttpSession session = request.getSession();
				if (userByUsername!=null) {
					session.setAttribute("user", userByUsername);
				} else {
					session.setAttribute("user", userByEmail);
				}
				
				cookie1.setMaxAge(60*60);//1 hour
				cookie2.setMaxAge(60*60);//1 hour

				response.addCookie(cookie1);
				response.addCookie(cookie2);
				
				
				response.sendRedirect("FetchAllRestaurants");
				}
				else {
					
					out.println("<h1 style='color: red';>Password Mismatch</h1>");
					
				}
		}
		
		else{
			response.sendRedirect("registerPage.html");
		}
	
	
	
	}

}
