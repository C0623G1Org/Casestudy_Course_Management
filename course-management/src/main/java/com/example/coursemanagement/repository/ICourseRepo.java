package com.example.coursemanagement.repository;


import com.example.coursemanagement.model.Course;

import java.util.List;

public interface ICourseRepo {
    List<Course> showList ();
    List<Course> showList (int currentPage);
    void saveCourse(Course course);
    Course selectCourse(int id);
    boolean deleteCourse(int id);
    boolean updateCourse(int id, Course course);
    List<Course> findByNameCourse(String nameCourse);
    List<Course> selectByUserBuy(int idUser);
    List<Course> searchByNameAndInstructor(String nameSearch, String instructorSearch);
    int countCoursesAmount ();
}
