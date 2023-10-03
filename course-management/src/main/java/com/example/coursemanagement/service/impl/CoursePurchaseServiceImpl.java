package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.repository.ICoursePurchaseRepo;
import com.example.coursemanagement.repository.impl.CoursePurchaseRepoImpl;
import com.example.coursemanagement.service.ICoursePurchaseService;

public class CoursePurchaseServiceImpl implements ICoursePurchaseService {
    private final ICoursePurchaseRepo coursePurchaseRepo = new CoursePurchaseRepoImpl();

    @Override
    public Course displayCourse(int id) {
        return coursePurchaseRepo.displayCourse(id);
    }
}
