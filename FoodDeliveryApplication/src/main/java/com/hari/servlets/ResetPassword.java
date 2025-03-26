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
 * Servlet implementation class resetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User user = userDaoImplementation.getUserByUsername(username);

		if (user == null) {
			response.getWriter().print("Username is not find in the server");
		}

		if (newPassword.equals(confirmPassword)) {

			userDaoImplementation.updateUserPassword(user, confirmPassword);
			response.sendRedirect("index.html");

		} else {
			response.getWriter().print("password mismatching");
		}

	}

}
