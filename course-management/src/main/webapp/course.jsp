<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"></c:import>
<section id="all-course-page">
    <div class="container">
        <div class="row course" id="row1Course">
            <div class="col-md-12">
                <div class="card text-bg-dark">
                    <img src="../public/image/imgSL1.png" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
                            <div class="container-fluid py-5">
                                <h3 class="display-5 fw-bold">Tất cả khóa học</h3>
                                <p class="col-md-8 fs-5">Lorem ipsum dolor sit amet consectetur
                                    adipisiccing elit.
                                    Dolores pariatur quibusdam adipisci dignissimos voluptate amet, dolorum dicta maiores!
                                    Minima cupiditate enum, illo odio explicabo temporibus sequi enim maxime facere!
                                    Quis!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row course" id="row2Course">
            <c:forEach items="${courseList}" var="courseList">
                <div class="col-lg-4 mb-4">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <div class="row card-head">
                                <div class="col-md-4">
                                    <img src="../public/image/Rectangle 43.png">
                                </div>
                                <div class="col-md-8 ml-auto">
                                    <div class="category">
                                            <c:forEach items="${categoryList}" var="category">
                                            <c:if test="${category.getId() == courseList.getCategoryId()}">
                                                <p class="text-right">${category.getName()}</p>
                                            </c:if>
                                        </c:forEach>                                        </p>
                                    </div>
                                    <h3>${courseList.getName()}</h3>
                                </div>
                            </div>
                            <p class="card-text">${courseList.getDescription()}</p>
                            <div class="card-bottom">
                                <div class="author"><i
                                        class="fa-solid fa-graduation-cap"></i> ${courseList.getInstructor()}</div>
                                <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>
                            </div>
                            <div class="card-price">
                                <div class="price">${courseList.getPrice()} $</div>
                                <a style="color: #FFFFFF" role="button" class="btn-login btn btn-primary" href="/course/detail?id=${courseList.getId()}">Đăng kí</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <%--            <div class="col-lg-4 mb-4">--%>
            <%--                <div class="card" style="width: 100%;">--%>
            <%--                    <div class="card-body">--%>
            <%--                        <div class="row card-head">--%>
            <%--                            <div class="col-md-4">--%>
            <%--                                <img src="../public/image/Course%20JS.png">--%>
            <%--                            </div>--%>
            <%--                            <div class="col-md-8 ml-auto">--%>
            <%--                                <div class="category">--%>
            <%--                                    <p class="text-right">Java--%>
            <%--                                    </p>--%>
            <%--                                </div>--%>
            <%--                                <h3>Basic Java <br>Tutorial</h3>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <p class="card-text">Java là một ngôn ngữ lập trình đa nền tảng, sử dụng để phát triển các ứng--%>
            <%--                            dụng desktop, mobile, web và một số hệ thống phức tạp</p>--%>
            <%--                        <div class="card-bottom">--%>
            <%--                            <div class="author"><i class="fa-solid fa-graduation-cap"></i> ThanhPV</div>--%>
            <%--                            <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-price">--%>
            <%--                            <div class="price">1.200.000 VNĐ</div>--%>
            <%--                            <button type="button" class="btn btn-outline-dark">Join now</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--            <div class="col-lg-4 mb-4">--%>
            <%--                <div class="card" style="width: 100%;">--%>
            <%--                    <div class="card-body">--%>
            <%--                        <div class="row card-head">--%>
            <%--                            <div class="col-md-4">--%>
            <%--                                <img src="../public/image/Course%20SQl.png">--%>
            <%--                            </div>--%>
            <%--                            <div class="col-md-8 ml-auto">--%>
            <%--                                <div class="category">--%>
            <%--                                    <p class="text-right">Java--%>
            <%--                                    </p>--%>
            <%--                                </div>--%>
            <%--                                <h3>Basic SQL<br/> Tutorial</h3>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <p class="card-text">SQL là ngôn ngữ lập trình để truy vấn và quản lý cơ sở dữ liệu, được sử--%>
            <%--                            dụng trong các ứng dụng liên quan đến dữ liệu </p>--%>
            <%--                        <div class="card-bottom">--%>
            <%--                            <div class="author"><i class="fa-solid fa-graduation-cap"></i> ThanhPV</div>--%>
            <%--                            <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-price">--%>
            <%--                            <div class="price">1.200.000 VNĐ</div>--%>
            <%--                            <button type="button" class="btn btn-outline-dark">Join now</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--            <div class="col-lg-4 mb-4">--%>
            <%--                <div class="card" style="width: 100%;">--%>
            <%--                    <div class="card-body">--%>
            <%--                        <div class="row card-head">--%>
            <%--                            <div class="col-md-4">--%>
            <%--                                <img src="../public/image/Rectangle 43.png">--%>
            <%--                            </div>--%>
            <%--                            <div class="col-md-8 ml-auto">--%>
            <%--                                <div class="category">--%>
            <%--                                    <p class="text-right">Javascript--%>
            <%--                                    </p>--%>
            <%--                                </div>--%>
            <%--                                <h3>Javascript Foudatament</h3>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <p class="card-text">JavaScript là ngôn ngữ lập trình phía client, được sử dụng chủ yếu trong--%>
            <%--                            các ứng dụng web để tạo ra các hiệu ứng tương tác trên trang web</p>--%>
            <%--                        <div class="card-bottom">--%>
            <%--                            <div class="author"><i class="fa-solid fa-graduation-cap"></i> ThanhPV</div>--%>
            <%--                            <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-price">--%>
            <%--                            <div class="price">1.200.000 VNĐ</div>--%>
            <%--                            <button type="button" class="btn btn-outline-dark">Join now</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--            <div class="col-lg-4 mb-4">--%>
            <%--                <div class="card" style="width: 100%;">--%>
            <%--                    <div class="card-body">--%>
            <%--                        <div class="row card-head">--%>
            <%--                            <div class="col-md-4">--%>
            <%--                                <img src="../public/image/Course%20JS.png">--%>
            <%--                            </div>--%>
            <%--                            <div class="col-md-8 ml-auto">--%>
            <%--                                <div class="category">--%>
            <%--                                    <p class="text-right">Java--%>
            <%--                                    </p>--%>
            <%--                                </div>--%>
            <%--                                <h3>Basic Java <br>Tutorial</h3>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <p class="card-text">Java là một ngôn ngữ lập trình đa nền tảng, sử dụng để phát triển các ứng--%>
            <%--                            dụng desktop, mobile, web và một số hệ thống phức tạp</p>--%>
            <%--                        <div class="card-bottom">--%>
            <%--                            <div class="author"><i class="fa-solid fa-graduation-cap"></i> ThanhPV</div>--%>
            <%--                            <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-price">--%>
            <%--                            <div class="price">1.200.000 VNĐ</div>--%>
            <%--                            <button type="button" class="btn btn-outline-dark">Join now</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--            <div class="col-lg-4 mb-4">--%>
            <%--                <div class="card" style="width: 100%;">--%>
            <%--                    <div class="card-body">--%>
            <%--                        <div class="row card-head">--%>
            <%--                            <div class="col-md-4">--%>
            <%--                                <img src="../public/image/Course%20SQl.png">--%>
            <%--                            </div>--%>
            <%--                            <div class="col-md-8 ml-auto">--%>
            <%--                                <div class="category">--%>
            <%--                                    <p class="text-right">Java--%>
            <%--                                    </p>--%>
            <%--                                </div>--%>
            <%--                                <h3>Basic SQL<br/> Tutorial</h3>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <p class="card-text">SQL là ngôn ngữ lập trình để truy vấn và quản lý cơ sở dữ liệu, được sử--%>
            <%--                            dụng trong các ứng dụng liên quan đến dữ liệu </p>--%>
            <%--                        <div class="card-bottom">--%>
            <%--                            <div class="author"><i class="fa-solid fa-graduation-cap"></i> ThanhPV</div>--%>
            <%--                            <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-price">--%>
            <%--                            <div class="price">1.200.000 VNĐ</div>--%>
            <%--                            <button type="button" class="btn btn-outline-dark">Join now</button>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>

        </div>
        <div class="row course" id="row4Course">
            <h1 style="font-weight: bold; font-size: 50px">FAQ</h1>
            <p style="font-weight: bold; font-size: 40px">Câu hỏi thường gặp ?</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur, assumenda?<br/><br/><br/></p>
            <div class="row question-course">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne" aria-expanded="false"
                                    aria-controls="flush-collapseOne">
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse"
                             aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero,
                                obcaecati. Minus, ea quisquam. Vel labore distinctio ipsum? Aperiam, veritatis tenetur.
                                Eum ipsam quod quas temporibus quidem nisi. Ipsum, dolorum necessitatibus.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseTwo" aria-expanded="false"
                                    aria-controls="flush-collapseTwo">
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse"
                             aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero,
                                obcaecati. Minus, ea quisquam. Vel labore distinctio ipsum? Aperiam, veritatis tenetur.
                                Eum ipsam quod quas temporibus quidem nisi. Ipsum, dolorum necessitatibus.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseThree" aria-expanded="false"
                                    aria-controls="flush-collapseThree">
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                            </button>
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse"
                             aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero,
                                obcaecati. Minus, ea quisquam. Vel labore distinctio ipsum? Aperiam, veritatis tenetur.
                                Eum ipsam quod quas temporibus quidem nisi. Ipsum, dolorum necessitatibus.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseThree" aria-expanded="false"
                                    aria-controls="flush-collapseThree">
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                            </button>
                        </h2>
                        <div id="flush-collapseFour" class="accordion-collapse collapse"
                             aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero,
                                obcaecati. Minus, ea quisquam. Vel labore distinctio ipsum? Aperiam, veritatis tenetur.
                                Eum ipsam quod quas temporibus quidem nisi. Ipsum, dolorum necessitatibus.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="form-modal">
    <div class="login-modal"></div>
    <div class="login-page">
        <div id="sign-up" class="wrapper">
            <form action="#" class="signup_signin">
                <div class="close-icon">
                    <i class="fa-solid fa-xmark"></i>
                </div>
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
                    <p>Bạn đã có tài khoản, <a id="login-here" href="#">đăng nhập tại đây</a>
                    </p>
                </div>
                <div class="accept">
                    <p>Bằng cách ấn đăng kí, bạn đồng ý với các điều khoản, điều kiện và chính sách dữ liệu của chúng
                        tôi</p>
                </div>
            </form>
        </div>

        <div id="log-in" class="wrapper">
            <form action="#" class="signup_signin">
                <div class="close-icon">
                    <i class="fa-solid fa-xmark"></i>
                </div>
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
                    <p>Bạn chưa có tài khoản, <a id="sign-up-here" href="#">đăng ký tại đây</a>
                    </p>
                </div>

                <div class="accept">
                    <p>Việc bạn tiếp tục sử dụng trang web này đồng nghĩa bạn đồng ý với điều khoản sử dụng của chúng
                        tôi</p>
                </div>
            </form>
        </div>
    </div>
</div>
<c:import url="footer.jsp"></c:import>