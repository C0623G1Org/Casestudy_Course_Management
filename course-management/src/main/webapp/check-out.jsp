<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/3/2023
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"></c:import>
<section>
    <div class="container pay">
        <div class="title">
            <h1>Thông tin thanh toán</h1>
            <p class="mt-3">Thanh toán chuyển qua ngân hàng</p>
        </div>
        <hr style="margin-bottom: 30px">
        <div class="row row-1">
            <div class="col-4 rounded border border-1">
                <div class="p-3">
                    <h2>Thông tin người nhận</h2>
                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-user"></i>Chủ tài khoản</h4>
                        <h1>CTY TNHH LTTA.co</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-building-columns"></i>Số tài khoản</h4>
                        <h1>12345678910</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-building-columns"></i>Ngân hàng</h4>
                        <h1>Vietcombank</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-lightbulb"></i>Mã đơn hàng</h4>
                        <h1>${code}</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-money-bill"></i>Số tiền</h4>
                        <input type="hidden" name="id" value="${course.getId()}">
                        <h1>${course.getPrice()}</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-lightbulb"></i>Trạng thái</h4>
                        <h1>${code}</h1>

                    </div>
                </div>

            </div>
            <div class="col-8">
                <div class="m-5" >
                    <img style="width: 100%" src="../public/image/Rectangle%20522.png"/>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer.jsp"></c:import>