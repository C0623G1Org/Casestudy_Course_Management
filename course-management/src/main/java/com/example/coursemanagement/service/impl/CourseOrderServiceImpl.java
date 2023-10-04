package com.example.coursemanagement.service.impl;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;
import com.example.coursemanagement.repository.ICourseOrderRepo;
import com.example.coursemanagement.repository.impl.CourseOrderRepoImpl;
import com.example.coursemanagement.service.ICourseOrderService;

import java.util.List;

public class CourseOrderServiceImpl implements ICourseOrderService {
    private final ICourseOrderRepo courseOrderRepo = new CourseOrderRepoImpl();

    @Override
    public List<CourseOrderInf> showCourseOrder() {
        return courseOrderRepo.showCourseOrder();
    }

    @Override
    public CourseOrderInf showDetailOrderById(int id) {
        return courseOrderRepo.showDetailOrderById(id);
    }
}
