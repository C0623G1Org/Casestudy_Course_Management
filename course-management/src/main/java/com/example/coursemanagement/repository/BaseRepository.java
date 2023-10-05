package com.example.coursemanagement.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/course_management_ver2";
    private static final String USERNAME = "root";
<<<<<<< HEAD
    private static final String PASSWORD = "123456789";
=======
    private static final String PASSWORD = "Thanhvan01@";
>>>>>>> 813fd12f44fbd14bf8d0c81fc655aa70fccabcb7

    private BaseRepository() {
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}