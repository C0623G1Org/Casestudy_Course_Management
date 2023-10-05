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
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg"
                                 alt="">${user.getFullName()}
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

                <div class="body-content">
                    <c:forEach items="${courseList}" var="courseList">
                        <div class="card mb-3" style="width: 100%;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <img src="../public/image/Rectangle 43.png">
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
                                <th class="text-center" scope="col"><i class="fa-solid fa-arrow-down-wide-short"></i>Mã đơn
                                    hàng
                                </th>
                                <th class="text-center" scope="col">Tình trạng</th>
                                <th class="text-center" scope="col">Chi tiết đơn hàng</th>
                                <th class="text-center" scope="col">Tên học viên</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${courseOrderInfList}" var="order">
                                <tr>
                                    <th scope="row"><a href="/course-order-servlet?action=show_detail_order&orderId=${order.getOrderId()}">${order.getOrderCode()}</a></th>
                                    <td class="done">
                                        <div class="done-content"><i class="fa-solid fa-check"></i>${order.getStatus()}</div>
                                    </td>
                                    <td>${order.getCourseName()}</td>
                                    <td>${order.getFullName()}</td>
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
