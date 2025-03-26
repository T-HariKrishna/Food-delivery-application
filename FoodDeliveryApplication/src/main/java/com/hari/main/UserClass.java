package com.hari.main;

import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import com.hari.daoimplementaion.MenuDaoImplementation;
import com.hari.daoimplementaion.RestaurantDaoImplementation;
import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.Menu;
import com.hari.model.Restaurant;
import com.hari.model.User;

public class UserClass {
	
	static  UserDaoImplementation udio =new UserDaoImplementation();
	static Scanner scan=new Scanner(System.in);
	
	
	
	public static void main(String[] args) {
		
//		String otp="";
//		for(int i=0;i<4;i++) {
//			int num=(int)Math.floor(Math.random()*10);
//			System.out.println(otp+=num);
//		}
//		
//		System.out.println(otp);
		
		
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		User userByUsername1 = userDaoImplementation.getUserByUsername("harikrishna");
		System.out.println(userByUsername1);
		
		userDaoImplementation.updateUserPassword(userByUsername1, "000");
		User userByUsername2 = userDaoImplementation.getUserByUsername("harikrishna");
		System.out.println(userByUsername2);
		
		
			
		
//		RestaurantDaoImplementation restaurantDaoImplementation = new RestaurantDaoImplementation();
//		List<Restaurant> searchRestaurantByName = restaurantDaoImplementation.searchRestaurantByName("a");
//		System.out.println(searchRestaurantByName);
//		System.out.println(searchRestaurantByName.size());
		
		

		
//		MenuDaoImplementation menuDaoImplementation = new MenuDaoImplementation();
//		List<Menu> searchMenuItemsByName = menuDaoImplementation.searchMenuItemsByName("chicken");
//		System.out.println(searchMenuItemsByName);
//		System.out.println(searchMenuItemsByName.size());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
////		User user = new User("hari","hari123","har@123","har@123","987645","A.P");
//		
		
//		setUserDetails();
		
//		udio.deleteUser(1);
//		udio.deleteUser(2);
//		udio.deleteUser(4);

//		List<User> allUsers = udio.getAllUsers();
//		for (User user : allUsers) {
//			System.out.println(user);
//		}
//		
	}
}

