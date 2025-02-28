package com.hari.daoimplementaion;

import com.hari.dao.OrderHistoryDao;
import com.hari.model.OrderHistory;
import com.hari.utility.DataBaseUtility;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderHistoryDaoImplementation implements OrderHistoryDao {

    private static final String GET_ALL_ORDER_HISTORY = "SELECT * FROM `OrderHistory`";
    private static final String GET_ORDER_HISTORY_BY_ID = "SELECT * FROM `OrderHistory` WHERE `orderhistoryId`=?";
    private static final String UPDATE_ORDER_HISTORY = "UPDATE `OrderHistory` SET `orderid`=?, `userid`=?, `restaurantId`=?, `total`=?, `status`=? WHERE `orderhistoryId`=?";
    private static final String ADD_ORDER_HISTORY = "INSERT INTO `OrderHistory` (`orderid`, `userid`, `restaurantId`, `total`, `status`) VALUES (?, ?, ?, ?, ?)";
    private static final String DELETE_ORDER_HISTORY = "DELETE FROM `OrderHistory` WHERE `orderhistoryId`=?";

    private static final String GET_ORDER_HISTORY_BY_USERID = "SELECT * FROM `OrderHistory` WHERE `userId`=?";
    
    
    @Override
    public int addOrderHistory(OrderHistory orderHistory) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER_HISTORY, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, orderHistory.getOrderid());
            preparedStatement.setInt(2, orderHistory.getUserid());
            preparedStatement.setInt(3, orderHistory.getRestaurantId());
            preparedStatement.setDouble(4, orderHistory.getTotal());
            preparedStatement.setString(5, orderHistory.getStatus());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderHistory.setOrderhistoryId(generatedKeys.getInt(1)); // Set the generated orderhistoryId
                }
            }
            System.out.println(rowsAffected + " rows inserted.");
            
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logging
        }
        return 0;
    }

    @Override
    public OrderHistory getOrderHistoryById(int orderhistoryId) {
        OrderHistory orderHistory = null;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_HISTORY_BY_ID)) {
            preparedStatement.setInt(1, orderhistoryId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                orderHistory = extractOrderHistory(resultSet);
            } else {
                System.out.println("No order history found for the given orderhistoryId");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logging
        }
        return orderHistory;
    }

    @Override
    public List<OrderHistory> getAllOrderHistory() {
        List<OrderHistory> orderHistoryList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDER_HISTORY)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OrderHistory orderHistory = extractOrderHistory(resultSet);
                orderHistoryList.add(orderHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logging
        }
        return orderHistoryList;
    }

    @Override
    public void updateOrderHistory(OrderHistory orderHistory) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER_HISTORY)) {
            preparedStatement.setInt(1, orderHistory.getOrderid());
            preparedStatement.setInt(2, orderHistory.getUserid());
            preparedStatement.setInt(3, orderHistory.getRestaurantId());
            preparedStatement.setDouble(4, orderHistory.getTotal());
            preparedStatement.setString(5, orderHistory.getStatus());
            preparedStatement.setInt(6, orderHistory.getOrderhistoryId());

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows updated.");
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logging
        }
    }

    @Override
    public void deleteOrderHistory(int orderhistoryId) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_HISTORY)) {
            preparedStatement.setInt(1, orderhistoryId);

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows deleted.");
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logging
        }
    }

    // Helper method to extract OrderHistory from ResultSet
    private OrderHistory extractOrderHistory(ResultSet resultSet) throws SQLException {
        int orderhistoryId = resultSet.getInt("orderhistoryId");
        int orderid = resultSet.getInt("orderid");
        int userid = resultSet.getInt("userid");
        int restaurantId = resultSet.getInt("restaurantId");
        double total = resultSet.getDouble("total");
        String status = resultSet.getString("status");

        return new OrderHistory(orderhistoryId,orderid, userid, restaurantId, total, status);
    }

	@Override
	public List<OrderHistory> getOrderHistoryByUserId(int userId) {
		List<OrderHistory> orderHistoryList=new ArrayList<OrderHistory>();
		OrderHistory orderHistory=null;
		try(Connection connection =DataBaseUtility.getConnection();
				PreparedStatement prepareStatement=connection.prepareStatement(GET_ORDER_HISTORY_BY_USERID)) {
			
			prepareStatement.setInt(1, userId);
			
			ResultSet resultSet = prepareStatement.executeQuery();
			while(resultSet.next()) {
				orderHistory = extractOrderHistory(resultSet);
				orderHistoryList.add(orderHistory);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return orderHistoryList;
		
	}
}
