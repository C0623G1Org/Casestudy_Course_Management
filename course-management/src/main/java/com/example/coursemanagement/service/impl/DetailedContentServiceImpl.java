package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.CourseDetailedContent;
import com.example.coursemanagement.repository.ICourseDetailRepo;
import com.example.coursemanagement.repository.impl.CourseDetailedContentRepoImpl;
import com.example.coursemanagement.service.ICourseDetailContentService;

import java.util.List;

public class DetailedContentServiceImpl implements ICourseDetailContentService {
    private final ICourseDetailRepo courseDetailedContentIRepository = new CourseDetailedContentRepoImpl();
    @Override
    public List<CourseDetailedContent> showListE() {
        return courseDetailedContentIRepository.showListE();
    }

    @Override
    public void saveE(CourseDetailedContent courseDetailedContent) {

    }

    @Override
    public CourseDetailedContent selectE(int id) {
        return courseDetailedContentIRepository.selectE(id);
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
        return courseDetailedContentIRepository.selectByCourseContentId(id);
    }
}
