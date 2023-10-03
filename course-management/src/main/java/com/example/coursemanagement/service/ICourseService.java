package com.example.coursemanagement.service;

import com.example.coursemanagement.model.Course;

import java.util.List;

public interface ICourseService {
    List<Course> showList ();
    void saveCourse(Course course);
    Course selectCourse(int id);
    boolean deleteCourse(int id);
    boolean updateCourse(int id, Course course);
    List<Course> findByNameCourse(String nameCourse);
    List<Course> selectByUserBuy(int idUser);
}
