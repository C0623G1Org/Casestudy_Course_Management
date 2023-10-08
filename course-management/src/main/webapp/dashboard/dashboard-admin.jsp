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
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
                </div>
                <div class="body-content">
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
                                <th class="text-center" scope="col">Mã đơn hàng</th>
                                <th class="text-center" scope="col">Tình trạng</th>
                                <th class="text-center" scope="col">Tên khóa học</th>
                                <th class="text-center" scope="col">Người mua</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${courseOrdersNow}" var="courseOrdersNow">
                                <tr class="none-underline-code">
                                    <th scope="row"><a href="/dashboard/order/detail?order-id=${courseOrdersNow.getOrderId()}">#${courseOrdersNow.getOrderCode()}</a></th>
                                    <td class="done">
                                        <c:if test="${courseOrdersNow.getStatus() == 'success'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-success"><i class="fa-solid fa-check"></i>Đã hoàn thành</span></div>
                                        </c:if>
                                        <c:if test="${courseOrdersNow.getStatus() == 'cancel'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-danger"><i class="fa-solid fa-ban"></i>Đã hủy</span></div>
                                        </c:if>
                                        <c:if test="${courseOrdersNow.getStatus() == 'pending'}">
                                            <div class="status-order"><span class="badge rounded-pill bg-secondary"><i class="fa-solid fa-cloud-arrow-down"></i>Đang xử lí</span></div>
                                        </c:if>
                                    </td>
                                    <td>${courseOrdersNow.getCourse().getName()}</td>
                                    <td>${courseOrdersNow.getUser().getUsername()}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation example" class="mt-3">
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${endPage}" var="page">
                                <li class="page-item"><a class="page-link" href="/dashboard/order?currentPage=${page}">${page}</a> </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../dashboard/footer-dashboard.jsp"></c:import>
