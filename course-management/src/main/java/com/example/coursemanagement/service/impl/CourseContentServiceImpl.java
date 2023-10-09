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
    public List<CourseContent> showListE(int currentPage) {
        return null;
    }

    @Override
    public void saveE(CourseContent courseContent) {
        courseContentIRepository.saveE(courseContent);
    }

    @Override
    public CourseContent selectE(int id) {
        return courseContentIRepository.selectE(id);
    }

    @Override
    public boolean deleteE(int id) {
        return courseContentIRepository.deleteE(id);
    }

    @Override
    public boolean updateE(int id, CourseContent course) {
        return courseContentIRepository.updateE(id,course);
    }

    @Override
    public void updateE(CourseContent courseContent) {

    }

    @Override
    public List<CourseContent> selectByCourseId(int id) {
        return courseContentIRepository.selectByCourseId(id);
    }

    @Override
    public CourseContent selectByDetailContentId(int idDetailContent) {
        return courseContentIRepository.selectByDetailContentId(idDetailContent);
    }
}
