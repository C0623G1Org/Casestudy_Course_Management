<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="user-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard">
                <div class="header-content">
                    <div class="hello">
                        <form class="row form-search-course g-2">
                            <div class="col-auto">
                                <input type="text" class="form-control" id="inputEmail"
                                       placeholder=" Nhập khóa học cần tìm">
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary">Tìm</button>
                            </div>
                        </form>
                    </div>
                    <div class="user">
                       <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
                            <img class="rounded-circle me-1" width="35" height="35"
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg" alt="">
                                    <c:if test="${empty sessionScope.user.getFullName()}">
                                        ${sessionScope.user.getUsername()}
                                    </c:if>
                                    <c:if test="${not empty sessionScope.user.getFullName()}">
                                        ${sessionScope.user.getFullName()}
                                    </c:if>
                       </span>
                    </div>
                </div>
                <div class="header-content my-5">
                    <div class="hello">
                        <h3>Welcome back,</h3>
                    </div>
                    <div class="day-now">
                        <p>26-09-2023</p>
                    </div>
                </div>
                <div class="row my-5">
                    <c:forEach items="${listCourseUserBuy}" var="listCourse" varStatus="loop">
                        <div class="col-lg-6">
                            <div class="card" style="width: 100%;">
                                <div class="card-body">
                                    <div class="row card-head mb-2">
                                        <div class="col-md-4">
                                            <img src="../public/image/Rectangle 43.png">
                                        </div>
                                        <div class="col-md-8 ml-auto">
                                            <div class="category">
                                                <p class="text-right">Javascript
                                                </p>
                                            </div>
                                            <h3>${listCourse.getName()}</h3>
                                        </div>
                                    </div>
                                    <p class="card-text">${listCourse.getDescription()}</p>
                                    <div class="card-bottom">
                                        <div class="author"><i class="fa-solid fa-graduation-cap"></i> ${listCourse.getInstructor()}</div>
                                        <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>
                                    </div>
                                    <div class="day-buy mt-2">
                                        <p>Bạn đã mua khóa học này vào 24-09-2023</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
               </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../dashboard/footer-dashboard.jsp"></c:import>