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
                        <h3>Danh sách khóa học</h3>
                        <p>Danh sách khóa học tại LTTA.co</p>
                    </div>
                </div>

                <div class="mt-2 view-detail-course-bg">
                    <a href="/dashboard/course/add" role="button" class="btn btn-primary btn-sm add-detail-content" ><i class="fa-solid fa-plus"></i> <span>Thêm mới nội dung học</span></a>
                </div>


                <div class="mt-5 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col"><i class="fa-solid fa-arrow-down-wide-short"></i>ID</th>
                                <th class="text-center" scope="col">Tên khóa học</th>
                                <th class="text-center" scope="col">Instructor</th>
                                <th class="text-center" scope="col">Giá tiền</th>
                                <th class="text-center" scope="col" colspan="3">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${courses}" var="courses" varStatus="loop">
                                    <tr>
                                        <td>${courses.getId()}</td>
                                        <td>${courses.getName()}</td>
                                        <td>${courses.getInstructor()}</td>
                                        <td>${courses.getPrice()}</td>
                                        <td class="action-course d-flex justify-content-between">
                                                <a role="button" class="btn btn-primary learn btn-content mb-1" href="/course/detail?id=${courses.getId()}">Xem</a>
                                                <a role="button" class="btn btn-primary edit btn-content mb-1" href="#">Sửa</a>
                                                <a role="button" class="btn btn-primary delete btn-content mb-1" href="#">Xóa</a>
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