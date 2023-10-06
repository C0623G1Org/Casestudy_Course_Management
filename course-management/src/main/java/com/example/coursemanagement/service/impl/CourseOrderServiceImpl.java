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

    @Override
    public void createOrder(CourseOrder courseOrder) {
        courseOrderRepo.createOrder(courseOrder);
    }

    @Override
    public List<CourseOrder> selectByUserBuy(int idUser) {
        return courseOrderRepo.selectByUserBuy(idUser);
    }

    @Override
    public boolean checkIdBuyCourse(int idUser, int idCourse) {
        return courseOrderRepo.checkIdBuyCourse(idUser,idCourse);
    }

    @Override
    public void updateStatusDone(int id, CourseOrder courseOrder) {
        courseOrderRepo.updateStatusDone(id, courseOrder);
    }

    @Override
    public void updateStatusCancel(int id, CourseOrder courseOrder) {
        courseOrderRepo.updateStatusCancel(id, courseOrder);
    }


}
