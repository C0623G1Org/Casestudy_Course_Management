package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.*;
import com.example.coursemanagement.service.ICourseContentService;
import com.example.coursemanagement.service.ICourseDetailContentService;
import com.example.coursemanagement.service.ICourseService;
import com.example.coursemanagement.service.impl.CourseCategoryServiceImpl;
import com.example.coursemanagement.service.impl.CourseContentServiceImpl;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.DetailedContentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(name = "CourseServlet", urlPatterns = {"", "/course", "/course/detail"})
public class CourseServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final ICourseContentService courseContentService = new CourseContentServiceImpl();
    private final CourseCategoryServiceImpl categoryService = new CourseCategoryServiceImpl();
    private final ICourseDetailContentService detailContentService = new DetailedContentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/course/detail")) {
            showDetailCourse(request, response);
        } else if (url.endsWith("/course")) {
            showCoursePage(request, response);
        } else if (url.endsWith("/")) {
            showHomePage(request,response);
        }
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) {
        getListCourseRenderView(request,response,"/index.jsp");
    }

    private void showDetailCourse(HttpServletRequest request, HttpServletResponse response) {
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
        request.setAttribute("course", course);
        request.setAttribute("courseContents", courseContents);
        request.setAttribute("detailedContents", detailedContents);
        requestDispatcher(request, response, "/course-detail.jsp");
    }

    private void showCoursePage(HttpServletRequest request, HttpServletResponse response) {
        getListCourseRenderView(request,response, "/course.jsp");
    }

    private void getListCourseRenderView(HttpServletRequest request, HttpServletResponse response, String path) {
        List<Course> courseList = courseService.showList();
        List<CourseCategory> categoryList = categoryService.showListE();
        request.setAttribute("courseList", courseList);
        request.setAttribute("categoryList", categoryList);
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

    }

}
