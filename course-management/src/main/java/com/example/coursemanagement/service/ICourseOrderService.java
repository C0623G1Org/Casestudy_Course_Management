package com.example.coursemanagement.service;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;

import java.util.List;

public interface ICourseOrderService {
    List<CourseOrderInf> showCourseOrder();

    CourseOrderInf showDetailOrderById(int id);

    void createOrder (CourseOrder courseOrder);

    void updateStatusDone (int id, CourseOrder courseOrder);

    void updateStatusCancel (int id, CourseOrder courseOrder);
    List<CourseOrder> selectByUserBuy(int idUser);
    boolean checkIdBuyCourse(int idUser, int idCourse);
}
