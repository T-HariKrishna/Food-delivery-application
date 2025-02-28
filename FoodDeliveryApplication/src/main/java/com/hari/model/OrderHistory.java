package com.hari.model;

public class OrderHistory {
	private int orderhistoryId;
    private int orderid;
    private int userid;
    private int restaurantId;
    private double total;
    private String status;
	
    
    public OrderHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
    
    public OrderHistory(int orderid, int userid, int restaurantId, double total, String status) {
    	super();
    	this.orderid = orderid;
    	this.userid = userid;
    	this.restaurantId = restaurantId;
    	this.total = total;
    	this.status = status;
    }
    
	
	public OrderHistory(int orderhistoryId, int orderid, int userid, int restaurantId, double total, String status) {
		super();
		this.orderhistoryId = orderhistoryId;
		this.orderid = orderid;
		this.userid = userid;
		this.restaurantId = restaurantId;
		this.total = total;
		this.status = status;
	}




	@Override
	public String toString() {
		return "OrderHistory [orderhistoryId=" + orderhistoryId + ", orderid=" + orderid + ", userid=" + userid
				+ ", restaurantId=" + restaurantId + ", total=" + total + ", status=" + status + "]";
	}
	public int getOrderhistoryId() {
		return orderhistoryId;
	}
	public void setOrderhistoryId(int orderhistoryId) {
		this.orderhistoryId = orderhistoryId;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
    
    
}
