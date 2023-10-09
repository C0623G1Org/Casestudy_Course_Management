package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.CourseContentType;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.IContentType;
import com.example.coursemanagement.repository.IRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseContentTypeRepoImpl implements IRepository<CourseContentType> {
    private final static String SELECT = "SELECT * FROM content_types";
    private final static String SELECT_PAGINATION = "SELECT * FROM content_types ORDER BY content_type_id LIMIT ?,10;";
    private final static String SELECT_BY_ID = "SELECT * FROM content_types WHERE content_type_id = ?;";


    @Override
    public List<CourseContentType> showListE() {
        List<CourseContentType> courseContentTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("content_type_id");
                String name = resultSet.getString("content_type_name");
                courseContentTypes.add(new CourseContentType(id, name));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContentTypes;
    }

    @Override
    public List<CourseContentType> showListE(int currentPage) {
        List<CourseContentType> courseContentTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAGINATION);
            preparedStatement.setInt(1, (currentPage - 1) * 10);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("content_type_id");
                String name = resultSet.getString("content_type_name");
                courseContentTypes.add(new CourseContentType(id, name));
            }
            resultSet.close();;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContentTypes;
    }

    @Override
    public void saveE(CourseContentType courseContentType) {

    }

    @Override
    public CourseContentType selectE(int id) {
        CourseContentType courseContentType;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.getResultSet();
            courseContentType = new CourseContentType(
                    resultSet.getInt("content_type_id"),
                    resultSet.getString("content_type_name"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContentType;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseContentType course) {
        return false;
    }

    @Override
    public void updateE(CourseContentType courseContentType) {

    }
}
