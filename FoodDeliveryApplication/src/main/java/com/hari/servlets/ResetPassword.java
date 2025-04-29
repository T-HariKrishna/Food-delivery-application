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
 * Servlet implementation class resetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User user = userDaoImplementation.getUserByUsername(username);

		System.out.println("User: " + user);
		System.out.println("Passwords: " + newPassword + " | " + confirmPassword);

		// Check if user exists
		if (user == null) {
			session.setAttribute("userErrorMessage", "Username not found in the server.");
			response.sendRedirect("resetPasswordForm.jsp");
			return;
		}

		// Clear previous error message
		session.removeAttribute("userErrorMessage");

		// Check if passwords match
		if (!newPassword.equals(confirmPassword)) {
			
			response.sendRedirect("resetPasswordForm.jsp");
			return;
		}

		// Clear previous error message
		session.removeAttribute("passwordMismatchMessage");

		// Proceed to update password
		userDaoImplementation.updateUserPassword(user, confirmPassword);
		response.sendRedirect("index.jsp");
	}
}


















   
    