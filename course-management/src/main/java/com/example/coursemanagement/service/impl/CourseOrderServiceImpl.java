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
    public List<CourseOrderInf> showCourseOrder(int currentPage) {
        return courseOrderRepo.showCourseOrder(currentPage);
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
    public List<CourseOrder> getOrderByDateNow(int currentPage) {
        return courseOrderRepo.getOrderByDateNow(currentPage);
    }

    @Override
    public CourseOrder showOrderById(int idOrder) {
        return courseOrderRepo.showOrderById(idOrder);
    }

    @Override
    public void deleteOrder(int id) {
        courseOrderRepo.deleteOrder(id);
    }

    @Override
    public int countOrdersAmount() {
        return courseOrderRepo.countOrdersAmount();
    }

    @Override
    public int countOrdersByDate() {
        return courseOrderRepo.countOrdersByDate();
    }

    @Override
    public List<CourseOrder> paginateOrders(int index) {
        return courseOrderRepo.paginateOrders(index);
    }

    @Override
    public void updateStatusDone(int idOrder) {
        courseOrderRepo.updateStatusDone(idOrder);
    }

    @Override
    public void updateStatusCancel(int idOrder) {
        courseOrderRepo.updateStatusCancel(idOrder);
    }


}
