package com.example.coursemanagement.repository.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.repository.BaseRepository;
import com.example.coursemanagement.repository.ICourseRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseRepoImpl implements ICourseRepo {


    private final static String SELECT = "SELECT * FROM courses";
    private final static String SELECT_BY_ID = "SELECT * FROM courses WHERE course_id = ?;";

    private final static String UPDATE_COURSE = "UPDATE courses SET course_name = ?, short_description = ?, price =?, knowledge =?, requirements =?, instructor =?, course_inclusion =?, course_level_id =? WHERE course_id = ?;";
    private final static String INSERT_COURSE = "INSERT INTO courses (course_name, short_description, price, knowledge, requirements, instructor , course_inclusion, course_level_id) VALUES (?,?,?,?,?,?,?,?);";
    private final static String SELECT_FULL = "SELECT * FROM courses c JOIN course_content cct ON c.course_content_id = cct.course_content_id JOIN course_levels ccc ON c.course_level_id = ccc.course_level_id WHERE c.course_level_id = ?;";
    private final static String SELECT_BY_USER_BY = "select c.* from courses c JOIN course_orders co ON c.course_id = co.course_id JOIN user u ON co.user_id = u.user_id WHERE u.user_id = ?;";
    @Override
    public List<Course> showList() {
        List<Course> courseList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                int course_id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String description = resultSet.getString("short_description");
                String instructor = resultSet.getString("instructor");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("course_level_id");
                String knowledge = resultSet.getString("knowledge");
                String device_requirements = resultSet.getString("requirements");
                String course_other_info = resultSet.getString("course_inclusion");
                courseList.add(new Course(course_id,name,description,instructor,price, categoryId,
                        knowledge,device_requirements,course_other_info));
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseList;
    }

    @Override
    public void saveCourse(Course course) {
        Connection connection = BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURSE);
            preparedStatement.setString(1, course.getName());
            preparedStatement.setString(2, course.getDescription());
            preparedStatement.setDouble(3, course.getPrice());
            preparedStatement.setString(4,course.getKnowledge());
            preparedStatement.setString(5,course.getRequirements());
            preparedStatement.setString(6,course.getInstructor());
            preparedStatement.setString(7,course.getCourseInclusion());
            preparedStatement.setInt(8,course.getCourseLevelId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e){
            throw new RuntimeException();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public Course selectCourse(int id) {
        Course course = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int course_id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String description = resultSet.getString("short_description");
                String instructor = resultSet.getString("instructor");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("course_level_id");
                String knowledge = resultSet.getString("knowledge");
                String device_requirements = resultSet.getString("requirements");
                String course_other_info = resultSet.getString("course_inclusion");
                course = new Course(course_id,name,description,instructor,price, categoryId,knowledge,device_requirements,course_other_info);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return course;
    }

    @Override
    public boolean deleteCourse(int id) {
        return false;
    }

    @Override
    public boolean updateCourse(int id, Course course) {
        if (selectCourse(id) == null) {
            return false;
        } else {
            Connection connection = BaseRepository.getConnection();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COURSE);
                preparedStatement.setString(1, course.getName());
                preparedStatement.setString(2, course.getDescription());
                preparedStatement.setDouble(3, course.getPrice());
                preparedStatement.setString(4,course.getKnowledge());
                preparedStatement.setString(5,course.getRequirements());
                preparedStatement.setString(6,course.getInstructor());
                preparedStatement.setString(7,course.getCourseInclusion());
                preparedStatement.setInt(8,course.getCourseLevelId());
                preparedStatement.setInt(9,id);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException();
            }
            return true;
        }
    }

    @Override
    public List<Course> findByNameCourse(String nameCourse) {
        return null;
    }

    @Override
    public List<Course> selectByUserBuy(int idUser) {
        List<Course> courseList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USER_BY);
            preparedStatement.setInt(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int course_id = resultSet.getInt("course_id");
                String name = resultSet.getString("course_name");
                String description = resultSet.getString("short_description");
                String instructor = resultSet.getString("instructor");
                double price = resultSet.getDouble("price");
                int categoryId = resultSet.getInt("course_level_id");
                String knowledge = resultSet.getString("knowledge");
                String device_requirements = resultSet.getString("requirements");
                String course_other_info = resultSet.getString("course_inclusion");
                courseList.add(new Course(course_id,name,description,instructor,price, categoryId,knowledge,device_requirements,course_other_info));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseList;
    }
}
