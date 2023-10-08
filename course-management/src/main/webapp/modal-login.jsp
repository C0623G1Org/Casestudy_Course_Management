<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="userSignup" aria-hidden="true" aria-labelledby="userSignupLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div id="sign-up" class="wrapper">
                <div class="btn-close-form">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="form">
                    <form class="signup_signin" id="form-signup">
                        <img src="../public/image/removebg_logo.png" width="170px" height="60px" alt="..."/>
                        <h3>Đăng ký tài khoản</h3>
                        <p>Tham gia cùng cộng đồng học tập của chúng tôi!</p>
                        <div id="msg-signup"></div>
                        <div class="input-box">
                            <input type="text" placeholder="Tên đăng nhập" name="usernameSignUp" id="usernameSignUp" required>
                            <i class='bx bxs-user'></i>
                        </div>
                        <div class="input-box">
                            <input type="password" placeholder="Mật khẩu" name="passwordSignUp" id="passwordSignUp" required>
                            <i class='bx bxs-lock'></i>
                        </div>
                        <div class="input-box">
                            <input type="password" placeholder="Nhập lại mật khẩu" name="passwordSignUpAgain" id="passwordSignUpAgain" required>
                            <i class='bx bxs-lock'></i>
                        </div>

                        <div class="input-box">
                            <input type="email" placeholder="Email của bạn" name="emailSignUp" id="emailSignUp" required>
                            <i class='bx bxs-envelope'></i>
                        </div>

                        <button id="register-btn" class="register-btn">Đăng ký</button>

                        <div class="login-link">
                            <p>Bạn đã có tài khoản, <a data-bs-target="#userLogin"
                                                       data-bs-toggle="modal" data-bs-dismiss="modal"
                                                       role="button">đăng nhập tại đây</a>
                            </p>
                        </div>
                        <div class="accept">
                            <p>Bằng cách ấn đăng ký, bạn đồng ý với các điều khoản, điều kiện và chính sách
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
<div class="modal fade" id="userLogin" aria-hidden="true" aria-labelledby="userLoginLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div id="log-in" class="wrapper">
                <form class="signup_signin" id="form-login">
                    <div class="btn-close-form">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="form">
                        <img src="../public/image/removebg_logo.png" width="170px" height="60px" alt="..."/>
                        <h3>Đăng nhập</h3>
                        <p>Tham gia cùng cộng đồng học tập của chúng tôi!</p>
                        <div id="msg-login"></div>
                        <div class="input-box">
                            <input type="text" placeholder="Tên đăng nhập" name="usernameLogIn" id="usernameLogIn" required>
                            <i class='bx bxs-user'></i>
                        </div>
                        <div class="input-box">
                            <input type="password" placeholder="Mật khẩu" name="usernameLogIn" id="passwordLogIn" required>
                            <i class='bx bxs-lock'></i>
                        </div>
                        <button id="login-btn" type="submit" class="register-btn">Đăng nhập</button>
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
