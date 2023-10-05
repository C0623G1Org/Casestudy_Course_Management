package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICoursePurchaseRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CoursePurchaseRepoImpl implements ICoursePurchaseRepo {
    private final static String SELECT_BY_ID = "SELECT course_id, course_name, short_description, price \n" +
            " FROM courses WHERE course_id = ?;";

    @Override
    public Course displayCourse(int id) {
        Connection connection = BaseRepository.getConnection();
        Course course = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int course_id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String description = resultSet.getString("short_description");
                double price = resultSet.getDouble("price");
                course = new Course(course_id,name,description,price);
            }
//            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return course;
    }

}
