<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Master New Skills with LTTA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/fontawesome/css/all.min.css">
    <link rel="shortcut icon" href="../public/image/favaticon.png" type="image/x-icon">
    <link rel="stylesheet" href="../public/course.css">
    <link rel="stylesheet" href="../public/loan.css">
    <link rel="stylesheet" href="../public/truongnq.css">
    <link rel="stylesheet" href="../public/main.css">
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>
<body>
<header id="header">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <div class="col-md-3 mb-2 mb-md-0">
                <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <img src="../public/image/logo-website.png" alt="Logo Website">
                </a>
            </div>

            <ul class="nav nav-header col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/" class="nav-link px-4">Trang chủ</a></li>
                <li><a href="/course" class="nav-link px-4">Khóa học</a></li>
                <li><a href="#" class="nav-link px-4">Cộng đồng</a></li>
                <li><a href="#" class="nav-link px-4">Về chúng tôi</a></li>
            </ul>

            <div class="col-md-3 text-end">
                <c:if test="${empty sessionScope.user}">
                    <a class="btn-login btn btn-primary" data-bs-toggle="modal" href="#userSignup" role="button">Đăng ký</a>
                    <c:import url="modal-login.jsp"></c:import>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <c:import url="dropdown-menu-user.jsp"></c:import>
                </c:if>
            </div>
        </div>
    </div>
    </div>
</header>
