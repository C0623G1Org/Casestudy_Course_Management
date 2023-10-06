package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;

import java.util.List;

public interface ICourseOrderRepo {
    List<CourseOrderInf> showCourseOrder();

    CourseOrderInf showDetailOrderById(int id);

    void createOrder (CourseOrder courseOrder);
    List<CourseOrder> selectByUserBuy(int idUser);
    boolean checkIdBuyCourse(int idUser, int idCourse);

}
