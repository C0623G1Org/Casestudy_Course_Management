package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseOrderRepo;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.UserServiceImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CourseOrderRepoImpl implements ICourseOrderRepo {
    private final ICourseService courseService = new CourseServiceImpl();
    private final IUserService userService = new UserServiceImpl();

    private static final String SELECT_AD_ORDER = "SELECT order_id, order_code, `status`, order_date, order_price, co.user_id, co.course_id, course_name, full_name\n" +
            "FROM course_orders co\n" +
            "LEFT JOIN courses c ON c.course_id = co.course_id\n" +
            "LEFT JOIN `user` u ON u.user_id = co.user_id\n";

    private static final String SELECT_ORDER_BY_DATE = "SELECT order_id, order_code, `status`, order_date, order_price, co.user_id, co.course_id, course_name, full_name\n" +
            "FROM course_orders co\n" +
            "LEFT JOIN courses c ON c.course_id = co.course_id\n" +
            "LEFT JOIN `user` u ON u.user_id = co.user_id\n" +
            "WHERE order_date = ?;";
    private static final String SELECT_ORDER = "SELECT order_id, order_code, `status`, order_date, order_price, co.user_id, co.course_id, course_name, full_name\n" +
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
            "VALUES (?,?,?,?,?,'pending');";
    private static final String GET_BY_USER_BUY = "SELECT co.* from courses c JOIN course_orders co ON c.course_id = co.course_id AND co.status = 'success' JOIN user u ON co.user_id = u.user_id WHERE u.user_id = ?;";
    private static final String GET_ORDER_BY_USER_COURSE = "select co.* from courses c JOIN course_orders co ON c.course_id = co.course_id AND co.status = 'success' JOIN user u ON co.user_id = u.user_id WHERE u.user_id = ? AND c.course_id = ?;";
    private static final String GET_ORDER_DATE_NOW = "SELECT * FROM course_orders where order_date = CURDATE();";
    private static final String UPDATE_STATUS = "UPDATE course_orders SET `status` = ? WHERE order_code = ?;";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM course_orders WHERE order_id = ?;";

    private static final String DELETE_ORDER = "DELETE FROM course_orders \n" +
            "WHERE order_id = ?;";


    @Override
    public List<CourseOrderInf> showCourseOrder() {
        Connection connection = BaseRepository.getConnection();
        List<CourseOrderInf> courseOrderInfs = new ArrayList<>();
        CourseOrderInf courseOrderInf = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ORDER);
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
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setString(1, courseOrder.getOrderDate());
            preparedStatement.setDouble(2, courseOrder.getOrderPrice());
            preparedStatement.setInt(3, courseOrder.getUser().getId());
            preparedStatement.setInt(4, courseOrder.getCourse().getId());
            preparedStatement.setInt(5, courseOrder.getOrderCode());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<CourseOrder> selectByUserBuy(int idUser) {
        List<CourseOrder> OrderList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_USER_BUY);
            preparedStatement.setInt(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int orderCode = resultSet.getInt("order_code");
                String status = resultSet.getString("status");
                String orderDate = resultSet.getString("order_date");
                double price = resultSet.getDouble("order_price");
                User user = userService.selectE(resultSet.getInt("user_id"));
                Course course = courseService.selectCourse(resultSet.getInt("course_id"));
                OrderList.add(new CourseOrder(orderId, orderDate, price, user, course, orderCode, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return OrderList;
    }

    @Override
    public boolean checkIdBuyCourse(int idUser, int idCourse) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_USER_COURSE);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idCourse);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<CourseOrder> getOrderByDateNow() {
        Connection connection = BaseRepository.getConnection();
        List<CourseOrder> courseOrders = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ORDER_DATE_NOW);
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                double orderPrice = resultSet.getDouble("order_price");
                int orderCode = resultSet.getInt("order_code");
                String status = resultSet.getString("status");
                String orderDate = resultSet.getString("order_date");
                int userId = resultSet.getInt("user_id");
                int courseId = resultSet.getInt("course_id");
                User user = userService.selectE(userId);
                Course course = courseService.selectCourse(courseId);
                courseOrders.add(new CourseOrder(orderId, orderDate, orderPrice, user, course, orderCode, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseOrders;
    }

    @Override
    public CourseOrder showOrderById(int idOrder) {
        Connection connection = BaseRepository.getConnection();
        CourseOrder courseOrder = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_ID);
            preparedStatement.setInt(1,idOrder);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                double orderPrice = resultSet.getDouble("order_price");
                int orderCode = resultSet.getInt("order_code");
                String status = resultSet.getString("status");
                String orderDate = resultSet.getString("order_date");
                int userId = resultSet.getInt("user_id");
                int courseId = resultSet.getInt("course_id");
                User user = userService.selectE(userId);
                Course course = courseService.selectCourse(courseId);
                courseOrder = new CourseOrder(orderId, orderDate, orderPrice, user, course, orderCode, status);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseOrder;
    }

    @Override
    public void deleteOrder(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateStatusDone(int idOrder) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS);
            preparedStatement.setInt(2, idOrder);
            preparedStatement.setString(1, "success");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateStatusCancel(int idOrder) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS);
            preparedStatement.setInt(2, idOrder);
            preparedStatement.setString(1, "cancel");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
