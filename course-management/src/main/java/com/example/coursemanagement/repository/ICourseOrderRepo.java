package com.example.coursemanagement.repository;

import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.CourseOrderInf;

import java.util.List;

public interface ICourseOrderRepo {
    List<CourseOrderInf> showCourseOrder();

    CourseOrderInf showDetailOrderById(int id);

    void createOrder (CourseOrder courseOrder);

    void updateStatusDone (int id, CourseOrder courseOrder);

    void updateStatusCancel (int id, CourseOrder courseOrder);


}
