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
import java.util.Date;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = {"/dashboard", "/dashboard/course", "/dashboard/member", "/dashboard/order"
        ,"/dashboard/update","/dashboard/password","/dashboard/member/edit","/dashboard/member/view"})
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
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/member/edit")) {
                    showPageMemberEdit(request, response, user);
                }if (url.endsWith("/dashboard/member/view")) {
                    showPageMemberView(request, response, user);
                } else if (url.endsWith("/dashboard/member")) {
                    showPageManageMember(request, response, user);
                } else if (url.endsWith("/dashboard/course")) {
                    showPageManageCourse(request, response, user);
                }  else if (url.endsWith("/dashboard/order")) {
                    showPageManageOrder(request, response, user);
                }  else {
                    getListCourseAdmin(request, response, user);
                }
            } else {
                String url=request.getRequestURI();
                if (url.endsWith("/dashboard/update")) {
                    showPageUpdateUser(request, response, user);
                } else if (url.endsWith("/dashboard/password")) {
                    showPageUpdatePassword(request, response, user);
                }  else {
                    getCourseUserBuy(request, response, user);
                }
            }
        }
    }

    // ADMIN
    private void showPageMemberEdit(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("admin",user.getFullName());
        int id= Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user",userService.selectE(id));
        dispatcherData(request, response, "/dashboard/dashboard-admin-edit.jsp");
    }private void showPageMemberView(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("admin",user.getFullName());
        int id= Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user",userService.selectE(id));
        dispatcherData(request, response, "/dashboard/dashboard-admin-view.jsp");
    }

    private void getListCourseAdmin(HttpServletRequest request, HttpServletResponse response, User user) {
        List<Course> courseList = courseService.showList();
        request.setAttribute("courseList", courseList);
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin.jsp");
    }

    private void showPageManageCourse(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-course.jsp");
    }

    private void showPageManageMember(HttpServletRequest request, HttpServletResponse response, User user) {
        List<User> list = userService.showListE();
        request.setAttribute("list", list);
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-member.jsp");
    }

    private void showPageManageOrder(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-order.jsp");
    }

    // Customer
    private void showPageUpdateUser(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-user-edit.jsp");
    }

    private void showPageUpdatePassword(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-user-password.jsp");
    }

    private void getCourseUserBuy(HttpServletRequest request, HttpServletResponse response, User user) {
        int id = user.getId();
        List<Course> listCourseUserBuy = courseService.selectByUserBuy(id);
        request.setAttribute("user", user);
        request.setAttribute("listCourseUserBuy", listCourseUserBuy);
        dispatcherData(request, response, "/dashboard/dashboard-user.jsp");
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                List<Course> courseList = courseService.showList();
                request.setAttribute("courseList", courseList);
                request.setAttribute("user", user);
                dispatcherData(request, response, "/dashboard/dashboard-admin.jsp");
            } else {
                String action = request.getParameter("action");
                if (action == null) {
                    action = "";
                }
                switch (action) {
                    case "update":
                        updateUser(request, response);
                        break;
                    default:
                        break;

                }

            }
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
//        Date birthday=request.getParameter("birthday");
//        boolean gender=request.getParameter("gender");
        String email = request.getParameter("email");
        String idCard = request.getParameter("idCard");
        String birthday = request.getParameter("birthday");
//        User user=new User(id, username, fullName,idCard,birthday,true,phone,email)
    }
}