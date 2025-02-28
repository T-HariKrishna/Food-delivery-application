package com.hari.dao;


import java.util.List;

import com.hari.model.*;

public interface MenuDao {

	List<Menu> getAllMenuByRestaurantId(int restaurantId);
	
	Menu getMenu(int menuId);
    
    int updateMenu(Menu menu);
    
    int addMenu(Menu menu);
    
    int deleteMenu(int menuId);
	
}


