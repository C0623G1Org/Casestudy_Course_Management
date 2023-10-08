<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/2/2023
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"></c:import>
<section>
    <div class="container">
        <form action="/checkout" method="post" role="form"
              class="mt-md-5 check-out add-course edit-course-content">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <h3 style="font-weight: bold">Thông tin khách hàng</h3>
                    <div class="mb-3">
                        <label for="nameBC"><i class="fa-solid fa-user"></i> Họ và tên của bạn*</label>
                        <input type="text" class="form-control" id="nameBC" placeholder="Vui lòng nhập tên"
                               value="${user.getFullName()}">
                    </div>
                    <div class="mb-3">
                        <label for="numberphoneBC"><i class="fa-solid fa-phone"></i> Số điện thoại của bạn*</label>
                        <input type="text" class="form-control" id="numberphoneBC"
                               placeholder="Vui lòng nhập số điện thoại" value="${user.getPhone()}">
                    </div>
                    <div class="mb-3">
                        <label for="EmailBC"><i class="fa-solid fa-envelope"></i> Email của bạn*</label>
                        <input type="text" class="form-control" id="EmailBC" placeholder="Vui lòng nhập email"
                               value="${user.getEmail()}">
                    </div>
                    <div class="mb-3">
<%--                        <p>(Nếu email của bạn chưa có trên hệ thống, chúng tôi sẽ dùng Email thanh toán này để tạo tài--%>
<%--                            khoản. Nhằm mục đích lưu trữ trông tin để phục vụ cho việc học tập của bạn)</p>--%>
                    </div>
                </div>

                <div class="col-lg-6 col-md-12 item-order">
                    <h3 style="font-weight: bold">Chi tiết thanh toán</h3>
<%--                    <div class="row">--%>
<%--                        <div class="col-md-12 mt-2"><h5>Chi tiết thanh toán</h5></div>--%>
<%--                    </div>--%>
                    <div class="row">
                        <div class="col-lg-9 col-md-6 ava-border d-flex">
                            <div class="img">
                                <img src="${course.getAvatar()}" width="120p" height="100">
                            </div>
                            <div class="info-course d-lg-flex">
                                <input type="hidden" name="id-course" value="${course.getId()}">
                                <input type="hidden" name="id-user" value="${sessionScope.user.getId()}">
                                <h5 style="font-weight: bold">${course.getName()}</h5>
                                <p>${course.getDescription()}</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <p style="font-size: 25px; font-weight: bold; text-align: right">${course.getPrice()} VND</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-10"><p>Mã giảm giá</p></div>
                        <div class="col-md-2"><p style="text-align: right">10%</p></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-size: 30px; font-weight: bold; margin-bottom: 0">Thành tiền</p></div>
                        <div class="col-md-6" style="text-align: right">
                            <input type="hidden" name="price-order" value="${course.getPrice()}">
                            <p style="font-size: 25px; font-weight: bold">${course.getPrice()} VND</p><br/>
                            <p>(Đã bao gồm VAT)</p>
<%--                            <p>Ngày đặt mua: ${localDate}</p>--%>
                            <input type="hidden" name="date-order" value="${localDate}">

<%--                            <p>Mã đơn hàng: #${code}</p>--%>
                            <input type="hidden" name="code-order" value="${code}">
                        </div>
                    </div>
                    <hr>
                    <div class="row payment">
                        <div class="col-lg-12">
                            <p style="font-size: 30px; font-weight: bold">Phương thức thanh toán</p>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment-methods" value="select-1" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1" checked>
                                    Chuyển khoản qua thẻ ngân hàng
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment-methods" value="select-2" id="flexRadioDefault2">
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Thanh toán qua thẻ tín dụng
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button type="submit" class="btn btn-primary">Thanh toán</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<c:import url="footer.jsp"></c:import>

git