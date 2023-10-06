<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="admin-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard">
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
                </div>
                <div class="body-content">
                    <c:forEach items="${courseList}" var="courseList">
                        <div class="card mb-3" style="width: 100%;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <img src="${courseList.getAvatar()}">
                                    </div>
                                    <div class="col-10">
                                        <div class="row">
                                            <div class="col-7">
                                                <h4>${courseList.getName()}</h4>
                                            </div>
                                            <div class="col-5">
                                                <div class="row">
                                                    <div class="col-7 category">
                                                        <p class="text-right">Javascript
                                                        </p>
                                                    </div>
                                                    <div class="col-5 category">
                                                        <p class="text-right"><i class="fa-solid fa-star"></i>4.8
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="body-1">
                                                <div>
                                                    <p>Author</p>
                                                </div>

                                                <div>
                                                    <p><i class="fa-regular fa-user"></i>${courseList.getInstructor()}
                                                    </p>
                                                </div>

                                                <div>
                                                    <p><i class="fa-regular fa-clock"></i>24h 12m</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-solid fa-users"></i>1523</p>
                                                </div>
                                                <div>
                                                    <p>25 học phần</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-solid fa-video"></i>70 bài giảng</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-regular fa-file"></i>120 bài đọc</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-regular fa-star"></i>50 bài tập</p>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="mt-5 body-content-2">
                    <div>
                        <h3>Đăng kí khóa học hôm nay</h3>
                        <p class="mt-3">Các đơn đăng kí khóa học mới trong hôm nay</p>
                    </div>
                </div>
                <div class="mt-4 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col">Mã đơn hàng</th>
                                <th class="text-center" scope="col">Tình trạng</th>
                                <th class="text-center" scope="col">Tên khóa học</th>
                                <th class="text-center" scope="col">Người mua</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${courseOrdersNow}" var="courseOrdersNow">
                                <tr>
                                    <th scope="row"><a href="/dashboard/order/detail?order-id=${courseOrdersNow.getOrderId()}">${courseOrdersNow.getOrderCode()}</a></th>
                                    <td class="done">
                                        <c:if test="${courseOrdersNow.getStatus() == 'success'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-success"><i class="fa-solid fa-check"></i>Đã hoàn thành</span></div>
                                        </c:if>
                                        <c:if test="${courseOrdersNow.getStatus() == 'cancel'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-danger"><i class="fa-solid fa-ban"></i>Đã hủy</span></div>
                                        </c:if>
                                        <c:if test="${courseOrdersNow.getStatus() == 'pending'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-secondary"><i class="fa-solid fa-cloud-arrow-down"></i>Đang xử lí</span></div>
                                        </c:if>
                                    </td>
                                    <td>${courseOrdersNow.getCourse().getName()}</td>
                                    <td>${courseOrdersNow.getUser().getUsername()}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../dashboard/footer-dashboard.jsp"></c:import>
