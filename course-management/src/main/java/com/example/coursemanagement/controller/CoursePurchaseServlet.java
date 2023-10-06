package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseOrder;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.ICourseOrderService;
import com.example.coursemanagement.service.ICoursePurchaseService;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.CourseOrderServiceImpl;
import com.example.coursemanagement.service.impl.CoursePurchaseServiceImpl;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "coursePurchaseServlet", value = "/course-purchase-servlet")
public class CoursePurchaseServlet extends HttpServlet {
    private final ICoursePurchaseService coursePurchaseService = new CoursePurchaseServiceImpl();
    private final ICourseOrderService courseOrderService = new CourseOrderServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    private final ICourseService courseService = new CourseServiceImpl();
    private final LocalDate localDate = LocalDate.now();
    private int orderCode = (int) (Math.random() * 10001) + 10000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "buy_course":

                    showCourseInf(request, response);
                    break;
            }
    }

    private void showCourseInf(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = coursePurchaseService.displayCourse(id);
        request.setAttribute("course", course);
        request.setAttribute("code", orderCode);
        request.setAttribute("localDate", localDate);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/buy-course.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

//        if (user == null) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            response.sendRedirect("/course/detail?id=" + id);
//        } else {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "buy_course":

                    showCourseInf(request, response);
                    break;
                case "check-out":
                    showCheckoutPage(request, response);
                    break;
            }
//        }

//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "check-out":
//                showCheckoutPage(request, response);
//                break;
//
//        }
    }

    private void showCheckoutPage(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = coursePurchaseService.displayCourse(id);
        request.setAttribute("course", course);
        request.setAttribute("code", orderCode);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/check-out.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) {
        String orderDate = String.valueOf(localDate);
        double orderPrice = Double.parseDouble(request.getParameter("orderPrice"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        User user = userService.selectE(userId);
        Course course = courseService.selectCourse(courseId);
//        String status = request.getParameter("status");
        courseOrderService.createOrder(new CourseOrder(orderDate, orderPrice, user, course, orderCode));
        try {
            response.sendRedirect("/course-purchase-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
