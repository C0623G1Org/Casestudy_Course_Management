package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.*;
import com.example.coursemanagement.service.impl.FeedbackServiceImpl;
import com.example.coursemanagement.service.*;
import com.example.coursemanagement.service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CourseServlet", urlPatterns = {
        "",
        "/course",
        "/course/detail",
        "/course/search"
})
public class CourseServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final ICourseContentService courseContentService = new CourseContentServiceImpl();
    private final CourseCategoryServiceImpl categoryService = new CourseCategoryServiceImpl();
    private final ICourseDetailContentService detailContentService = new DetailedContentServiceImpl();
    private final ICourseOrderService orderService = new CourseOrderServiceImpl();
    private final IService<Feedback> feedbackService = new FeedbackServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/course/detail")) {
            showDetailCourse(request, response);
        } else if (url.endsWith("/course")) {
            showCoursePage(request, response);
        } else if (url.endsWith("/")) {
            showHomePage(request, response);
        }
    }

    private void showPageSearch(HttpServletRequest request, HttpServletResponse response) {
        String nameCourse = request.getParameter("name-course");
        String instructorCourse = request.getParameter("instructor-course");
        List<Course> courseList = courseService.searchByNameAndInstructor(nameCourse, instructorCourse);
        List<CourseCategory> categoryList = categoryService.showListE();
        if (!nameCourse.equals("")) {
            request.setAttribute("nameCourse", nameCourse);
        }
        if (!instructorCourse.equals("")) {
            request.setAttribute("instructorCourse", instructorCourse);
        }
        request.setAttribute("courseList", courseList);
        request.setAttribute("categoryList", categoryList);
        requestDispatcher(request, response, "/course-search.jsp");
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) {
        getListCourseRenderView(request, response, "/index.jsp");
    }

    private void showDetailCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idCourse = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(idCourse);
        List<CourseContent> courseContents = courseContentService.selectByCourseId(idCourse);
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
        HttpSession session = request.getSession(false);
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            boolean checkUserBuy = orderService.checkIdBuyCourse(user.getId(), idCourse);
            request.setAttribute("checkUserBuy", checkUserBuy);
        }
        request.setAttribute("course", course);
        request.setAttribute("courseContents", courseContents);
        request.setAttribute("detailedContents", detailedContents);
        requestDispatcher(request, response, "/course-detail.jsp");
    }

    private void showCoursePage(HttpServletRequest request, HttpServletResponse response) {
        getListCourseRenderView(request, response, "/course.jsp");
    }

    private void getListCourseRenderView(HttpServletRequest request, HttpServletResponse response, String path) {
        List<Course> courseList = courseService.showList();
        List<CourseCategory> categoryList = categoryService.showListE();
        List<Feedback> feedbacks = feedbackService.showListE();
        request.setAttribute("courseList", courseList);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("feedbacks", feedbacks);
        requestDispatcher(request, response, path);
    }

    private static void requestDispatcher(HttpServletRequest request, HttpServletResponse response, String path) {
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
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/course/search")) {
            showPageSearch(request, response);
        }
    }

}
