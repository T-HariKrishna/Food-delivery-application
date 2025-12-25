package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;

/**
 * Servlet implementation class ForgotPasswordUsernameVerification
 */
@WebServlet("/ForgotPasswordUsernameVerification")
public class ForgotPasswordUsernameVerification extends HttpServlet {
       
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User userByUsername = userDaoImplementation.getUserByUsername(username);
		User userByEmail = userDaoImplementation.getUserByEmail(username);
		

		
		
		System.out.println("username "+username);
		
//		System.out.println("userByUsername "+userByUsername);
		//|| username.equals(userUsername) || username.equals(userEmail) 
		if(userByUsername!=null || userByEmail!=null ) {
			response.sendRedirect("forgotPassword.jsp");
		}else {
			response.sendRedirect("faildToFetchTheUsername.html");
		}
		
		
		
	}
    

}
