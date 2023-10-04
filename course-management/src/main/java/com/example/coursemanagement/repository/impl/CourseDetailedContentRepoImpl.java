package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.CourseDetailedContent;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseDetailRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDetailedContentRepoImpl implements ICourseDetailRepo {
    private final static String SELECT = "SELECT * FROM detailed_course_content";
    private final static String SELECT_BY_ID = "SELECT * FROM detailed_course_content WHERE detailed_course_content_id = ?;";
    private final static String SELECT_BY_COURSE_CONTENT_ID = "SELECT * FROM detailed_course_content WHERE detailed_course_content_id = ?;";
    @Override
    public List<CourseDetailedContent> showListE() {
        List<CourseDetailedContent> detailedContents = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int detailed_content_id = resultSet.getInt("detailed_course_content_id");
                String content_title = resultSet.getString("content_title");
                String content = resultSet.getString("content");
                String idVideo = resultSet.getString("url_video_id");
                int courseContentId = resultSet.getInt("course_content_id");
                int courseContentTypeId = resultSet.getInt("content_type_id");
                detailedContents.add(new CourseDetailedContent(detailed_content_id, content_title,content,idVideo,courseContentId,courseContentTypeId));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return detailedContents;
    }

    @Override
    public void saveE(CourseDetailedContent courseDetailedContent) {

    }

    @Override
    public CourseDetailedContent selectE(int id) {
        CourseDetailedContent detailedContent;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.getResultSet();
            int detailed_content_id = resultSet.getInt("detailed_course_content_id");
            String content_title = resultSet.getString("content_title");
            String content = resultSet.getString("content");
            String idVideo = resultSet.getString("url_video_id");
            int courseContentId = resultSet.getInt("course_content_id");
            int courseContentTypeId = resultSet.getInt("content_type_id");
            detailedContent = new CourseDetailedContent(detailed_content_id, content_title,content,idVideo,courseContentId,courseContentTypeId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return detailedContent;
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseDetailedContent course) {
        return false;
    }

    @Override
    public List<CourseDetailedContent> selectByCourseContentId(int id) {
        List<CourseDetailedContent> detailedContents = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_COURSE_CONTENT_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int detailed_content_id = resultSet.getInt("detailed_course_content_id");
                String content_title = resultSet.getString("content_title");
                String content = resultSet.getString("content");
                String idVideo = resultSet.getString("url_video_id");
                int courseContentId = resultSet.getInt("course_content_id");
                int courseContentTypeId = resultSet.getInt("content_type_id");
                detailedContents.add(new CourseDetailedContent(detailed_content_id, content_title, content, idVideo, courseContentId, courseContentTypeId));
            }
            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return detailedContents;

    }
}
