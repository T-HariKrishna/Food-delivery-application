package com.hari.daoimplementaion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hari.dao.UserDao;
import com.hari.model.User;
import com.hari.utility.DataBaseUtility;

public class UserDaoImplementation implements UserDao {

	// SQL Queries
	private static final String ADD_USER = "INSERT INTO `User` (`name`, `username`, `email`, `password`, `phone`, `address`,`role`) VALUES (?, ?, ?, ?, ?,?, ?)";
	private static final String GET_USER_BY_ID = "SELECT * FROM `User` WHERE `userId`=?";
	private static final String UPDATE_USER = "UPDATE `User` SET `name`=?, `username`=?, `password`=?, `email`=?, `phone`=?, `address`=?, `role`=?, `createdDate`=?, `lastLoginDate`=? WHERE `userId`=?";
	
	private static final String UPDATE_USER_PROFILE = "UPDATE `User` SET `name`=?, `username`=?, `password`=?, `email`=?, `phone`=?, `address`=?, `role`=? WHERE `userId`=?";
	
	private static final String DELETE_USER = "DELETE FROM `User` WHERE `userId`=?";
	private static final String DELETE_USER_BY_USERNAME = "DELETE FROM `User` WHERE `email`=?";
	private static final String GET_ALL_USERS = "SELECT * FROM `User`";
	private static final String GET_USER_By_USERNAME = "SELECT * FROM `User` where username=?";
	private static final String GET_USER_By_EMAIL = "SELECT * FROM `User` where email=?";

	
	public int updateUserProfile(User user) {
		System.err.println(user);
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_PROFILE)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPhone());
			preparedStatement.setString(6, user.getAddress());
			preparedStatement.setString(7, user.getRole());
			preparedStatement.setInt(8, user.getUserId());

			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return 0;
	}
	
	@Override
	public int addUser(User user) {
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getPhone());
			preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getRole());
//            preparedStatement.setDate(8, new java.sql.Date(user.getCreatedDate().getTime()));
//            preparedStatement.setDate(9, new java.sql.Date(user.getLastLoginDate().getTime()));

			System.out.println("User details successfully entered into database");

			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return 0;
	}

	@Override
	public User getUser(int userId) {
		User user = null;
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_ID)) {
			preparedStatement.setInt(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				user = extractUser(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return user;
	}

	@Override
	public int updateUser(User user) {
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPhone());
			preparedStatement.setString(6, user.getAddress());
			preparedStatement.setString(7, user.getRole());
			preparedStatement.setDate(8, new java.sql.Date(user.getCreatedDate().getTime()));
			preparedStatement.setDate(9, new java.sql.Date(user.getLastLoginDate().getTime()));
			preparedStatement.setInt(10, user.getUserId());

			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return 0;
	}

	@Override
	public int deleteUser(int userId) {
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {
			preparedStatement.setInt(1, userId);
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return 0;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USERS);
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				User user = extractUser(resultSet);
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return userList;
	}

	// Helper method to extract User data from ResultSet
	private User extractUser(ResultSet resultSet) throws SQLException {
		int userId = resultSet.getInt("userId");
		String name = resultSet.getString("name");
		String username = resultSet.getString("username");
		String email = resultSet.getString("email");
		String password = resultSet.getString("password");
		String phone = resultSet.getString("phone");
		String address = resultSet.getString("address");
		String role = resultSet.getString("role");
		Date createdDate = resultSet.getDate("createdDate");
		Date lastLoginDate = resultSet.getDate("lastLoginDate");

		return new User(userId, name, username, email, password, phone, address, role, createdDate, lastLoginDate);
	}

	@Override
	public User getUserByEmail(String email) {
		User user = null;
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_By_EMAIL)) {

			preparedStatement.setString(1, email);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				user = extractUser(resultSet);
			}
		} catch (Exception e) {

		}
		return user;
	}

	@Override
	public User getUserByUsername(String username) {
		User user = null;
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_By_USERNAME)) {

			preparedStatement.setString(1, username);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				user = extractUser(resultSet);
			}
		} catch (Exception e) {

		}
		return user;
	}

	@Override
	public int deleteUser(String email) {
		
		try (Connection connection = DataBaseUtility.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_USERNAME)) {
			preparedStatement.setString(1, email);
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework
		}
		return 0;
	}

}
