package com.example.coursemanagement.service;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;

import java.util.List;

public interface ICourseOrderService {
    List<CourseOrderInf> showCourseOrder();

    CourseOrderInf showDetailOrderById(int id);

    void createOrder(CourseOrder courseOrder);

    void updateStatusDone(int idOrder);

    void updateStatusCancel(int idOrder);

    List<CourseOrder> selectByUserBuy(int idUser);

    boolean checkIdBuyCourse(int idUser, int idCourse);

    List<CourseOrder> getOrderByDateNow();

    CourseOrder showOrderById(int idOrder);

    void deleteOrder (int id);
}
