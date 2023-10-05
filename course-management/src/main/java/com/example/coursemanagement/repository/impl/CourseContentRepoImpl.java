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
    private final static String DELETE_BY_ID = "DELETE FROM course_content where course_content_id = ?;";
    private final static String INSERT_CONTENT = "INSERT INTO course_content(course_content_name,course_id) VALUES (?,?);";
    private final static String SELECT_BY_COURSE_ID = "SELECT * FROM course_content WHERE course_id = ?;";
    private final static String SELECT_BY_DETAIL_ID = "SELECT cc.* FROM course_content cc JOIN detailed_course_content dc ON cc.course_content_id = dc.course_content_id WHERE dc.course_content_id = ?;";

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
                courseContentList.add(new CourseContent(id, name, courseId));
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
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTENT);
            preparedStatement.setString(1,courseContent.getName());
            preparedStatement.setInt(2,courseContent.getCourseId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public CourseContent selectE(int id) {
        CourseContent courseContent = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                courseContent = new CourseContent(
                        resultSet.getInt("course_content_id"),
                        resultSet.getString("course_content_name"),
                        resultSet.getInt("course_id")
                );
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContent;
    }

    @Override
    public boolean deleteE(int id) {
        if (selectE(id) ==  null) {
            return false;
        }
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
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
            while (resultSet.next()) {
                int idValue = resultSet.getInt("course_content_id");
                String name = resultSet.getString("course_content_name");
                int courseId = resultSet.getInt("course_id");
                courseContents.add(new CourseContent(idValue, name, courseId));
            }
            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContents;
    }

    @Override
    public CourseContent selectByDetailContentId(int idDetailContent) {
        CourseContent courseContent = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_COURSE_ID);
            preparedStatement.setInt(1, idDetailContent);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                courseContent = new CourseContent(
                        resultSet.getInt("course_content_id"),
                        resultSet.getString("course_content_name"),
                        resultSet.getInt("course_id")
                );
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseContent;
    }
}
