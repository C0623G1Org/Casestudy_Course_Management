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
                <div class="header-content">
                    <div class="hello">
                        <form class="row form-search-course g-2">
                            <div class="col-auto">
                                <input type="text" class="form-control" id="inputEmail"
                                       placeholder=" Nhập khóa học cần tìm">
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary">Tìm</button>
                            </div>
                        </form>
                    </div>
                    <div class="user">
                       <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
                            <img class="rounded-circle me-1" width="35" height="35" src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg" alt="">${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="header-content mt-5">
                    <div class="hello">
                        <h3>Thành viên</h3>
                        <p>Danh sách thành viên</p>
                    </div>
                </div>
                <div class="mt-4 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col"><i class="fa-solid fa-arrow-down-wide-short"></i>ID</th>
                                <th class="text-center" scope="col">Username</th>
                                <th class="text-center" scope="col">Tên hiển thị</th>
                                <th class="text-center" scope="col">Email</th>
                                <th  class="text-center" scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="user" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.count}</th>
                                    <td>${user.getUsername()}</td>
                                    <td>${user.getFullName()}</td>
                                    <td>${user.getEmail()}</td>
                                    <td>
                                        <div class="row">
                                            <div class="col-4 button-add-update-delete">
                                                <a role="button" class="btn btn-success" href="/dashboard/member/view?id=${user.getId()}"><i class="fa-solid fa-pen"></i> Xem</a>
                                            </div>
                                            <div class="col-4 button-add-update-delete">
                                                <a role="button" class="btn btn-warning" href="/dashboard/member/edit?id=${user.getId()}"><i class="fa-solid fa-pen"></i> Sửa</a>
                                            </div>
                                            <div class="col-4 button-add-update-delete">
                                                <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i>Xóa</button>
                                            </div>
                                        </div>
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