package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseContent;
import com.example.coursemanagement.model.CourseDetailedContent;
import com.example.coursemanagement.service.ICoursePurchaseService;
import com.example.coursemanagement.service.impl.CoursePurchaseServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "coursePurchaseServlet", urlPatterns = "/course-purchase-servlet")
public class CoursePurchaseServlet extends HttpServlet {
    private final ICoursePurchaseService coursePurchaseService = new CoursePurchaseServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        showCourseInf(request, response,"/buy-course.jsp");

    }

    private void showCourseInf (HttpServletRequest request, HttpServletResponse response,String path) {
        int id = Integer.parseInt(request.getParameter("id"));

        Course course = coursePurchaseService.displayCourse(id);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
