package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                List<Course> courseList = courseService.showList();
                request.setAttribute("courseList",courseList);
                request.setAttribute("user",user);
                dispatcherData(request, response,"/dashboard/dashboard-admin.jsp");
            } else {
                dispatcherData(request, response,"/dashboard/dashboard-user.jsp");
            }
        }
    }

    private static void dispatcherData(HttpServletRequest request, HttpServletResponse response, String path) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
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

    }
}