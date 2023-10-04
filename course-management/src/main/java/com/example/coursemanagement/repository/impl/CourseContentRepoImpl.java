package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.CourseContent;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseContentRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseContentRepoImpl implements ICourseContentRepo {
    private final static String SELECT = "SELECT * FROM course_content";
    private final static String SELECT_BY_ID = "SELECT * FROM course_content WHERE course_content_id = ?;";
    private final static String SELECT_BY_COURSE_ID = "SELECT * FROM course_content WHERE course_id = ?;";

    @Override
    public List<CourseContent> showListE() {
        List<CourseContent> courseContentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("course_content_id");
                String name = resultSet.getString("course_content_name");
                int courseId = resultSet.getInt("course_id");
                courseContentList.add(new CourseContent(id, name,courseId));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContentList;
    }

    @Override
    public void saveE(CourseContent courseContent) {

    }

    @Override
    public CourseContent selectE(int id) {
        CourseContent courseContent;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.getResultSet();
            courseContent = new CourseContent(
                    resultSet.getInt("course_category_id"),
                    resultSet.getString("course_category_name"),
                    resultSet.getInt("course_id")
                    );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContent;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseContent course) {
        return false;
    }

    @Override
    public void updateE(CourseContent courseContent) {

    }

    @Override
    public List<CourseContent> selectByCourseId(int id) {
        List<CourseContent> courseContents = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_COURSE_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idValue = resultSet.getInt("course_content_id");
                String name = resultSet.getString("course_content_name");
                int courseId = resultSet.getInt("course_id");
                courseContents.add(new CourseContent(idValue,name,courseId));
            }
            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContents;
    }
}
