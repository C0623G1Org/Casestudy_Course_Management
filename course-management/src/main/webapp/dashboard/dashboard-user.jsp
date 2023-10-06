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
                <c:import url="header-content-dashboard.jsp"></c:import>
                <div class="row my-5">
                    <c:if test="${empty courseOrders}">
                        <p>Bạn chưa đăng kí khoá học nào tại hệ thống</p>
                    </c:if>
                    <c:forEach items="${courseOrders}" var="courseOrders" varStatus="loop">
                    <div class="col-lg-6 mb-6">
                        <div class="card" style="width: 100%;">
                            <div class="card-body">
                                <div class="row card-head">
                                    <div class="col-md-4">
                                        <img src="${courseList.getAvatar()}">
                                    </div>
                                    <div class="col-md-8 ml-auto">
                                        <div class="category">
                                            <c:forEach items="${categoryList}" var="category">
                                                <c:if test="${category.getId() == courseOrders.course.getCourseLevelId()}">
                                                    <p class="text-right">${category.getName()}</p>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <h3>${courseOrders.getCourse().getName()}</h3>
                                    </div>
                                </div>
                                <p class="card-text">${courseOrders.getCourse().getDescription()}</p>
                                <div class="card-bottom">
                                    <div class="author"><i
                                            class="fa-solid fa-graduation-cap"></i> ${courseOrders.getCourse().getInstructor()}</div>
                                    <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>
                                </div>
                                <div class="info-course-buy">
                                    <div class="time-buy">
                                        <p class="mt-2">Bạn đã mua khoá học này với giá <span class="font-weight-bold">${courseOrders.getOrderPrice()} đ</span> vào <span class="font-weight-bold">${courseOrders.getOrderDate()} </span></p>
                                    </div>
                                    <a style="color: #FFFFFF" role="button" class="btn-login btn btn-primary" href="/learn?id=${courseOrders.getCourse().getId()}">Tiếp tục học</a>
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