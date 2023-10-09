package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.*;
import com.example.coursemanagement.repository.IContentType;
import com.example.coursemanagement.service.*;
import com.example.coursemanagement.model.Course;
import com.example.coursemanagement.model.CourseOrderInf;
import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.impl.CourseOrderServiceImpl;
import com.example.coursemanagement.service.impl.CourseServiceImpl;
import com.example.coursemanagement.service.impl.UserServiceImpl;
import com.example.coursemanagement.service.impl.*;
import com.example.coursemanagement.utils.RegexUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(
        name = "DashboardServlet",
        value = {"/dashboard",
                "/dashboard/course",
                "/dashboard/course/add",
                "/dashboard/course/edit",
                "/dashboard/course/delete",
                "/dashboard/course/content",
                "/dashboard/course/content/add",
                "/dashboard/course/content/edit",
                "/dashboard/course/content/delete",
                "/dashboard/course/content/detail/add",
                "/dashboard/course/content/detail/edit",
                "/dashboard/course/content/detail/delete",
                "/dashboard/member",
                "/dashboard/order",
                "/dashboard/order/detail",
                "/dashboard/order/delete",
                "/dashboard/update",
                "/dashboard/password",
                "/dashboard/member/edit",
                "/dashboard/member/view",
                "/dashboard/member/delete"})
public class DashboardServlet extends HttpServlet {
    private final ICourseService courseService = new CourseServiceImpl();
    private final ICourseContentService contentService = new CourseContentServiceImpl();
    private final IUserService userService = new UserServiceImpl();
    private final ICourseOrderService courseOrderService = new CourseOrderServiceImpl();
    private final ICourseDetailContentService detailContentService = new DetailedContentServiceImpl();
    private final IContentType contentType = new ContentTypeServiceImpl();
    private final ICourseLevelService levelService = new CourseCategoryServiceImpl();
    private final static RegexUtils regex = new RegexUtils();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Kiểm tra session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/member/delete")) {
                    deleteUser(request, response);
                } else if (url.endsWith("/dashboard/member/edit")) {
                    showPageMemberEdit(request, response, user);
                } else if (url.endsWith("/dashboard/member/view")) {
                    showPageMemberView(request, response, user);
                } else if (url.endsWith("/dashboard/member")) {
                    showPageManageMember(request, response, user);
                } else if (url.endsWith("/dashboard/course/add")) {
                    showFormAddCourse(request,response);
                } else if (url.endsWith("/dashboard/course/edit")) {
                    showFormEditCourse(request,response);
                } else if (url.endsWith("/dashboard/course/delete")) {
                    deleteCourseToDB(request,response);
                } else if (url.endsWith("/dashboard/course")) {
                    showPageManageCourse(request, response, user);
                } else if (url.endsWith("/dashboard/course/content/add")) {
                    showPageAddContent(request,response);
                } else if (url.endsWith("/dashboard/course/content/delete")) {
                    deleteContent(request,response);
                } else if (url.endsWith("/dashboard/course/content")) {
                    showPageEditContent(request, response, user);
                } else if (url.endsWith("/dashboard/course/content/detail/add")) {
                    showFormAddDetailContent(request, response, user);
                } else if (url.endsWith("/dashboard/course/content/detail/edit")) {
                    showFormEditDetailContent(request, response, user);
                } else if (url.endsWith("/dashboard/course/content/detail/delete")) {
                    deleteDetailContent(request, response);
                } else if (url.endsWith("/dashboard/order/detail")) {
                    showDetailOrder(request,response);
                } else if (url.endsWith("/dashboard/order/delete")) {
                    deleteOrder(request,response);
                } else if (url.endsWith("/dashboard/order")) {
                    showPageManageOrder(request, response, user);
                } else {
                    getListCourseAdmin(request, response, user);
                }
            } else {
                User userGet = userService.selectByUsername(user.getUsername());
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/update")) {
                    showPageUpdateUser(request, response, userGet);
                } else if (url.endsWith("/dashboard/password")) {
                    showPageUpdatePassword(request, response, userGet);
                } else {
                    getCourseUserBuy(request, response);
                }
            }
        }
    }


    private void showPageManageOrder(HttpServletRequest request, HttpServletResponse response, User user) {
        int currentPage;
        if (request.getParameter("currentPage") == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        List<CourseOrderInf> courseOrderInfList = courseOrderService.showCourseOrder(currentPage);
        int count = courseOrderService.countOrdersAmount();
        int endPage = count/10;
        if (count % 10 != 0) {
            endPage++;
        }
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("courseOrderInfList", courseOrderInfList);
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-order.jsp");
    }


    private void showDetailOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("order-id"));
        CourseOrder order = courseOrderService.showOrderById(orderId);
        request.setAttribute("order", order);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/detailed-course-order.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        int orderId = Integer.parseInt(request.getParameter("id"));
        courseOrderService.deleteOrder(orderId);
        try {
            response.sendRedirect("/dashboard/order");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteContent(HttpServletRequest request, HttpServletResponse response) {
        int idContent = Integer.parseInt(request.getParameter("id"));
        CourseContent courseContent = contentService.selectE(idContent);
        contentService.deleteE(idContent);
        try {
            response.sendRedirect("/dashboard/course/edit?id="+courseContent.getCourseId());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showPageAddContent(HttpServletRequest request, HttpServletResponse response) {
        int idCourse = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourse(idCourse);
        request.setAttribute("course",course);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/course-content/add-course-content.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormEditCourse(HttpServletRequest request, HttpServletResponse response) {
        List<CourseCategory> categoryList = levelService.showListE();
        int idCourse = Integer.parseInt(request.getParameter("id"));
        List<CourseContent> courseContents = contentService.selectByCourseId(idCourse);
        Course course = courseService.selectCourse(idCourse);
        request.setAttribute("categoryList",categoryList);
        request.setAttribute("courseContents", courseContents);
        request.setAttribute("course",course);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/course-content/edit-course.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormAddCourse(HttpServletRequest request, HttpServletResponse response) {
        List<CourseCategory> categoryList = levelService.showListE();
        request.setAttribute("categoryList",categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/course-content/add-course.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showPageManageCourse(HttpServletRequest request, HttpServletResponse response, User user) {
        int count = courseService.countCoursesAmount();
        if (count > 10){
            int endPage = count/10;
            if (count % 10 != 0) {
                endPage++;
            }
            int currentPage;
            if (request.getParameter("currentPage") == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
            }
            List<Course> courses = courseService.showList(currentPage);
            List<CourseCategory> categoryList = levelService.showListE(currentPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("courses", courses);
        } else {
            List<Course> courses = courseService.showList();
            List<CourseCategory> categoryList = levelService.showListE();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("courses", courses);
        }
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-course.jsp");
    }

    private void showPageManageMember(HttpServletRequest request, HttpServletResponse response, User user) {
        int currentPage;
        if (request.getParameter("currentPage") == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        int count = userService.countUsersAmount();
        int endPage = count/10;
        if (count % 10 != 0) {
            endPage++;
        }
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("endPage", endPage);
        List<User> list = userService.showListE(currentPage);
        request.setAttribute("list", list);
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin-manage-member.jsp");
    }



    //    private void showCourseOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<CourseOrderInf> courseOrderInfs = courseOrderService.showCourseOrder();
//        request.setAttribute("courseOrderInfs", courseOrderInfs);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard/dashboard-admin.jsp");
//        requestDispatcher.forward(request, response);
//    }

    private void showPageUpdateUser(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-user-edit.jsp");
    }

    private void showPageUpdatePassword(HttpServletRequest request, HttpServletResponse response, User user) {
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-user-password.jsp");
    }

    private void getCourseUserBuy(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        List<CourseCategory> categoryList = levelService.showListE();
        List<CourseOrder> courseOrders = courseOrderService.selectByUserBuy(user.getId());
        request.setAttribute("categoryList",categoryList);
        request.setAttribute("courseOrders",courseOrders);
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/course/content/detail/add")) {
                    addDetailContentToDb(request, response);
                } else if (url.endsWith("/dashboard/course/content/detail/edit")) {
                    updateDetailContentToDb(request, response);
                } else if (url.endsWith("/dashboard/member/edit")) {
                    try {
                        updateMember(request, response, user);
                    } catch (ParseException e) {
                        System.out.println(e.getMessage());
                    }
                } else if (url.endsWith("/dashboard/course/add")) {
                        addCourseToDb(request,response);
                } else if (url.endsWith("/dashboard/course/edit")) {
                        updateCourseToDB(request,response);
                } else if (url.endsWith("/dashboard/course/content/add")) {
                    addCourseContentToDb(request,response);
                } else if (url.endsWith("/dashboard/course/content/edit")){
                    updateCourseContentToDb(request,response);
                }
            } else {
                String url = request.getRequestURI();
                if (url.endsWith("/dashboard/update")) {
                    try {
                        updateUser(request, response);
                    } catch (ParseException e) {
                        System.out.println(e.getMessage());
                    }
                } else if(url.endsWith("/dashboard/password")){
                    changePassWord(request,response);
                }
            }
        }
    }
    private void addCourseToDb(HttpServletRequest request, HttpServletResponse response) {
        String messegeError = "";
        String courseName = request.getParameter("name-course");
        if (!regex.validateName(courseName)) {
            messegeError += "<p>Tên khóa học nhập vào không hợp lệ <p>";
        } else {
            request.setAttribute("courseName",courseName);
        }
        String descriptionCourse = request.getParameter("description-course");
        if (!regex.validateOnlyNumberOrText(descriptionCourse)) {
            messegeError += "<p> Mô tả nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("descriptionCourse",descriptionCourse);
        }
        String priceCourse = request.getParameter("price-course");
        if (!regex.validatePrice(priceCourse)) {
            messegeError += "<p> Giá nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("priceCourse",priceCourse);
        }
        String knowledge = request.getParameter("knowledge");
        if (!regex.validateOnlyNumberOrText(knowledge)) {
            messegeError += "<p> Kiến thức nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("knowledge",knowledge);
        }
        String requirements = request.getParameter("requirements");
        if (!regex.validateOnlyNumberOrText(requirements)) {
            messegeError += "<p> Yêu cầu nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("requirements",requirements);
        }
        String instructor = request.getParameter("instructor");
        if (!regex.validateOnlyText(instructor)) {
            messegeError += "<p> Tác giả nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("instructor",instructor);
        }
        String courseInclusion = request.getParameter("course-inclusion");
        if (!regex.validateOnlyNumberOrText(courseInclusion)) {
            messegeError += "<p> Thông tin khác  nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("courseInclusion",courseInclusion);
        }
        int courseLevel = Integer.parseInt(request.getParameter("course-level"));
        String avatar = request.getParameter("avatar-course");
        if (!regex.validateOnlyLink(avatar)) {
            messegeError += "<p> Link nhập vào không hợp lệ </p>";
        } else {
            request.setAttribute("avatar",avatar);
        }
        if (messegeError != "") {
            request.setAttribute("messegeError",messegeError);
            showFormAddCourse(request,response);
        } else {
            Course course = new Course(courseName, descriptionCourse, instructor, Double.parseDouble(priceCourse),courseLevel, knowledge, requirements, courseInclusion,avatar);
            courseService.saveCourse(course);
            try {
                response.sendRedirect("/dashboard/course");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void updateCourseToDB(HttpServletRequest request, HttpServletResponse response) {
        String messegeError = "";
        int courseId = Integer.parseInt(request.getParameter("id-course"));
        String courseName = request.getParameter("name-course");
        if (!regex.validateName(courseName)) {
            messegeError += "Tên khóa học nhập vào không hợp lệ <br>";
        }
        String descriptionCourse = request.getParameter("description-course");
        if (!regex.validateOnlyNumberOrText(descriptionCourse)) {
            messegeError += "<p> Mô tả nhập vào không hợp lệ </p>";
        }
        String priceCourse = request.getParameter("price-course");
        if (!regex.validatePrice(priceCourse)) {
            messegeError += "<br> Giá nhập vào không hợp lệ <br>";
        }
        String knowledge = request.getParameter("knowledge");
        String requirements = request.getParameter("requirements");
        String instructor = request.getParameter("instructor");
        if (!regex.validateOnlyText(instructor)) {
            messegeError += "<p> Tác giả nhập vào không hợp lệ </p>";
        }
        String courseInclusion = request.getParameter("course-inclusion");
        int courseLevel = Integer.parseInt(request.getParameter("course-level"));
        String avatar = request.getParameter("avatar-course");
        if (messegeError == "") {
            Course course = new Course(courseName, descriptionCourse, instructor, Double.parseDouble(priceCourse),courseLevel, knowledge, requirements, courseInclusion,avatar);
            courseService.updateCourse(courseId, course);
            try {
                response.sendRedirect("/dashboard/course");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                response.sendRedirect("/dashboard/course/edit?id="+courseId);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void deleteCourseToDB(HttpServletRequest request, HttpServletResponse response) {
        int courseId = Integer.parseInt(request.getParameter("id"));
        courseService.deleteCourse(courseId);
        try {
            response.sendRedirect("/dashboard/course");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateCourseContentToDb(HttpServletRequest request, HttpServletResponse response) {
        int idContent = Integer.parseInt(request.getParameter("id"));
        int idCourse = Integer.parseInt(request.getParameter("id-course"));
        String name =  request.getParameter("name-content");
        String description =  request.getParameter("description");
        CourseContent courseContent = new CourseContent(name,idCourse);
        contentService.updateE(idContent,courseContent);
        try {
            response.sendRedirect("/dashboard/course/content?id="+idContent);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    private void addCourseContentToDb(HttpServletRequest request, HttpServletResponse response) {
        int idCourse = Integer.parseInt(request.getParameter("id-course"));
        String nameContent = request.getParameter("name-content");
        CourseContent courseContent = new CourseContent(nameContent,idCourse);
        contentService.saveE(courseContent);
        try {
            response.sendRedirect("/dashboard/course/edit?id="+idCourse);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }




    private void updateDetailContentToDb(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("course-detail-id"));
        String title = request.getParameter("name-detail");
        String description = request.getParameter("description-detail");
        String idVideo = request.getParameter("id-video");
        int contentType = Integer.parseInt(request.getParameter("content-type"));
        CourseDetailedContent courseDetailedContent = new CourseDetailedContent(title, description, idVideo, contentType);
        detailContentService.updateE(id, courseDetailedContent);
        CourseContent courseContent = contentService.selectByDetailContentId(id);
        try {
            response.sendRedirect("/dashboard/course/content?id=" + courseContent.getId());
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
        CourseDetailedContent detailedContent = new CourseDetailedContent(name, description, idVideo, idCourseContent, idContentType);
        detailContentService.saveE(detailedContent);
        try {
            response.sendRedirect("/dashboard/course/content?id=" + idCourseContent);
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
        boolean gender = "male".equals(request.getParameter("gender"));
        String email = request.getParameter("email");
        String idCard = request.getParameter("idCard");
        String role = request.getParameter("role");
        User user = new User(id, username, fullName, idCard, birthday, gender, phone, email, role);
        userService.updateE(user);
        showPageUpdateUser(request, response, user);
    }

    private void updateMember(HttpServletRequest request, HttpServletResponse response, User admin) throws ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("userName");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        boolean gender = "male".equals(request.getParameter("gender"));
        String email = request.getParameter("email");
        String idCard = request.getParameter("idCard");
        User userEdit = new User(id, username, fullName, idCard, birthday, gender, phone, email, admin.getRole());
        userService.updateE(userEdit);
        showPageMemberEdit(request, response, admin);
    }

    private void deleteDetailContent(HttpServletRequest request, HttpServletResponse response) {
        int idDetail = Integer.parseInt(request.getParameter("id"));
        CourseDetailedContent detailedContent = detailContentService.selectE(idDetail);
        detailContentService.deleteE(idDetail);
        try {
            response.sendRedirect("/dashboard/course/content?id="+detailedContent.getCourseContentId());
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
        request.setAttribute("contentTypes", contentTypes);
        request.setAttribute("courseContent", courseContent);
        request.setAttribute("detailedContent", detailedContent);
        dispatcherData(request, response, "/course-content/edit-detail-to-content.jsp");
    }

    private void showFormAddDetailContent(HttpServletRequest request, HttpServletResponse response, User user) {
        int idContent = Integer.parseInt(request.getParameter("id-content"));
        CourseContent courseContent = contentService.selectE(idContent);
        List<CourseContentType> contentTypes = contentType.showListE();
        request.setAttribute("courseContent", courseContent);
        request.setAttribute("contentTypes", contentTypes);
        dispatcherData(request, response, "/course-content/add-detail-to-content.jsp");
    }

    private void showPageEditContent(HttpServletRequest request, HttpServletResponse response, User user) {
        int idContent = Integer.parseInt(request.getParameter("id"));
        CourseContent courseContent = contentService.selectE(idContent);
        Course course = courseService.selectCourse(courseContent.getCourseId());
        List<CourseDetailedContent> detailedContents = detailContentService.selectByCourseContentId(idContent);
        request.setAttribute("courseContent", courseContent);
        request.setAttribute("course", course);
        request.setAttribute("detailedContents", detailedContents);
        dispatcherData(request, response, "/course-content/edit-course-content.jsp");
    }

    // ADMIN
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        try {
            response.sendRedirect("/dashboard/member");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }

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
        int count = courseOrderService.countOrdersByDate();
        int currentPage;
//        if (count > 10) {
            int endPage = count/10;
            if (count % 10 != 0) {
                endPage++;
            }
            if (request.getParameter("currentPage") == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
            }
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("endPage", endPage);

//        }
        List<Course> courseList = courseService.showList();
        request.setAttribute("courseList", courseList);
        List<CourseOrder> courseOrdersNow = courseOrderService.getOrderByDateNow(currentPage);
        request.setAttribute("courseOrdersNow", courseOrdersNow);
        request.setAttribute("user", user);
        dispatcherData(request, response, "/dashboard/dashboard-admin.jsp");
    }

    private void changePassWord(HttpServletRequest request,HttpServletResponse response){
        String oldPassWord=request.getParameter("oldPassWord");
        int id= Integer.parseInt(request.getParameter("id"));
        User user=userService.selectE(id);
        String alert = null;
        String sucsess = null;
        if (oldPassWord.equals(user.getPassword())){
            String newPassWord=request.getParameter("newPassword");
            String againNewPassWord=request.getParameter("againNewPassword");
            if(newPassWord.equals(againNewPassWord)){
                userService.changePassWord(user, againNewPassWord);
                sucsess = "Thay đổi mật khẩu thành công";
                request.setAttribute("sucsess",sucsess);
                showPageUpdatePassword(request,response,user);
            } else {
                alert = "Mật Khẩu nhập lại không đúng";
                request.setAttribute("alert", alert);
                showPageUpdatePassword(request,response,user);
            }
        } else {
            alert = "Mật khẩu cũ không đúng";
            request.setAttribute("alert",alert);
            showPageUpdatePassword(request,response,user);
        }
    }
}