package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.CourseCategory;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseCategory;
import com.example.coursemanagement.repository.IRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseCategoryRepoImpl implements IRepository<CourseCategory> {
    private final static String SELECT = "SELECT * FROM course_levels";
    private final static String SELECT_BY_ID = "SELECT * FROM course_levels WHERE course_level_id = ?;";

    @Override
    public List<CourseCategory> showListE() {
        List<CourseCategory> categoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("course_level_id");
                String name = resultSet.getString("course_level_name");
                categoryList.add(new CourseCategory(id, name));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    @Override
    public void saveE(CourseCategory courseCategory) {

    }

    @Override
    public CourseCategory selectE(int id) {
        CourseCategory category;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.getResultSet();
            category = new CourseCategory(
                    resultSet.getInt("course_level_id"),
                    resultSet.getString("course_level_name"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseCategory course) {
        return false;
    }

    @Override
    public void updateE(CourseCategory courseCategory) {

    }
}
