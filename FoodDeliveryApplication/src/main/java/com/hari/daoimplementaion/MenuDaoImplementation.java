package com.hari.daoimplementaion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hari.dao.MenuDao;
import com.hari.model.Menu;
import com.hari.utility.DataBaseUtility;

public class MenuDaoImplementation implements MenuDao {

    private static final String GET_ALL_MENU_BY_RESTAURANT = "SELECT * FROM `Menu` WHERE `restaurantId`=?";
    private static final String GET_MENU_OF_ALL_RESTAURANTS = "SELECT * FROM `Menu`";
    private static final String GET_MENU_BY_ID = "SELECT * FROM `Menu` WHERE `menuId`=?";
    private static final String UPDATE_MENU = "UPDATE `Menu` SET `restaurantId`=?, `itemName`=?, `description`=?, `price`=?, `ratings`=?, `isAvailable`=?, `imagePath`=? WHERE `menuId`=?";
    private static final String ADD_MENU = "INSERT INTO `Menu` (`restaurantId`, `itemName`, `description`, `price`, `ratings`, `isAvailable`, `imagePath`) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_MENU = "DELETE FROM `Menu` WHERE `menuId`=?";
    private static final String SEARCH_MENU = "SELECT * FROM MENU WHERE LOWER(`itemname`) LIKE LOWER(?)";

    public List<Menu> searchMenuItemsByName(String itemName){
    	List<Menu> menuList=new ArrayList<Menu>();
    	try (Connection connection=DataBaseUtility.getConnection();
    		 PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_MENU);){
    		String searchMenuName="%"+itemName+"%";
    		preparedStatement.setString(1, searchMenuName);
    		ResultSet resultSet = preparedStatement.executeQuery();
    		while(resultSet.next()) {
    			Menu menu = extractMenu(resultSet);
    			menuList.add(menu);
    		}
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return menuList;
    }
    
    public List<Menu> getMenuOfAllRestaurants() {
        List<Menu> menuList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
        		Statement statement = connection.createStatement();) {
        	
        	ResultSet resultSet = statement.executeQuery(GET_MENU_OF_ALL_RESTAURANTS);
        	

            while (resultSet.next()) {
                Menu menu = extractMenu(resultSet);
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return menuList;
    }
    
    
    
    @Override
    public List<Menu> getAllMenuByRestaurantId(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_MENU_BY_RESTAURANT)) {
            preparedStatement.setInt(1, restaurantId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Menu menu = extractMenu(resultSet);
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return menuList;
    }
    

    @Override
    public Menu getMenu(int menuId) {
        Menu menu = null;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU_BY_ID)) {
            preparedStatement.setInt(1, menuId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                menu = extractMenu(resultSet);
            } else {
                System.out.println("No data available for the menu id");
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return menu;
    }

    @Override
    public int updateMenu(Menu menu) {
    	int rowsAffected =0;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MENU)) {
            preparedStatement.setInt(1, menu.getRestaurantId());
            preparedStatement.setString(2, menu.getItemName());
            preparedStatement.setString(3, menu.getDescription());
            preparedStatement.setDouble(4, menu.getPrice());
            preparedStatement.setDouble(5, menu.getRatings());
            preparedStatement.setInt(6, menu.isAvailable());
            preparedStatement.setString(7, menu.getImagePath());
            preparedStatement.setInt(8, menu.getMenuId());  // To specify which menu to update

             rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows updated.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return rowsAffected;
    }

    @Override
    public int addMenu(Menu menu) {
    	
    	int rowsAffected =0;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_MENU, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, menu.getRestaurantId());
            preparedStatement.setString(2, menu.getItemName());
            preparedStatement.setString(3, menu.getDescription());
            preparedStatement.setDouble(4, menu.getPrice());
            preparedStatement.setDouble(5, menu.getRatings());
            preparedStatement.setInt(6, menu.isAvailable());
            preparedStatement.setString(7, menu.getImagePath());

            rowsAffected = preparedStatement.executeUpdate();

           
//            System.out.println(rowsAffected + " rows inserted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        return rowsAffected;
    }

    @Override
    public int  deleteMenu(int menuId) {
    	int rowsAffected =0;
        try (Connection connection = DataBaseUtility.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MENU)) {
            preparedStatement.setInt(1, menuId);

             rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " rows deleted.");  // Consider logging instead
        } catch (SQLException e) {
            e.printStackTrace();  // Replace with a logging library
        }
        
        return rowsAffected;
    }

    // Helper method to extract Menu from ResultSet
    private Menu extractMenu(ResultSet resultSet) throws SQLException {
        int menuId = resultSet.getInt("menuId");
        int restaurantId = resultSet.getInt("restaurantId");
        String itemName = resultSet.getString("itemName");
        String description = resultSet.getString("description");
        double price = resultSet.getDouble("price");
        double ratings = resultSet.getDouble("ratings");
        int isAvailable = resultSet.getInt("isAvailable");
        String imagePath = resultSet.getString("imagePath");

        return new Menu( menuId, restaurantId, itemName, description, price, ratings, isAvailable, imagePath);
    }
}

