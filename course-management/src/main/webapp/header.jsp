<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Master New Skills with LTTA</title>
    <meta name="viewport" content="width=device-width, initial-scale=0.9">
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
                <a class="btn-login btn btn-primary" data-bs-toggle="modal" href="#userSignup" role="button">Sign up</a>
            </div>

            <div class="modal fade" id="userSignup" aria-hidden="true" aria-labelledby="userSignupLabel"
                 tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div id="sign-up" class="wrapper">
                            <div class="btn-close-form">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="form">
                                <form action="#" class="signup_signin">
                                    <img src="../public/image/removebg_logo.png" width="170px" height="60px" alt="..."/>
                                    <h3>Đăng kí tài khoản</h3>
                                    <p>Tham gia cùng cộng đồng học tập của chúng tôi!</p>
                                    <div class="input-box">
                                        <input type="text" placeholder="Tên đăng nhập" required>
                                        <i class='bx bxs-user'></i>
                                    </div>
                                    <div class="input-box">
                                        <input type="password" placeholder="Mật khẩu" required>
                                        <i class='bx bxs-lock'></i>
                                    </div>
                                    <div class="input-box">
                                        <input type="password" placeholder="Nhập lại mật khẩu" required>
                                        <i class='bx bxs-lock'></i>
                                    </div>

                                    <div class="input-box">
                                        <input type="text" placeholder="Email của bạn" required>
                                        <i class='bx bxs-envelope'></i>
                                    </div>

                                    <button type="submit" class="register-btn">Đăng ký</button>

                                    <div class="login-link">
                                        <p>Bạn đã có tài khoản, <a data-bs-target="#userLogin"
                                                                   data-bs-toggle="modal" data-bs-dismiss="modal"
                                                                   role="button">đăng nhập tại đây</a>
                                        </p>
                                    </div>
                                    <div class="accept">
                                        <p>Bằng cách ấn đăng kí, bạn đồng ý với các điều khoản, điều kiện và chính sách
                                            dữ
                                            liệu của chúng
                                            tôi</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="userLogin" aria-hidden="true" aria-labelledby="userLoginLabel"
             tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div id="log-in" class="wrapper">
                        <form action="#" class="signup_signin">
                            <div class="btn-close-form">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="form">
                                <img src="../public/image/removebg_logo.png" width="170px" height="60px" alt="..."/>
                                <h3>Đăng nhập</h3>
                                <p>Tham gia cùng cộng đồng học tập của chúng tôi!</p>
                                <div class="input-box">
                                    <input type="text" placeholder="Tên đăng nhập" required>
                                    <i class='bx bxs-user'></i>
                                </div>
                                <div class="input-box">
                                    <input type="password" placeholder="Mật khẩu" required>
                                    <i class='bx bxs-lock'></i>
                                </div>
                                <button type="submit" class="register-btn">Đăng nhập</button>
                                <div class="login-link">
                                    <p>Bạn chưa có tài khoản, <a data-bs-target="#userSignup"
                                                                 data-bs-toggle="modal" data-bs-dismiss="modal"
                                                                 role="button">đăng kí tại đây</a>
                                    </p>
                                </div>
                                <div class="accept">
                                    <p>Việc bạn tiếp tục sử dụng trang web này đồng nghĩa bạn đồng ý với điều khoản sử
                                        dụng của chúng
                                        tôi</p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</header>
