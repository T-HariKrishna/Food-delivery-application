package com.hari.model;

import java.time.LocalDateTime;

public class Orders {
    private int orderId;
    private int userId;
    private int restaurantId;
    private LocalDateTime orderDateTime; // Use LocalDateTime to store both date and time
    private double totalAmount;
    private String status;
    private String paymentMode;

    // Default constructor
    public Orders() {}

    // Parameterized constructor with all fields
    public Orders(int orderId, int userId, int restaurantId, LocalDateTime orderDateTime, double totalAmount, String status, String paymentMode) {
        this.orderId = orderId;
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.orderDateTime = orderDateTime;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMode = paymentMode;
    }
    
    
    //used mostly
    public Orders(int userId, int restaurantId, double totalAmount, String status, String paymentMode) {
		super();
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}

	// Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public LocalDateTime getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(LocalDateTime orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    @Override
    public String toString() {
        return "Orders [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId + ", orderDateTime=" + orderDateTime + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode=" + paymentMode + "]";
    }
}
