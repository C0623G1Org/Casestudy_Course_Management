<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="header.jsp"></c:import>
<section>
    <div class="container">
        <div class="row hero-home">
            <div class="col-lg-6">
                <h2>Trở thành lập trình viên chuyên nghiệp với LTTA</h2>
                <p>Cơ hội để trải nghiệm thực tế công việc của một lập trình viên, khởi đầu con đường lập trình chuyên
                    nghiệp!</p>
                <p>Còn chần chờ gì nữa mà không tìm hiểu ngay!</p>
                <div class="row d-flex align-items-center">
                    <div class="col-4">
                        <a class="btn-hero btn btn-primary" href="/course" role="button">Tham gia</a>
                    </div>
                    <div class="col-5">
                        <div class="circle-item">
                            <img src="../public/image/Ellipse 1.png" alt="">
                            <img src="../public/image/Ellipse 2.png" alt="">
                            <img src="../public/image/Ellipse 3.png" alt="">
                            <img src="../public/image/Ellipse 4.png" alt="">
                        </div>
                    </div>
                    <div class="col-3 using">
                        <p class="title">42k +</p>
                        <p>Học viên</p>
                    </div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="col-lg-4">
                        <img src="../public/image/logo-banner-1 1.png" height="38" width="174"/>
                    </div>
                    <div class="col-lg-4">
                        <img src="../public/image/logo-banner-2.png" height="94" width="167"/>
                    </div>
                    <div class="col-lg-4">
                        <img src="../public/image/W3Schools_logo.png" height="77" width="82"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 img-hero">
                <img src="../public/image/vector-banner 1.png">
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container why my-5">
        <div class="row">
            <div class="col-lg-8">
                <h3 style="font-weight: 600">Khởi đầu dễ dàng hơn với LTTA Co.</h3>
                <h3 style="font-weight: 600">Xem qua các khóa học của chúng tôi.</h3>
            </div>
            <div class="col-lg-4">
                <p>Các khóa học đa dạng từ cơ bản đến nâng cao phù hợp cho học sinh, sinh viên và người đi làm.</p>
                <a role="button" href="/course" class="btn-started btn btn-primary">Đăng ký ngay</a>
            </div>
        </div>
        <div class="row my-5 justify-content-around">
            <div class="col-lg-5">
                <div class="feature col one">
                    <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-gradient fs-2 mb-3">
                        <i class="fa-solid fa-circle-half-stroke"></i>
                    </div>
                    <h5 class="fs-2 text-body-emphasis">Được hỗ trợ từ chuyên gia</h5>
                    <p>LTTA là một tổ chức đào tạo học tập hoàn toàn trực tuyến. Điều đặc biệt là học viên sẽ được hỗ
                        trợ
                        từ đội ngũ chuyên gia và trợ lý học tập của LTTA. Đội ngũ chuyên gia công nghệ của LTTA có kiến
                        thức
                        sâu rộng và kinh nghiệm thực tiễn trong lĩnh vực CNTT, giúp học viên có thể tiếp cận và nắm vững
                        kiến thức mới nhất.</p>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="feature col two">
                    <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-gradient fs-2 mb-3">
                        <i class="fa-solid fa-circle-half-stroke"></i>
                    </div>
                    <h5 class="fs-2 text-body-emphasis">Đội ngũ giảng viên nhiệt tình, có chuyên môn</h5>
                    <p>Bạn sẽ được hướng dẫn bởi những lập trình viên dày dặn kinh nghiệm làm việc tại các tập đoàn công
                        nghệ lớn.
                        Không chỉ giải đáp thắc mắc về bài học, các giáo viên còn chia sẻ cho bạn những kinh nghiệm thực
                        tế
                        để bạn có thể tự tin bắt đầu sự nghiệp trong ngành Tech.
                        Bên cạnh đó là đội ngũ Trợ giảng luôn sẵn sàng giải đáp bất cứ thắc mắc nào về bài học để đảm
                        bảo hiệu quả học tập của bạn</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container my-5">
        <div class="row voucher-home">
            <div class="col-lg-4">
                <h3>Ưu đãi của chúng tôi dành cho bạn</h3>
            </div>
            <div class="col-lg-8">
                <div class="row">
                    <div class="bg-circe col-lg-3">
                        <p>Ưu đãi 1</p>
                    </div>
                    <div class="bg-circe col-lg-3">
                        <p>Ưu đãi 2</p>
                    </div>
                    <div class="bg-circe col-lg-3">
                        <p>Ưu đãi 3</p>
                    </div>
                    <div class="bg-circe col-lg-3">
                        <p>Ưu đãi 4</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container my-5 course-home">
        <div class="row text-center">
            <div class="col-md-6 offset-md-3 col-auto">
                <h2>Khoá học phổ biến</h2>
                <form action="/course/search" class="row g-3 form-search-home mt-3" method="post">
                    <div class="col-auto">
                        <input type="text" class="form-control" name="name-course" id="form-search-name"
                               placeholder="Tìm theo tên">
                    </div>
                    <div class="col-auto">
                        <input type="text" class="form-control" name="instructor-course" id="form-search-author"
                               placeholder="Tìm theo Tutor">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row my-5">
            <c:forEach items="${courseList}" var="courseList">
                <div class="col-lg-4">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <div class="row card-head">
                                <div class="col-md-4">
                                    <img src="${courseList.getAvatar()}" class="card-img" alt="">
                                </div>
                                <div class="col-md-8 ml-auto">
                                    <div class="category">
                                        <c:forEach items="${categoryList}" var="category">
                                            <c:if test="${category.getId() == courseList.getCourseLevelId()}">
                                                <p class="text-right">${category.getName()}</p>
                                            </c:if>
                                        </c:forEach>
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
                                <div class="price">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${courseList.getPrice()}" type="currency"/>
                                </div>
                                <a style="color: #FFFFFF" role="button" class="btn-login btn btn-primary"
                                   href="/course/detail?id=${courseList.getId()}">Đăng kí</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="text-center d-flex justify-content-between">
                <div class="col-lg-12">
                    <a role="button" href="/course" class="btn-hero btn btn-primary">Xem thêm</a>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="feedback">
    <div class="container">
        <div class="px-4 py-5 my-3 text-center">
            <div class="col-lg-6 mx-auto">
                <h3 class="display-5 fw-bold text-body-emphasis">Những người từng học nói gì về chúng tôi ?</h3>
                <p class="lead mb-4"></p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${feedbacks}" var="feedbacks" varStatus="loop">
                <c:if test="${loop.count < 5}">
                    <div class="col-lg-3">
                        <div class="card" style="width: 100%;">
                            <div class="card-body">
                                <div class="row card-head">
                                    <div class="col-md-4">
                                        <img src="../public/image/icon-avatar.png">
                                    </div>
                                    <div class="col-md-8 ml-auto">
                                        <div class="feedback">
                                            <p class="name">${feedbacks.getUser().getUsername()}</p>
                                        </div>
                                        <h3>${feedbacks.getUser().getFullName()}</h3>
                                    </div>
                                </div>
                                <div class="rating mt-3">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </div>
                                <p class="content">${feedbacks.getContent()}</p>
                                <div class="card-bottom">
                                    <div class="category">
                                        <c:forEach items="${categoryList}" var="category">
                                            <c:if test="${category.getId() == feedbacks.getOrder().getCourse().getCourseLevelId()}">
                                                ${category.getName()}
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="card-name-course my-2">
                                    <h3>${feedbacks.getOrder().getCourse().getName()}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>
<c:import url="footer.jsp"></c:import>