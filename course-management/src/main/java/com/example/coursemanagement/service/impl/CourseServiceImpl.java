package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.repository.ICourseRepo;
import com.example.coursemanagement.repository.impl.CourseRepoImpl;
import com.example.coursemanagement.service.ICourseService;

import java.util.List;

public class CourseServiceImpl implements ICourseService {
    private final ICourseRepo courseRepo = new CourseRepoImpl();
    @Override
    public List<Course> showList() {
        return courseRepo.showList();
    }

    @Override
    public void saveCourse(Course course) {
        courseRepo.saveCourse(course);
    }

    @Override
    public Course selectCourse(int id) {
        return courseRepo.selectCourse(id);
    }

    @Override
    public boolean deleteCourse(int id) {
        return courseRepo.deleteCourse(id);
    }

    @Override
    public boolean updateCourse(int id, Course course) {
        return courseRepo.updateCourse(id,course);
    }

    @Override
    public List<Course> findByNameCourse(String nameCourse) {
        return courseRepo.findByNameCourse(nameCourse);
    }

    @Override
    public List<Course> selectByUserBuy(int idUser) {
        return courseRepo.selectByUserBuy(idUser);
    }

    @Override
    public List<Course> searchByNameAndInstructor(String nameSearch, String instructorSearch) {
        return courseRepo.searchByNameAndInstructor(nameSearch,instructorSearch);
    }
}
