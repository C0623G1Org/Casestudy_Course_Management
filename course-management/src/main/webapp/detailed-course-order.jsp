<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/4/2023
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="/dashboard/admin-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard">
                <div class="mb-5">
                    <c:import url="dashboard/header-content-dashboard.jsp"></c:import>
                </div>

                <div class="order-detail">
                    <div style="padding-bottom: 30px; padding-left: 30px;" class="row content-oder-detain-2">
                        <div class="col-lg-12">
                            <h4 style="font-weight: bold">Đơn đặt mua khóa học ${order.getOrderCode()}</h4>
                            <p>Chi tiết về đơn đặt mua khóa học ${order.getOrderCode()} </p>
                            <c:if test="${order.getStatus() == 'success'}">
                                <div class="status-order"><span class="badge rounded-pill bg-success"><i
                                        class="fa-solid fa-check"></i> Đã hoàn thành</span></div>
                            </c:if>
                            <c:if test="${order.getStatus() == 'cancel'}">
                                <div class="status-order"><span class="badge rounded-pill bg-danger"><i
                                        class="fa-solid fa-ban"></i> Đã hủy</span></div>
                            </c:if>
                            <c:if test="${order.getStatus() == 'pending'}">
                                <div class="status-order"><span class="badge rounded-pill bg-secondary"><i
                                        class="fa-solid fa-cloud-arrow-down"></i> Đang xử lí</span></div>
                            </c:if>
                        </div>
                    </div>
                    <div class="row content-oder-detain-2">
                        <h5 style="font-weight: bold;padding-bottom: 30px; padding-left: 30px">Thông tin khách hàng</h5>
                    </div>
                    <div class="row content-oder-detain-1 mb-3" style="padding-left: 30px">
                        <div class="col-lg-12">
                            <p style="padding-left: 20px"><i class="fa-solid fa-user" style="color: #0a58ca"></i> Họ tên
                                khách hàng: <b>${order.getUser().getFullName()}</b></p>
                            <p style="padding-left: 20px"><i class="fa-solid fa-phone" style="color: #0a58ca"></i> Số
                                điện thoại khách hàng: <b> ${order.getUser().getPhone()}</b></p>
                            <p style="padding-left: 20px"><i class="fa-solid fa-envelope" style="color: #0a58ca"></i>
                                Email khách hàng: <b>${order.getUser().getEmail()}</b></p>
                        </div>
                    </div>
                    <div class="row content-oder-detain-2">
                        <h5 style="font-weight: bold;padding-bottom: 30px; padding-left: 30px">Item Ordered</h5>
                    </div>
                    <div class="${courseList.getAvatar()}"
                         style="padding-left: 30px;padding-bottom: 30px;display: flex;">
                        <div class="col-lg-9 box-item d-flex justify-content-around">
                            <div class="img">
                                <img src="${order.getCourse().getAvatar()}" height="100" width="200">
                            </div>
                            <div class="info-item">
                                <h5 style="font-weight: bold">${order.getCourse().getName()}</h5>
                                <p>${order.getCourse().getDescription()}</p>
                            </div>
                        </div>
                        <div class="col-lg 3 price-item">
                            <h5 style="text-align: right;font-weight: bold">${order.getCourse().getPrice()}</h5>
                        </div>
                    </div>
                    <hr>
                    <div class="row content-oder-detain-4 mb-3">
                        <div class="col-lg-12 d-flex justify-content-between">
                            <h5 style="padding-left: 30px">Discount</h5>
                            <h5>10%</h5>
                        </div>
                    </div>
                    <div class="row content-oder-detain-5">
                        <div class="col-lg-12 d-flex justify-content-between">
                            <h5 style="padding-left: 30px; font-weight: bold">Total</h5>
                            <h6 style="font-weight: bold">${order.getOrderPrice()}</h6>
                        </div>
                    </div>
                    <div class="row content-oder-detain-6">
                        <i style="padding-left: 30px;padding-bottom: 30px;color: #666;">Khách hàng thanh toán qua chuyển khoản ngân hàng</i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>
