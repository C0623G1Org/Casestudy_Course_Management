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
        <form action="/course-purchase-servlet?action=check-out&id=${course.getId()}" method="post" role="form"
              class="check-out">
            <div class="row">
                <div class="col-md-6">
                    <h3 style="font-weight: bold">Thông tin khách hàng</h3>
                    <div class="form-group my-3">
                        <label for="nameBC"><i class="fa-solid fa-user"></i> Họ và tên của bạn*</label>
                        <input type="text" class="form-control" id="nameBC" placeholder="Vui lòng nhập tên"
                               value="${user.getFullName()}">
                    </div>
                    <div class="form-group my-3">
                        <label for="numberphoneBC"><i class="fa-solid fa-phone"></i> Số điện thoại của bạn*</label>
                        <input type="text" class="form-control" id="numberphoneBC"
                               placeholder="Vui lòng nhập số điện thoại" value="${user.getPhone()}">
                    </div>
                    <div class="form-group my-3">
                        <label for="EmailBC"><i class="fa-solid fa-envelope"></i> Email của bạn*</label>
                        <input type="text" class="form-control" id="EmailBC" placeholder="Vui lòng nhập email"
                               value="${user.getEmail()}">
                    </div>
                    <p>(Nếu email của bạn chưa có trên hệ thống, chúng tôi sẽ dùng Email thanh toán này để tạo tài
                        khoản. Nhằm mục đích lưu trữ trông tin để phục vụ cho việc học tập của bạn)</p>
                </div>

                <div class="col-md-6">
                    <h3 style="font-weight: bold">Order Summary</h3>
                    <div class="row">
                        <div class="col-md-9"><h5>Order Summary</h5></div>
                        <div class="col-md-3" style="text-align: right"><i class="fa-solid fa-pen"></i> Edit</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <img src="../public/image/RectangleBC.png" width="120p" height="100">
                        </div>
                        <div class="col-md-6">
                            <input type="hidden" name="id" value="${course.getId()}">
                            <h5 style="font-weight: bold">${course.getName()}</h5>
                            <p>${course.getDescription()}</p>
                        </div>
                        <div class="col-md-3">
                            <p style="font-size: 25px; font-weight: bold; text-align: right">${course.getPrice()}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10"><p>Discount</p></div>
                        <div class="col-md-2"><p style="text-align: right">10%</p></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-size: 30px; font-weight: bold">Total</p></div>
                        <div class="col-md-6" style="text-align: right">
                            <%--                                tam thoi chua co discount--%>
                            <p style="font-size: 25px; font-weight: bold">${course.getPrice()}</p><br/>
                            <p>Ngày thanh toán: ${localDate}</p>
                                <p>Mã đơn hàng: ${code}</p>
                            <p>(VAT included if applicable)</p>
                        </div>
                    </div>
                    <%--                    test--%>

                    <div class="row">
                        <p style="font-size: 30px; font-weight: bold">Phương thức thanh toán</p>
                        <p><input type="radio" name="payment-methods" value="select-1"> Chuyển khoản qua thẻ ngân hàng
                        </p><br/>
                        <p><input type="radio" name="payment-methods" value="select-2"> Thanh toán qua thẻ tín dụng</p>
                        <br/>
                    </div>
                    <div class="row">
                        <button type="submit" class="btn btn-outline-primary">Thanh toán</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<%--<div>--%>
<%--    <c:forEach items="${loan}" var="courseItem">--%>
<%--        <p>ID: ${courseItem.id}</p>--%>
<%--        <p>Name: ${courseItem.name}</p>--%>
<%--        <p>Description: ${courseItem.description}</p>--%>
<%--        <p>Price: ${courseItem.price}</p>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<c:import url="footer.jsp"></c:import>

git