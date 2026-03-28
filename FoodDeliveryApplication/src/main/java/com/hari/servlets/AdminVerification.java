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

@WebServlet("/AdminVerification")
public class AdminVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User user = userDaoImplementation.getUserByUsername(username);
		
		if (user != null) {

			// ✅ First check password
			if (password.equals(user.getPassword())) {

				// ✅ Then check role
				if (user.getRole() != null && user.getRole().equalsIgnoreCase("admin")) {

					HttpSession session = request.getSession();
					session.setAttribute("user", user);

					response.sendRedirect("AdminFetchAllRestaurants");

				} else {
					// ❌ Not admin
					request.setAttribute("invalid_role_message", "You are not an admin");
					request.getRequestDispatcher("adminSignIn.jsp").forward(request, response);
				}

			} else {
				// ❌ Wrong password
				request.setAttribute("invalid_password_message", "Password is incorrect");
				request.getRequestDispatcher("adminSignIn.jsp").forward(request, response);
			}

		} else {
			// ❌ Username not found
			request.setAttribute("invalid_user_message", "No account found with this username");
			request.getRequestDispatcher("adminSignIn.jsp").forward(request, response);
		}
	}
}