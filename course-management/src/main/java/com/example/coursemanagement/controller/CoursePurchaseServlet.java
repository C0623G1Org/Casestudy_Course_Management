package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.ICoursePurchaseService;
import com.example.coursemanagement.service.impl.CoursePurchaseServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "coursePurchaseServlet", value = "/course-purchase-servlet")
public class CoursePurchaseServlet extends HttpServlet {
    private final ICoursePurchaseService coursePurchaseService = new CoursePurchaseServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            int id = Integer.parseInt(request.getParameter("id"));
            response.sendRedirect("/course/detail?id="+id);
        } else {
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
    }

    private void showCourseInf(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = coursePurchaseService.displayCourse(id);
        request.setAttribute("course", course);
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "check-out":
                showCheckoutPage(request, response);
                break;

        }
    }

    private void showCheckoutPage(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = coursePurchaseService.displayCourse(id);
        int code = (int) (Math.random() * 10001) + 10000;

        request.setAttribute("course", course);
        request.setAttribute("code", code);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/check-out.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
