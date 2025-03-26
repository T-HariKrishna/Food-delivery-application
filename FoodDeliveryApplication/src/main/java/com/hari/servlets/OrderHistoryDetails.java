package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import com.hari.daoimplementaion.OrderHistoryDaoImplementation;
import com.hari.model.OrderHistory;
import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

/**
 * Servlet implementation class OrderHistory
 */

@WebServlet("/OrderHistoryDetails")
public class OrderHistoryDetails extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session=request.getSession();
		int userId=Integer.parseInt(request.getParameter("userId"));
		if(userId==0) {
			response.getWriter().write("INVALID USER !!!!!!!!!!!!!!!!!");
			return;
		}
		
		OrderHistoryDaoImplementation orderHistoryDaoImplementation = new OrderHistoryDaoImplementation();
		
		List<OrderHistory> orderHistoryByUserId = orderHistoryDaoImplementation.getOrderHistoryByUserId(userId);
		
		//reverse the history list as recent to past 
		Collections.reverse(orderHistoryByUserId);
		
		session.setAttribute("orderHistoryDetails", orderHistoryByUserId);
		
		System.out.println(orderHistoryByUserId);
		
		response.sendRedirect("showOrderHistoryDetails.jsp");

		
		

	}
}
