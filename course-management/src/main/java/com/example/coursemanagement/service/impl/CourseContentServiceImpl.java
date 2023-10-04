package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.CourseContent;
import com.example.coursemanagement.repository.ICourseContentRepo;
import com.example.coursemanagement.repository.impl.CourseContentRepoImpl;
import com.example.coursemanagement.service.ICourseContentService;

import java.util.List;

public class CourseContentServiceImpl implements ICourseContentService {
    private final ICourseContentRepo courseContentIRepository = new CourseContentRepoImpl();
    @Override
    public List<CourseContent> showListE() {
        return courseContentIRepository.showListE();
    }

    @Override
    public void saveE(CourseContent courseContent) {

    }

    @Override
    public CourseContent selectE(int id) {
        return courseContentIRepository.selectE(id);
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
        return courseContentIRepository.selectByCourseId(id);
    }
}
