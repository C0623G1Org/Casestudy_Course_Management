package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.CourseCategory;
import com.example.coursemanagement.repository.impl.CourseCategoryRepoImpl;
import com.example.coursemanagement.service.ICourseLevelService;
import com.example.coursemanagement.service.IService;

import java.util.List;

public class CourseCategoryServiceImpl implements ICourseLevelService {
    private final CourseCategoryRepoImpl categoryRepo = new CourseCategoryRepoImpl();
    @Override
    public List<CourseCategory> showListE() {
        return categoryRepo.showListE();
    }

    @Override
    public List<CourseCategory> showListE(int currentPage) {
        return categoryRepo.showListE(currentPage);
    }

    @Override
    public void saveE(CourseCategory courseCategory) {

    }

    @Override
    public CourseCategory selectE(int id) {
        return categoryRepo.selectE(id);
    }

    @Override
    public boolean deleteE(int id) {
        return false;
    }

    @Override
    public boolean updateE(int id, CourseCategory course) {
        return false;
    }

    @Override
    public void updateE(CourseCategory courseCategory) {

    }
}
