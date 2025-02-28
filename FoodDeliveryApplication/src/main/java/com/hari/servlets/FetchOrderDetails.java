package com.hari.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.hari.daoimplementaion.OrderItemDaoImplementation;
import com.hari.model.OrderItem;

/**
 * Servlet implementation class fetchOrderDetails
 */
@WebServlet("/FetchOrderDetails")
public class FetchOrderDetails extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderItemDaoImplementation orderItemDaoImplementation = new OrderItemDaoImplementation();
		List<OrderItem> orderItemByOrderIdList = orderItemDaoImplementation.getOrderItemByOrderId(orderId);
		System.out.println(orderItemByOrderIdList);
		
		session.setAttribute("orderItemDetails", orderItemByOrderIdList);

		
		response.sendRedirect("showOrderItemDetails.jsp");
	}

}
