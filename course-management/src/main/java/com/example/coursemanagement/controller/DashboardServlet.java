package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.*;
import com.example.coursemanagement.repository.IContentType;
import com.example.coursemanagement.service.ICourseContentService;
import com.example.coursemanagement.service.ICourseDetailContentService;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(
        name = "DashboardServlet",
        value = {"/dashboard",
                "/dashboard/course",
                "/dashboard/course/content",
                "/dashboard/course/content/detail/add",
                "/dashboard/course/content/detail/edit",
                "/dashboard/course/content/detail/delete",
                "/dashboard/member",
                "/dashboard/order",
                "/dashboard/update",
                "/dashboard/password",
                "/dashboard/member/edit",
                "/dashboard/member/view"})
public class DashboardServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final ICourseContentService contentService = new CourseContentServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    private final ICourseDetailContentService detailContentService = new DetailedContentServiceImpl();
    private final IContentType contentType = new ContentTypeServiceImpl();

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
                } else if (url.endsWith("/dashboard/member/view")) {
                    showPageMemberView(request, response, user);
                } else if (url.endsWith("/dashboard/member")) {
                    showPageManageMember(request, response, user);
                } else if (url.endsWith("/dashboard/course")) {
                    showPageManageCourse(request, response, user);
                } else if (url.endsWith("/dashboard/course/content")) {
                    showPageEditContent(request,response,user);
                } else if (url.endsWith("/dashboard/course/content/detail/add")) {
                    showFormAddDetailContent(request,response,user);
                } else if (url.endsWith("/dashboard/course/content/detail/edit")) {
                    showFormEditDetailContent(request,response,user);
                } else if (url.endsWith("/dashboard/course/content/detail/delete")) {
                    deleteDetailContent(request,response);
                } else if (url.endsWith("/dashboard/order")) {
                    showPageManageOrder(request, response, user);
                } else {
                    getListCourseAdmin(request, response, user);
                }
            } else {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/update")) {
                    showPageUpdateUser(request, response, user);
                } else if (url.endsWith("/dashboard/password")) {
                    showPageUpdatePassword(request, response, user);
                } else {
                    getCourseUserBuy(request, response, user);
                }
            }
        }
    }

    private void deleteDetailContent(HttpServletRequest request, HttpServletResponse response) {
        int idDetail = Integer.parseInt(request.getParameter("id"));
        detailContentService.deleteE(idDetail);
        try {
            response.sendRedirect("/dashboard/course");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormEditDetailContent(HttpServletRequest request, HttpServletResponse response, User user) {
        int idContent = Integer.parseInt(request.getParameter("content-id"));
        int idDetail = Integer.parseInt(request.getParameter("id"));
        CourseContent courseContent = contentService.selectE(idContent);
        CourseDetailedContent detailedContent = detailContentService.selectE(idDetail);
        List<CourseContentType> contentTypes = contentType.showListE();
        request.setAttribute("contentTypes",contentTypes);
        request.setAttribute("courseContent",courseContent);
        request.setAttribute("detailedContent",detailedContent);
        dispatcherData(request,response,"/course-content/edit-detail-to-content.jsp");
    }

    private void showFormAddDetailContent(HttpServletRequest request, HttpServletResponse response, User user) {
        int idContent = Integer.parseInt(request.getParameter("id-content"));
        CourseContent courseContent = contentService.selectE(idContent);
        List<CourseContentType> contentTypes = contentType.showListE();
        request.setAttribute("courseContent",courseContent);
        request.setAttribute("contentTypes",contentTypes);
        dispatcherData(request,response,"/course-content/add-detail-to-content.jsp");
    }

    private void showPageEditContent(HttpServletRequest request, HttpServletResponse response, User user) {
        int idContent = Integer.parseInt(request.getParameter("id"));
        CourseContent courseContent = contentService.selectE(idContent);
        Course course = courseService.selectCourse(courseContent.getCourseId());
        List<CourseDetailedContent> detailedContents = detailContentService.selectByCourseContentId(idContent);
        request.setAttribute("courseContent",courseContent);
        request.setAttribute("course",course);
        request.setAttribute("detailedContents",detailedContents);
        dispatcherData(request,response,"/course-content/edit-course-content.jsp");
    }

    // ADMIN
    private void showPageMemberEdit(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("admin", user.getFullName());
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", userService.selectE(id));
        dispatcherData(request, response, "/dashboard/dashboard-admin-edit.jsp");
    }

    private void showPageMemberView(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("admin", user.getFullName());
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", userService.selectE(id));
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
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/course/content/detail/add")){
                    addDetailContentToDb(request,response);
                } else if (url.endsWith("/dashboard/course/content/detail/edit")) {
                    updateDetailContentToDb(request,response);
                }
            } else {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/update")) {
                    try {
                        updateUser(request,response);
                    } catch (ParseException e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
        }
    }

    private void updateDetailContentToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("course-detail-id"));
        String title = request.getParameter("name-detail");
        String description = request.getParameter("description-detail");
        String idVideo = request.getParameter("id-video");
        int contentType = Integer.parseInt(request.getParameter("content-type"));
        CourseDetailedContent courseDetailedContent = new CourseDetailedContent(title,description,idVideo,contentType);
        detailContentService.updateE(id,courseDetailedContent);
        CourseContent courseContent = contentService.selectByDetailContentId(id);
        try {
            response.sendRedirect("/dashboard/course/content?id="+courseContent.getId());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void addDetailContentToDb(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name-detail");
        String description = request.getParameter("description-detail");
        String idVideo = request.getParameter("id-video");
        int idCourseContent = Integer.parseInt(request.getParameter("course-content-id"));
        int idContentType = Integer.parseInt(request.getParameter("content-type"));
        CourseDetailedContent detailedContent = new CourseDetailedContent(name,description,idVideo,idCourseContent,idContentType);
        detailContentService.saveE(detailedContent);
        try {
            response.sendRedirect("/dashboard/course/content?id="+ idCourseContent);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        SimpleDateFormat sm = new SimpleDateFormat("mm-dd-yyyy");
        String dod = sm.format(birthday);
        Date date=sm.parse(dod);
        boolean gender = "male".equals(request.getParameter("gender"));
        String email = request.getParameter("email");
        String idCard = request.getParameter("idCard");
        User user = new User(id, username, fullName, idCard, date, gender, phone, email);
        userService.updateE(user);
        try {
            response.sendRedirect("/dashboard/update");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}