package com.hari.daoimplementaion;


import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.hari.dao.OrdersDao;
import com.hari.model.Orders;
import com.hari.utility.DataBaseUtility;

public class OrdersDaoImplementation implements OrdersDao {

    private static final String ADD_ORDER = "INSERT INTO `Orders` (`userId`,`restaurantId`, `totalAmount`, `status`, `paymentMode`) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM `Orders` WHERE `orderId`=?";
    private static final String GET_ORDER_BY_ORDER_ID = "SELECT * FROM `Orders` WHERE `orderId`=?";
    private static final String UPDATE_ORDER = "UPDATE `Orders` SET `userId`=?, `restaurantId`=?, `orderDate`=?, `totalAmount`=?, `status`=?, `paymentMode`=? WHERE `orderId`=?";
    private static final String DELETE_ORDER = "DELETE FROM `Orders` WHERE `orderId`=?";
    private static final String GET_ALL_ORDERS_BY_USER = "SELECT * FROM `Orders` WHERE `userId`=?";
    private static final String GET_ORDERID = "SELECT * FROM `Orders` WHERE `orderId`=(select MAX(`orderid`) from `orders`)";

    
    public List<Orders> getAllOrdersbyOrderId(int orderId) {
        List<Orders> orderList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_ORDER_ID)) {
            preparedStatement.setInt(1, orderId);  // Set the userId parameter
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Orders order = extractOrder(resultSet);
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return orderList;
    }
    
    
    
    public Orders getOrderId() {
		
    	Orders order=null;
    	try(Connection connection=DataBaseUtility.getConnection();
    			Statement statement=connection.createStatement()) {
			
    		
    		ResultSet resultSet = statement.executeQuery(GET_ORDERID);
    		
    		while(resultSet.next()) {
//    			System.out.println("id found");
    			return order=extractOrder(resultSet);
    		}
//    		System.out.println("Id not found");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return order;
    	
    	
    }
    
    @Override
    public int addOrder(Orders order) {
    	int rowsAffected=0;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER)) {
            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setInt(2, order.getRestaurantId());
            // Convert LocalDate to String (yyyy-mm-dd) before setting it
//            preparedStatement.setDate(3, Date.valueOf(order.getOrderDate()));  // Ensure order.getOrderDate() is LocalDate
            preparedStatement.setDouble(3, order.getTotalAmount());
            preparedStatement.setString(4, order.getStatus());
            preparedStatement.setString(5, order.getPaymentMode());

             rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 1) {
            	System.out.println("order details successfully entered into database");

            }

            System.out.println(rowsAffected + " rows inserted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return rowsAffected;
    }

    @Override
    public Orders getOrder(int orderId) {
        Orders order = null;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_ID)) {
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                order = extractOrder(resultSet);
            } else {
                System.out.println("No data found for orderId: " + orderId);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return order;
    }

    @Override
    public void updateOrder(Orders order) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER)) {

            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setInt(2, order.getRestaurantId());
            
            // Use setTimestamp to set the LocalDateTime (which includes both date and time)
            preparedStatement.setTimestamp(3, Timestamp.valueOf(order.getOrderDateTime()));  // Correct method for LocalDateTime
            
            preparedStatement.setDouble(4, order.getTotalAmount());
            preparedStatement.setString(5, order.getStatus());
            preparedStatement.setString(6, order.getPaymentMode());
            preparedStatement.setInt(7, order.getOrderId()); // Specify which order to update

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows updated.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
    }


    @Override
    public void deleteOrder(int orderId) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER)) {
            preparedStatement.setInt(1, orderId);

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows deleted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
    }

    @Override
    public List<Orders> getAllOrdersbyUser(int userId) {
        List<Orders> orderList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDERS_BY_USER)) {
            preparedStatement.setInt(1, userId);  // Set the userId parameter
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Orders order = extractOrder(resultSet);
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return orderList;
    }

    // Helper method to extract Orders from ResultSet
 // Helper method to extract Orders from ResultSet
    private Orders extractOrder(ResultSet resultSet) throws SQLException {
        int orderId = resultSet.getInt("orderId");
        int userId = resultSet.getInt("userId");
        int restaurantId = resultSet.getInt("restaurantId");
        Timestamp orderDateTime = resultSet.getTimestamp("orderDate");  // Get Timestamp for date + time
        double totalAmount = resultSet.getDouble("totalAmount");
        String status = resultSet.getString("status");
        String paymentMode = resultSet.getString("paymentMode");

        // Convert Timestamp to LocalDateTime for better handling
        LocalDateTime localOrderDateTime = orderDateTime.toLocalDateTime();

        return new Orders(orderId, userId, restaurantId, localOrderDateTime, totalAmount, status, paymentMode);
    }


}
