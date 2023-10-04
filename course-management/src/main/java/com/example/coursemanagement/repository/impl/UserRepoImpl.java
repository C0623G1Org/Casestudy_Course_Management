package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.User;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.IUserRepo;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserRepoImpl implements IUserRepo {
    private final static String SELECT_ALL = "SELECT * FROM user;";
    private static final String SELECT_BY_ID = "SELECT * FROM user WHERE user_id = ?";
    private static final String SELECT_BY_USERNAME = "SELECT * FROM user WHERE user_name = ?;";
    private static final String SELECT_BY_USERNAME_PASSWORD = "SELECT * FROM user WHERE user_name = ? AND password = ?;";
    private static final String INSERT_USER = "INSERT INTO user(user_name, password, email, role) VALUES (?, ?, ?, 'user');";
    private static final String UPDATE_USER = "update user\n" +
            "set user_name=?, full_name=?,id_card=?, birthday=?, gender=?,phone=?, email=?"+ "\n" +
            "where role=\"user\" and user_id=?;";
    private static final String UPDATE_MEMBER = "update user\n" +
            "set user_name=?, full_name=?,id_card=?, birthday=?, gender=?,phone=?, email=?"+ "\n" +
            "where user_id=?;";
    private static final String DELETE_USER = "delete from user"+"\n" +
            "where user_id=?;";

    @Override
    public List<User> showListE() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL);
            while (resultSet.next()){
                int userId = resultSet.getInt("user_id");
                String userName = resultSet.getString("usexr_name");
                String password = resultSet.getString("password");
                String full_name = resultSet.getString("full_name");
                String idCard = resultSet.getString("id_card");
                String birthday = resultSet.getString("birthday");
                boolean gender = resultSet.getBoolean("gender");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                userList.add(new User(userId,userName,password,full_name,idCard,birthday,gender,phone,email,role));
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }
    @Override
    public void saveE(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public User selectE(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int userId = resultSet.getInt("user_id");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                String full_name = resultSet.getString("full_name");
                String idCard = resultSet.getString("id_card");
                String birthday = resultSet.getString("birthday");
                boolean gender = resultSet.getBoolean("gender");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                user = new User(userId,userName,password,full_name,idCard,birthday,gender,phone,email,role);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, User user) {
        return false;
    }

    @Override
    public void updateE(User user) {
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement=null;
        try {

            if(user.getRole().equals("admin")){
                preparedStatement=connection.prepareStatement(UPDATE_MEMBER);
                preparedStatement.setString(1,user.getUsername());
                preparedStatement.setString(2,user.getFullName());
                preparedStatement.setString(3,user.getIdCard());
                preparedStatement.setString(4,user.getBirthday());
                preparedStatement.setBoolean(5,user.isGender());
                preparedStatement.setString(6, user.getPhone());
                preparedStatement.setString(7, user.getEmail());
                preparedStatement.setInt(8,user.getId());
                preparedStatement.executeUpdate();
            } else {
                preparedStatement=connection.prepareStatement(UPDATE_USER);
                preparedStatement.setString(1,user.getUsername());
                preparedStatement.setString(2,user.getFullName());
                preparedStatement.setString(3,user.getIdCard());
                preparedStatement.setString(4,user.getBirthday());
                preparedStatement.setBoolean(5,user.isGender());
                preparedStatement.setString(6, user.getPhone());
                preparedStatement.setString(7, user.getEmail());
                preparedStatement.setInt(8,user.getId());
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkUsernameExits(String username) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkExitsByUsernameAndPassword(String username, String password) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME_PASSWORD);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectByUsername(String username) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int userId = resultSet.getInt("user_id");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                String full_name = resultSet.getString("full_name");
                String idCard = resultSet.getString("id_card");
                String birthday = resultSet.getString("birthday");
                boolean gender = resultSet.getBoolean("gender");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                user = new User(userId,userName,password,full_name,idCard,birthday,gender,phone,email,role);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public void deleteUser(int id) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_USER);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
