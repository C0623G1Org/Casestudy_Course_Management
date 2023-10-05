package com.example.coursemanagement.controller;

import com.example.coursemanagement.model.User;
import com.example.coursemanagement.service.IUserService;
import com.example.coursemanagement.service.impl.UserServiceImpl;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "UserServlet", value = {"/user/signup", "/user/login","/user/logout"})
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/user/logout")) {
            removeSession(request, response);
        }
    }

    private static void removeSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith("/user/signup")) {
            checkSignUp(request, response);
        } else if (url.endsWith("/user/login")) {
            checkLogIn(request, response);
        }
    }

    private void checkLogIn(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String message = "";
        String username = request.getParameter("usernameLogIn");
        String password = request.getParameter("passwordLogIn");
        if (!userService.checkUsernameExits(username)) {
            message = "Tên đăng nhập chưa tồn tại trong hệ thống, vui lòng nhập lại hoặc đăng kí !";
            sendMessageToView(response, message);
        } else {
            if (!userService.checkExitsByUsernameAndPassword(username, password)) {
                message = "Mật khẩu chưa chính xác !";
                sendMessageToView(response, message);
            } else {
                User user = userService.selectByUsername(username);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                sendMessageToView(response, message);
            }
        }
    }


    private void checkSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message = "";
        // Lấy thông tin đăng ký từ request
        String username = request.getParameter("usernameSignUp");
        String password = request.getParameter("passwordSignUp");
        String confirmPassword = request.getParameter("passwordSignUpAgain");
        String email = request.getParameter("emailSignUp");
        User user;
        if (userService.checkUsernameExits(username)) {
            message = "Tên đăng nhập đã tồn tại trong hệ thống !";
            sendMessageToView(response, message);
        } else {
            if (!password.equals(confirmPassword)) {
                message = "Mật khẩu nhập lại không khớp !";
                sendMessageToView(response, message);
            } else {
                user = new User(username, password, email);
                userService.saveE(user);
                message = "Đăng kí thành công, đăng nhập để tiếp tục !";
                sendMessageToView(response, message);
            }
        }
    }

    private static void sendMessageToView(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(message);
    }
}