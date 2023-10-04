<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/3/2023
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
            <p style="font-size: 25px; font-weight: bold">1.080.000 VNĐ</p><br/>
            <p>(VAT included if applicable)</p>
        </div>
    </div>
    <%--                    test--%>

    <div class="row">
        <p style="font-size: 30px; font-weight: bold">Phương thức thanh toán</p>
        <p><input type="radio" name="payment-methods" value="select-1"> Chuyển khoản qua thẻ ngân hàng</p><br/>
        <p><input type="radio" name="payment-methods" value="select-2"> Thanh toán qua thẻ tín dụng</p><br/>
    </div>
    <div class="row">
        <button type="submit" class="btn btn-outline-primary">Thanh toán</button>
    </div>
</div>

</body>
</html>
