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
                    <button type="button" class="btn btn-info"><i class="fa-solid fa-plus"></i></i>Thêm mới khóa học</button>
                </div>


                <div class="mt-5 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col"><i class="fa-solid fa-arrow-down-wide-short"></i>ID</th>
                                <th class="text-center" scope="col">Tên khóa học</th>
                                <th class="text-center" scope="col">Author</th>
                                <th class="text-center" scope="col">Ngày xuất bản</th>
                                <th class="text-center" scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td><img src="../public/image/Course JV.png" height="20" width="20"/> Javascript Foudatament</td>
                                <td class="done">
                                    <div class="done-content"><i class="fa-solid fa-user-graduate"></i>ThanhPV</div>
                                </td>
                                <td>24-09-2023</td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle operation" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Xem khóa học</a></li>
                                            <li><a class="dropdown-item" href="#">Thêm học phần</a></li>
                                            <li><a class="dropdown-item" href="#">Xóa khóa học</a></li>
                                            <li><a class="dropdown-item" href="#">Chỉnh sửa khóa học</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="../public/image/Course SQl.png" height="20" width="20"/>   Basic SQL Tutorial</td>
                                <td class="done">
                                    <div class="done-content"><i class="fa-solid fa-user-graduate"></i>AnHN</div>
                                </td>
                                <td>24-09-2023</td>
                                <td >
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle operation" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Xem khóa học</a></li>
                                            <li><a class="dropdown-item" href="#">Thêm học phần</a></li>
                                            <li><a class="dropdown-item" href="#">Xóa khóa học</a></li>
                                            <li><a class="dropdown-item" href="#">Chỉnh sửa khóa học</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer-dashboard.jsp"></c:import>