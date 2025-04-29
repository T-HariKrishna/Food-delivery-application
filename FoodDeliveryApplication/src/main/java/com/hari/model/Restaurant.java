package com.hari.model;

import java.util.Date;

public class Restaurant {
	private int restaurantId;
	private String name;
	private String address;
	private String phone;
	private double rating;
	private String cuisineType;
	private int isActive;
	private Date eta;
	private int adminUserId;
	private String imagePath;

	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Restaurant(int restaurantId, String name, String address, String phone, double rating,String cuisineType,
			int isActive, Date eta, int adminUserId, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.cuisineType = cuisineType;
		this.isActive = isActive;
		this.eta = eta;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
	}
	
	





	//used mostly for add restaurant
	public Restaurant(String name,String phone, String address,  double rating, String cuisineType, int isActive,
			int adminUserId, String imagePath) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.rating = rating;
		this.cuisineType = cuisineType;
		this.isActive = isActive;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
	}
	
	

	//used mostly for update restaurant
	public Restaurant(int restaurantId, String name, String address, String phone, double rating, String cuisineType,
			int isActive, int adminUserId, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.cuisineType = cuisineType;
		this.isActive = isActive;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
	}



	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", rating=" + rating + ", cuisineType=" + cuisineType + ", isActive=" + isActive + ", eta="
				+ eta + ", adminUserId=" + adminUserId + ", imagePath=" + imagePath + "]";
	}

	
	



	// Getters and Setters
	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public int isActive() {
		return isActive;
	}

	public void setActive(int isActive) {
		this.isActive = isActive;
	}

	public Date getEta() {
		return eta;
	}

	public void setEta(Date eta) {
		this.eta = eta;
	}

	public int getAdminUserId() {
		return adminUserId;
	}

	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
