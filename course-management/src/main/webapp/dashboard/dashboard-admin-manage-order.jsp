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
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
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
                                        <c:if test="${order.getStatus() == 'success'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-success"><i class="fa-solid fa-check"></i>Đã hoàn thành</span></div>
                                        </c:if>
                                        <c:if test="${order.getStatus() == 'cancel'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-danger"><i class="fa-solid fa-ban"></i>Đã hủy</span></div>
                                        </c:if>
                                        <c:if test="${order.getStatus() == 'pending'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-secondary"><i class="fa-solid fa-cloud-arrow-down"></i>Đang xử lí</span></div>
                                        </c:if>
                                    </td>
                                    <td>${order.getCourseName()}</td>
                                    <td>${order.getFullName()}</td>
                                    <td class="action-course d-flex justify-content-around">
                                        <a role="button" class="btn btn-primary learn btn-content mb-1"
                                           href="/dashboard/order/detail?order-id=${order.getOrderId()}">Xem</a>
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