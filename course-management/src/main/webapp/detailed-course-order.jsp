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

                <div class="header-content my-5">
                    <div class="row content-oder-detail-1" style="padding-bottom: 10px; padding-left: 30px">
                        <h4 style="font-weight: bold">Đơn đặt mua khóa học ${courseOrderInf.getOrderCode()}</h4>
                        <p>Chi tiết về đơn đặt mua khóa học ${courseOrderInf.getOrderCode()} </p>
<%--                        <input type="hidden" name="orderId" value="${courseOrderInf.getOrderId()}">--%>
                        <p> <i class="fa-solid fa-check" style="color: #146c43"></i>${courseOrderInf.getStatus()}<i class="fa-solid fa-pen" style="color: #0a58ca;height: 30px"></i> edit</p>
                    </div>
                </div>
                <div class="row content-oder-detain-1" style="padding-left: 30px">
                    <div class="row content-oder-detail-1" style="padding-bottom: 30px; padding-left: 30px">
                        <h5 style="font-weight: bold;padding-bottom: 20px">Thông tin khách hàng</h5>
                        <p style="padding-left: 20px"><i class="fa-solid fa-user" style="color: #0a58ca"></i>  Họ tên khách hàng: <b>${courseOrderInf.getFullName()}</b></p>
                        <p style="padding-left: 20px"><i class="fa-solid fa-phone" style="color: #0a58ca"></i>  Số điện thoại khách hàng: <b> ${courseOrderInf.getPhone()}</b></p>
                        <p style="padding-left: 20px"><i class="fa-solid fa-envelope"style="color: #0a58ca"></i>  Email khách hàng: <b>${courseOrderInf.getEmail()}</b></p>
                    </div>
                </div>
                <div class="row content-oder-detain-2" style="padding-left: 30px">
                    <h5 style="font-weight: bold;padding-bottom: 30px; padding-left: 30px">Item Ordered</h5>
                </div>
                <div class="row content-oder-detain-3" style="padding-left: 30px;padding-bottom: 30px">
                    <div class="col-lg-3" style="padding-left: 30px">
                        <img src="../public/image/Rectangle 52.png" height="100" width="200">
                    </div>
                    <div class="col-lg-5">
                        <h5 style="font-weight: bold">${courseOrderInf.getCourseName()}</h5>
                        <p>${courseOrderInf.getShorDescription()}</p>
                    </div>
                    <div class="col-lg-4">
                        <h5 style="text-align: right;font-weight: bold">${courseOrderInf.getPrice()}</h5>
                    </div>
                    <hr>
                </div>
                <div class="row content-oder-detain-4" style="padding-left: 30px;padding-bottom: 30px">
                    <div class="col-lg-11">
                        <h5 style="padding-left: 30px" >Discount</h5>
                    </div>
                    <div class="col-lg-1">
                        <h5 >10%</h5>
                    </div>
                </div>
                <div class="row content-oder-detain-5" style="padding-left: 30px;padding-bottom: 30px">
                    <div class="col-lg-10">
                        <h5 style="padding-left: 30px; font-weight: bold" >Total</h5>
                    </div>
                    <div class="col-lg-2">
                        <h6 style="font-weight: bold">${courseOrderInf.getOrderPrice()}</h6>
                    </div>
                </div>
                <div class="row content-oder-detain-6" style="padding-left: 30px;padding-bottom: 30px">
                    <i style="padding-left: 30px">Khách hàng thanh toán qua chuyển khoản ngân hàng</i>
                </div>

            </div>
        </div>
    </div>
</section>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>
