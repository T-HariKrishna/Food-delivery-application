package com.hari.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	PrintWriter out = response.getWriter();	
		
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String role = request.getParameter("role");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");

		System.out.println(name+" "+username+" "+email+" "+password+"  "+phone+" "+address+" "+role);

		User user = new User(name,username,email,password,phone,address,role);
		
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		int rowEffected=userDaoImplementation.addUser(user);
		
		if(rowEffected==1) {
			response.sendRedirect("index.html");
		}
		else {
			out.println("Failed in  registering details into data base");
		}
		
	}
}
