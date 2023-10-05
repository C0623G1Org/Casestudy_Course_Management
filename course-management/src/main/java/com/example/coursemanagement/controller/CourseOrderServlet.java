package com.example.coursemanagement.controller;


import com.example.coursemanagement.model.CourseOrderInf;
import com.example.coursemanagement.service.ICourseOrderService;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.impl.CourseOrderServiceImpl;
import com.example.coursemanagement.service.impl.CourseServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "courseOrderServlet", value = "/course-order-servlet")
public class CourseOrderServlet extends HttpServlet {
//    @Override
//    public void init() throws ServletException {
//        System.out.println("abc");
//    }

    private final ICourseOrderService courseOrderService = new CourseOrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "show_detail_order":
                showDetailOrder(request, response);
                break;
            default:
                showCourseOrder(request, response);
        }
    }


    private void showCourseOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CourseOrderInf> courseOrderInfList = courseOrderService.showCourseOrder();
        request.setAttribute("courseOrderInfList", courseOrderInfList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard/dashboard-admin.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDetailOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        CourseOrderInf courseOrderInf = courseOrderService.showDetailOrderById(orderId);
        request.setAttribute("courseOrderInf", courseOrderInf);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("detailed-course-order.jsp");
        requestDispatcher.forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void createOrder (HttpServletRequest request, HttpServletResponse response) {
    }


}
