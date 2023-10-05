<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header-dashboard.jsp"></c:import>
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
                <div class="header-content mt-5">
                    <div class="hello">
                        <h3>Đơn hàng</h3>
                        <p>Danh sách đơn hàng</p>
                    </div>
                </div>
                <div class="mt-4 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th style="width: 150px" class="text-center" scope="col"><i
                                        class="fa-solid fa-arrow-down-wide-short"></i>Đơn hàng
                                </th>
                                <th class="text-center" scope="col">Tình trạng</th>
                                <th class="text-center" scope="col">Chi tiết đơn hàng</th>
                                <th class="text-center" scope="col">Tên học viên</th>
                                <th class="text-center" scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${courseOrderInfList}" var="order">
                                <tr>
                                    <th scope="row">${order.getOrderCode()}</th>
                                    <td class="done">
                                        <div class="done-content"><i class="fa-solid fa-check"></i>${order.getStatus()}
                                        </div>
                                    </td>
                                    <td>${order.getCourseName()}</td>
                                    <td>${order.getFullName()}</td>
                                    <td class="action-course d-flex justify-content-between">
                                        <a role="button" class="btn btn-primary learn btn-content mb-1"
                                           href="/course-order-servlet?action=show_detail_order&orderId=${order.getOrderId()}">Xem</a>
                                        <a role="button" class="btn btn-primary edit btn-content mb-1" href="#">Sửa</a>
                                        <a role="button" class="btn btn-primary delete btn-content mb-1" href="#">Xóa</a>
                                    </td>
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
<c:import url="footer-dashboard.jsp"></c:import>