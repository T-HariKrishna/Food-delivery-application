package com.hari.dao;


import java.util.List;

import com.hari.model.*;

public interface OrdersDao {

	int addOrder(Orders order);
	
	Orders getOrder(int orderId);
	
	void updateOrder(Orders order);
	
	void deleteOrder(int orderId);
	
	List<Orders> getAllOrdersbyUser(int userId);
}


