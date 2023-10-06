<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-end">
    <div class="dropdown">
        <button class="btn-login btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            <c:if test="${empty sessionScope.user.getFullName()}">
                ${sessionScope.user.getUsername()}
            </c:if>
            <c:if test="${not empty sessionScope.user.getFullName()}">
                ${sessionScope.user.getFullName()}
            </c:if>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <c:if test="${sessionScope.user.getRole() == 'admin'}">
                <li><a class="dropdown-item" href="/dashboard">Dashboard</a></li>
                <li><a class="dropdown-item" href="/dashboard/course">Quản lý khóa học</a></li>
                <li><a class="dropdown-item" href="/dashboard/order">Quản lý đơn hàng</a></li>
                <li><a class="dropdown-item" href="/dashboard/member">Quản lý thành viên</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/user/logout">Đăng xuất</a></li>
            </c:if>
            <c:if test="${sessionScope.user.getRole() == 'user'}">
                <li><a class="dropdown-item" href="/dashboard/update">Thông tin của bạn</a></li>
                <li><a class="dropdown-item" href="/dashboard/order">Khoá học của bạn</a></li>
                <li><a class="dropdown-item" href="/dashboard/password">Đổi mật khẩu</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/user/logout">Đăng xuất</a></li>
            </c:if>
        </ul>
    </div>
</div>

