package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;

/**
 * Servlet implementation class EditProfile
 */

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	   HttpSession session=request.getSession();
	   User sessionUser =(User)session.getAttribute("user");
	   System.out.println(sessionUser);
	   int userId = sessionUser.getUserId();
	   
	   String role=request.getParameter("role");
	   String name=request.getParameter("name");
	   String username=request.getParameter("username");
	   String email=request.getParameter("email");
	   String password=request.getParameter("password");
	   String phone=request.getParameter("phone");
	   String address=request.getParameter("address");
	   
	   UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
	   User user = new User(userId,name,username,email,password,phone,address,role);
	   
	   int updateUserProfile = userDaoImplementation.updateUserProfile(user);
	   System.out.println("\n"+updateUserProfile);
	   
	   System.out.println("\n"+name+" "+username+" "+email+" "+password+" "+phone+" "+address);
	   
	   
	   User updatedUser = userDaoImplementation.getUser(userId);
	   
	   System.err.println(updatedUser);

	   //removing old details of user  
	   session.removeAttribute("user");
	   
	   session.setAttribute("user", updatedUser);
	   
	   
	   response.sendRedirect("UserProfile");
	}
}
