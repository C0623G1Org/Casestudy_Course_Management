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


@WebServlet(name = "coursePurchaseServlet", value = {
        "/order-course",
        "/checkout",
        "/checkout/success",
        "/checkout/cancel"
})
public class CoursePurchaseServlet extends HttpServlet {
    private final ICoursePurchaseService coursePurchaseService = new CoursePurchaseServiceImpl();
    private final ICourseOrderService courseOrderService = new CourseOrderServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    private final ICourseService courseService = new CourseServiceImpl();
    private final LocalDate localDate = LocalDate.now();
    private int orderCode;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setCharacterEncoding("UTF-8");
            String url = request.getRequestURI();
            if (url.endsWith("/order-course")) {
                showCourseInf(request, response);
            } else if (url.endsWith("/checkout/success")) {
                updateStatusSuccess(request,response);
            } else if (url.endsWith("/checkout/cancel")) {
                updateStatusCancel(request,response);
            }
        }
    }

    private void updateStatusCancel(HttpServletRequest request, HttpServletResponse response) {
        int codeOrder = Integer.parseInt(request.getParameter("id"));
        courseOrderService.updateStatusCancel(codeOrder);
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateStatusSuccess(HttpServletRequest request, HttpServletResponse response) {
        int codeOrder = Integer.parseInt(request.getParameter("id"));
        int idCourse = Integer.parseInt(request.getParameter("course-id"));
        courseOrderService.updateStatusDone(codeOrder);
        try {
            response.sendRedirect("/learn?id="+idCourse);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCourseInf(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        orderCode = (int) (Math.random() * 20001) + 10000;
        Course course = courseService.selectCourse(id);
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setCharacterEncoding("UTF-8");
            String url = request.getRequestURI();
            if (url.endsWith("/checkout")) {
                showCheckoutPage(request, response);
            }
        }
    }

    private void showCheckoutPage(HttpServletRequest request, HttpServletResponse response) {
        int idCourse = Integer.parseInt(request.getParameter("id-course"));
        int idUser = Integer.parseInt(request.getParameter("id-user"));
        int orderCode = Integer.parseInt(request.getParameter("code-order"));
        String orderDate = request.getParameter("date-order");
        double orderPrice = Double.parseDouble(request.getParameter("price-order"));
        Course course = coursePurchaseService.displayCourse(idCourse);
        User user = userService.selectE(idUser);

        CourseOrder courseOrder = new CourseOrder(orderDate,orderPrice,user,course,orderCode);
        courseOrderService.createOrder(courseOrder);
        request.setAttribute("course", course);
        request.setAttribute("courseOrder", courseOrder);
//        request.setAttribute("code", orderCode);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/check-out.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void doPagination(HttpServletRequest request, HttpServletResponse response) {
        int count = courseOrderService.countOrdersAmount();
        int endPage = count/10;
        if (count % 10 != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard/dashboard-admin-manage-course.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
