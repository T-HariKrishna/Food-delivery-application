package com.hari.dao;

import java.util.List;

import com.hari.model.OrderHistory;

public interface OrderHistoryDao {
	int addOrderHistory(OrderHistory orderHistory);

    // Get an order history by orderhistoryId
    OrderHistory getOrderHistoryById(int orderhistoryId);

    // Get an order history by userId
    List<OrderHistory> getOrderHistoryByUserId(int userId);
    
    // Get all order histories
    List<OrderHistory> getAllOrderHistory();

    // Update an existing order history
    void updateOrderHistory(OrderHistory orderHistory);

    // Delete an order history by orderhistoryId
    void deleteOrderHistory(int orderhistoryId);
}
