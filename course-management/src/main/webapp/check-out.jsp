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
        <div class="row row-1 px-md-3">
            <div class="col-lg-4 col-md-12 rounded border border-1">
                <div class="p-3 icon-margin">
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
                        <h1>#${courseOrder.getOrderCode()}</h1>
                        <hr>
                    </div>

                    <div class="row">
                        <h4 class="my-3"><i class="fa-solid fa-money-bill"></i>Số tiền</h4>
                        <input type="hidden" name="id" value="${course.getId()}">
                        <h1>${course.getPrice()}VND</h1>
                        <hr>
                    </div>

                    <%--                    <div class="row">--%>
                    <%--                        <h4 class="my-3"><i class="fa-solid fa-lightbulb"></i>Trạng thái</h4>--%>
                    <%--                        <h1>${courseOrder.getStatus()}</h1>--%>
                    <%--                    </div>--%>
                </div>

            </div>
            <div class="col-lg-8 col-md-12">
                <div class="m-5">
                    <img style="width: 100%" src="../public/image/Rectangle%20522.png"/>
                    <div class="status">
<%--                        <a href="/checkout/success?id=${courseOrder.getOrderCode()}&course-id=${course.getId()}">--%>
<%--                            <button type="submit" name="accept">Chấp nhận thanh toán</button>--%>
<%--                        </a>--%>

                        <a id="status" role="button" onclick="displayModalAccept('${courseOrder.getOrderCode()}')"
                           class="btn btn-dark delete btn-content mt-3 mb-1" data-bs-toggle="modal"
                           data-bs-target="#exampleModal">Chấp nhận thanh toán</a>

<%--                        <a href="/checkout/cancel?id=${courseOrder.getOrderCode()}">--%>
<%--                            <button type="submit" name="cancel">Hủy</button>--%>
<%--                        </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Chấp nhận thanh toán</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="modal-body-detail-delete"class="modal-body"></div>
            <div class="modal-footer">
                <a role="button" href="/checkout/success?id=${courseOrder.getOrderCode()}&course-id=${course.getId()}" id="deleteDetailContent" class="btn btn-primary">Chấp nhận</a>
                <a role="button" href="/checkout/cancel?id=${courseOrder.getOrderCode()}" class="btn btn-secondary btn-primary" data-bs-dismiss="modal">Hủy</a>
            </div>
        </div>
    </div>
</div>
<script>
    function displayModalAccept(code) {
        document.getElementById("modal-body-detail-delete").innerHTML = "Bạn có chấp nhận thanh toán đơn hàng <span class='course-content-name'>"+ "#"+code + "</span> ?";
        // document.getElementById("deleteDetailContent").setAttribute("href", "/checkout/success?id="+id);
    }
</script>
<c:import url="footer.jsp"></c:import>