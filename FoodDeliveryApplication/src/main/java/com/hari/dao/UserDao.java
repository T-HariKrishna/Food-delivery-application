package com.hari.dao;


import java.util.List;

import com.hari.model.User;

public interface UserDao {

	int  addUser(User user);
	
    int updateUser(User user);
    
    int deleteUser(String email);
    
    User getUser(int userId);

    User getUserByEmail(String email);
    
    User getUserByUsername(String username);

    List<User> getAllUsers(); //public abstract 
	
    int deleteUser(int  userId);
}


