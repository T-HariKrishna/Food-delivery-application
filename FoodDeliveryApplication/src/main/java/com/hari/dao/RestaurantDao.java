package com.hari.dao;


import java.util.List;

import com.hari.model.*;

public interface RestaurantDao {

	public abstract List<Restaurant> getAllRestaurants();
	
	Restaurant getRestaurantById(int restaurantId);
    
    int updateRestaurant(Restaurant restaurant);
    
    int addRestaurant(Restaurant restaurant);
    
    int deleteRestaurant(int restaurantId);
	
}


