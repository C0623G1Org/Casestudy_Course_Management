package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseContent;
import com.example.coursemanagement.model.CourseDetailedContent;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.ICourseContentService;
import com.example.coursemanagement.service.ICourseDetailContentService;
import com.example.coursemanagement.service.ICourseOrderService;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.impl.CourseContentServiceImpl;
import com.example.coursemanagement.service.impl.CourseOrderServiceImpl;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.DetailedContentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LearningServlet", value = {"/learn","/learn/lesson/","/learn/reading/","/learn/exercise/"})
public class LearningServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final ICourseContentService contentService = new CourseContentServiceImpl();
    private final ICourseDetailContentService detailContentService = new DetailedContentServiceImpl();
    private final ICourseOrderService orderService = new CourseOrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        int idCourse = Integer.parseInt(request.getParameter("id"));
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            User user = (User) session.getAttribute("user");
            // Check xem user đã mua chưa khoá học chưa, chưa thì không cho xem
            boolean checkIdBuyCourse = orderService.checkIdBuyCourse(user.getId(),idCourse);
            if (checkIdBuyCourse || user.getRole().equals("admin")) {
                if (url.endsWith("/learn/lesson/") || url.endsWith("/learn/reading/") || url.endsWith("/learn/exercise/")){
                    getDetailContent(request);
                    renderTableOfContent(request);
                    requestDispatcher(request, response, "/learning/user-learning-video.jsp");
                } else if (url.endsWith("/learn")) {
                    renderTableOfContent(request);
                    requestDispatcher(request,response,"/learning/user-learning.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/");
            }
        }
    }

    private static void requestDispatcher(HttpServletRequest request, HttpServletResponse response,String path) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
        requestDispatcher.forward(request, response);
    }

    private void getDetailContent(HttpServletRequest request) {
        int idContentDetail = Integer.parseInt(request.getParameter("content-detail"));
        CourseDetailedContent content = detailContentService.selectE(idContentDetail);
        request.setAttribute("content", content);
    }

    private void renderTableOfContent(HttpServletRequest request) {
        int idCourse = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(idCourse);
        List<CourseContent> courseContents = contentService.selectByCourseId(idCourse);
        Map<Integer, List<CourseDetailedContent>> detailedContents = new HashMap<>();
        List<CourseDetailedContent> courseDetailedContents = detailContentService.showListE();
        for (CourseDetailedContent courseDetailedContent : courseDetailedContents) {
            if (detailedContents.containsKey(courseDetailedContent.getCourseContentId())) {
                detailedContents.get(courseDetailedContent.getCourseContentId()).add(courseDetailedContent);
            } else {
                detailedContents.put(courseDetailedContent.getCourseContentId(), new LinkedList<CourseDetailedContent>() {{
                    add(courseDetailedContent);
                }});
            }
        }
        request.setAttribute("course", course);
        request.setAttribute("courseContents", courseContents);
        request.setAttribute("detailedContents", detailedContents);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}