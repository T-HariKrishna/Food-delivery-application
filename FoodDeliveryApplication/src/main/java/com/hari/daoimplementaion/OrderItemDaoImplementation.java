package com.hari.daoimplementaion;
import com.hari.dao.OrderItemDao;
import com.hari.model.OrderItem;
import com.hari.utility.DataBaseUtility;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDaoImplementation implements OrderItemDao {

    private static final String GET_ALL_ORDER_ITEMS_BY_ORDERID = "SELECT * FROM `OrderItem` WHERE `orderId` = ?";
    private static final String GET_ORDER_ITEM_BY_ORDERITEMID = "SELECT * FROM `OrderItem` WHERE `orderItemId`=?";
    private static final String UPDATE_ORDER_ITEM = "UPDATE `OrderItem` SET `orderId`=?, `menuId`=?, `quantity`=?, `totalPrice`=? WHERE `orderItemId`=?";
    private static final String ADD_ORDER_ITEM = "INSERT INTO `OrderItem` (`orderId`, `menuId`, `quantity`, `totalPrice`) VALUES (?, ?, ?, ?)";
    private static final String DELETE_ORDER_ITEM = "DELETE FROM `OrderItem` WHERE `orderItemId`=?";

    @Override
    public List<OrderItem> getAllOrderItems(int orderItemId) {
        List<OrderItem> orderItemList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_ITEM_BY_ORDERITEMID)) {
            preparedStatement.setInt(1, orderItemId);  // Setting the orderItemId in the query
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OrderItem orderItem = extractOrderItem(resultSet);
                orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return orderItemList;
    }

    @Override
    public List<OrderItem> getOrderItemByOrderId(int orderId) {
    	List<OrderItem> orderItemList = new ArrayList<OrderItem>();
       
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDER_ITEMS_BY_ORDERID)) {
            preparedStatement.setInt(1, orderId);  // Setting the orderId to fetch the item
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
            	 OrderItem orderItem = extractOrderItem(resultSet);
                 orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return orderItemList;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER_ITEM)) {
            preparedStatement.setInt(1, orderItem.getOrderId());
            preparedStatement.setInt(2, orderItem.getMenuId());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setDouble(4, orderItem.getTotalPrice());
            preparedStatement.setInt(5, orderItem.getOrderItemId());  // To specify which orderItem to update

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows updated.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
    }

    @Override
    public void addOrderItem(OrderItem orderItem) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER_ITEM, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, orderItem.getOrderId());
            preparedStatement.setInt(2, orderItem.getMenuId());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setDouble(4, orderItem.getTotalPrice());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderItem.setOrderItemId(generatedKeys.getInt(1)); // Retrieve and set the generated orderItemId
                }
            }
            System.out.println(rowsAffected + " rows inserted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_ITEM)) {
            preparedStatement.setInt(1, orderItemId);  // Set the orderItemId to delete

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows deleted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
    }

    // Helper method to extract OrderItem from ResultSet
    private OrderItem extractOrderItem(ResultSet resultSet) throws SQLException {
        int orderItemId = resultSet.getInt("orderItemId");
        int orderId = resultSet.getInt("orderId");
        int menuId = resultSet.getInt("menuId");
        int quantity = resultSet.getInt("quantity");
        double totalPrice = resultSet.getDouble("totalPrice");

        return new OrderItem(orderItemId, orderId, menuId, quantity, totalPrice);
    }
}
