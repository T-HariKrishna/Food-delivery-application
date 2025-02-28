package com.hari.daoimplementaion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hari.dao.RestaurantDao;
import com.hari.model.Restaurant;
import com.hari.utility.DataBaseUtility;


public class RestaurantDaoImplementation implements RestaurantDao {

    // SQL Queries
	private static final String GET_ALL_RESTAURANT_NAME = "SELECT name FROM `Restaurant` where `restaurantId`=?";
    private static final String GET_ALL_RESTAURANTS = "SELECT * FROM `Restaurant`";
    private static final String GET_RESTAURANT_BY_ID = "SELECT * FROM `Restaurant` WHERE `restaurantId`=?";
    private static final String UPDATE_RESTAURANT = "UPDATE `Restaurant` SET `name`=?, `address`=?, `phone`=?, `rating`=?, `cuisineType`=?, `isActive`=?,  `adminUserId`=?, `imagePath`=? WHERE `restaurantId`=?";
    private static final String ADD_RESTAURANT = "INSERT INTO `Restaurant` (`name`, `address`, `phone`, `rating`, `cuisineType`, `isActive`, `adminUserId`, `imagePath`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_RESTAURANT = "DELETE FROM `Restaurant` WHERE `restaurantId`=?";
    private static final String SEARCH_RESTAURANT = "SELECT * FROM `restaurant` where LOWER(`name`) LIKE  LOWER(?)";

   
    public List<Restaurant> searchRestaurantByName(String name){
    List<Restaurant> restaurantList=new ArrayList<Restaurant>();
    	try(Connection connection=DataBaseUtility.getConnection();
    		PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_RESTAURANT)	;){
    		String restaurantName="%"+name+"%";
    		preparedStatement.setString(1, restaurantName);
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		while(resultSet.next()) {
    			Restaurant restaurant = extractRestaurant(resultSet);
    			restaurantList.add(restaurant);
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return restaurantList;
    }
    
    public String getRestaurantName(int restaurantId) {
    	String restaurantName =null;
    	try (Connection connection = DataBaseUtility.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_RESTAURANT_NAME);
    			) {
    		preparedStatement.setInt(1, restaurantId);
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		while(resultSet.next()) {
    			 restaurantName = resultSet.getString("name");
    		}
               
           } catch (SQLException e) {
               e.printStackTrace(); // Consider using a logging framework
           }
           return restaurantName;
    }
    
    
    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> restaurantList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_RESTAURANTS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Restaurant restaurant = extractRestaurant(resultSet);
                restaurantList.add(restaurant);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return restaurantList;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        Restaurant restaurant = null;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_RESTAURANT_BY_ID)) {
            preparedStatement.setInt(1, restaurantId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                restaurant = extractRestaurant(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return restaurant;
    }

    @Override
    public int updateRestaurant(Restaurant restaurant) {
    	
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTAURANT)) {
            preparedStatement.setString(1, restaurant.getName());
            preparedStatement.setString(2, restaurant.getAddress());
            preparedStatement.setString(3, restaurant.getPhone());
            preparedStatement.setDouble(4, restaurant.getRating());
            preparedStatement.setString(5, restaurant.getCuisineType());
            preparedStatement.setInt(6, restaurant.isActive());
            preparedStatement.setInt(7, restaurant.getAdminUserId());
            preparedStatement.setString(8, restaurant.getImagePath());
            preparedStatement.setInt(9, restaurant.getRestaurantId());
            return preparedStatement.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
		return 0;
		
    }

    @Override
    public int addRestaurant(Restaurant restaurant) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_RESTAURANT)) {
            preparedStatement.setString(1, restaurant.getName());
            preparedStatement.setString(2, restaurant.getAddress());
            preparedStatement.setString(3, restaurant.getPhone());
            preparedStatement.setDouble(4, restaurant.getRating());
            preparedStatement.setString(5, restaurant.getCuisineType());
            preparedStatement.setInt(6, restaurant.isActive());
            preparedStatement.setInt(7, restaurant.getAdminUserId());
            preparedStatement.setString(8, restaurant.getImagePath());

           return  preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
		return 0;
    }

    @Override
    public int deleteRestaurant(int restaurantId) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTAURANT)) {
            preparedStatement.setInt(1, restaurantId);
          return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
		return 0;
    }

    // Helper method to extract Restaurant data from ResultSet
    private Restaurant extractRestaurant(ResultSet resultSet) throws SQLException {
        int restaurantId = resultSet.getInt("restaurantId");
        String name = resultSet.getString("name");
        String address = resultSet.getString("address");
        String phone = resultSet.getString("phone");
        double rating = resultSet.getDouble("rating");
        String cuisineType = resultSet.getString("cuisineType");
        int isActive = resultSet.getInt("isActive");
        Date eta = resultSet.getDate("eta");
        int adminUserId = resultSet.getInt("adminUserId");
        String imagePath = resultSet.getString("imagePath");

        return new Restaurant(restaurantId, name, address, phone, rating,cuisineType,  isActive, eta, adminUserId, imagePath);
    }
}