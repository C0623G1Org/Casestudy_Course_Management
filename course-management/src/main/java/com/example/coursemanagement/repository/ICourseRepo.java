package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.Course;

import java.util.List;

public interface ICourseRepo {
    List<Course> showList ();
    void saveCourse(Course course);
    Course selectCourse(int id);
    boolean deleteCourse(int id);
    boolean updateCourse(int id, Course course);
    List<Course> findByNameCourse(String nameCourse);
}
