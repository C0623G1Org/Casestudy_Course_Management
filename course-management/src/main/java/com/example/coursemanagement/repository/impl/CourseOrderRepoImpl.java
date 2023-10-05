package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseOrderRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CourseOrderRepoImpl implements ICourseOrderRepo {
    private static final String SELECT_AD_ORDER = "SELECT order_id, order_code, `status`, order_date, order_price, co.user_id, co.course_id, course_name, full_name\n" +
            "FROM course_orders co\n" +
            "LEFT JOIN courses c ON c.course_id = co.course_id\n" +
            "LEFT JOIN `user` u ON u.user_id = co.user_id\n";

    private static final String SELECT_ORDER_BY_ID = "SELECT order_id, order_code, `status`, order_date, order_price, " +
            "co.user_id, co.course_id, course_name, full_name, phone, email, price, short_description\n" +
            "FROM course_orders co\n" +
            "LEFT JOIN courses c ON c.course_id = co.course_id\n" +
            "LEFT JOIN `user` u ON u.user_id = co.user_id\n" +
            "WHERE order_id = ?;";

    private static final String INSERT_ORDER = "INSERT INTO course_orders (order_date, order_price, user_id, course_id, order_code, `status`) \n" +
            "VALUES (?,?,?,?,?,?);";

    @Override
    public List<CourseOrderInf> showCourseOrder() {
        Connection connection = BaseRepository.getConnection();
        List<CourseOrderInf> courseOrderInfs = new ArrayList<>();
        CourseOrderInf courseOrderInf =null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_AD_ORDER);
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_AD_ORDER);
//            preparedStatement.setString(1, "order_date");
//            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                double orderPrice = resultSet.getDouble("order_price");
                int orderCode = resultSet.getInt("order_code");
                String status = resultSet.getString("status");
                String fullName = resultSet.getString("full_name");
                String courseName = resultSet.getString("course_name");
                courseOrderInfs.add(new CourseOrderInf(orderId, orderPrice, orderCode, status, fullName, courseName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseOrderInfs;
    }

    @Override
    public CourseOrderInf showDetailOrderById(int id) {
        Connection connection = BaseRepository.getConnection();
        CourseOrderInf courseOrderInf = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
//              int orderId = resultSet.getInt("order_id");
                double orderPrice = resultSet.getDouble("order_price");
                int orderCode = resultSet.getInt("order_code");
                String status = resultSet.getString("status");
                String fullName = resultSet.getString("full_name");
                String courseName = resultSet.getString("course_name");
                int phone = resultSet.getInt("phone");
                String email = resultSet.getString("email");
                double price = resultSet.getDouble("price");
                String shortDescription = resultSet.getString("short_description");
                courseOrderInf = new CourseOrderInf(id, orderPrice, orderCode, status, fullName, courseName, phone, email, price, shortDescription);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseOrderInf;
    }

    @Override
    public void createOrder(CourseOrder courseOrder) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setString(1, courseOrder.getOrderDate());
            preparedStatement.setDouble(2, courseOrder.getOrderPrice());
            preparedStatement.setInt(3, courseOrder.getUserId());
            preparedStatement.setInt(4, courseOrder.getCourseId());
            preparedStatement.setInt(5, courseOrder.getOrderCode());
            preparedStatement.setString(6, courseOrder.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
