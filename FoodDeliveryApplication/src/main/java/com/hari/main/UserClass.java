package com.hari.main;

import java.util.List;
import java.util.Scanner;

import com.hari.daoimplementaion.UserDaoImplementation;
import com.hari.model.User;

public class UserClass {
	
	static  UserDaoImplementation udio =new UserDaoImplementation();
	static Scanner scan=new Scanner(System.in);
	
	
	
	public static void main(String[] args) {
////		User user = new User("hari","hari123","har@123","har@123","987645","A.P");
//		
		
//		setUserDetails();
		
//		udio.deleteUser(1);
//		udio.deleteUser(2);
//		udio.deleteUser(4);

		List<User> allUsers = udio.getAllUsers();
		for (User user : allUsers) {
			System.out.println(user);
		}
		
	}
}

