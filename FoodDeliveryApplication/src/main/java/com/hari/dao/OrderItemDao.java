package com.hari.dao;


import java.util.List;

import com.hari.model.*;

public interface OrderItemDao {

	public List<OrderItem> getAllOrderItems(int orderId);
	
	List<OrderItem> getOrderItemByOrderId(int orderItemId);
    
    void updateOrderItem(OrderItem orderItem);
    
    void addOrderItem(OrderItem orderItem);
    
    void deleteOrderItem(int orderItemId);
	
}


