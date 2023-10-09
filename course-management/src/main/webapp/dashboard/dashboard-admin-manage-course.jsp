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
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
                </div>
                <div class="header-content mt-5">
                    <div class="hello">
                        <h3>Danh sách khóa học</h3>
                        <p>Danh sách khóa học tại LTTA.co</p>
                    </div>
                </div>
                <div class="mt-2 view-detail-course-bg">
                    <a href="/dashboard/course/add" role="button" class="btn btn-primary btn-sm add-detail-content" ><i class="fa-solid fa-plus"></i> <span>Thêm mới khóa học</span></a>
                </div>


                <div class="mt-5 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col">ID</th>
                                <th class="text-center" scope="col">Tên khóa học</th>
                                <th class="text-center" scope="col">Mức độ</th>
                                <th class="text-center" scope="col">Giảng viên</th>
                                <th class="text-center" scope="col">Giá tiền</th>
                                <th class="text-center" scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${courses}" var="courses" varStatus="loop">
                                <tr>
                                    <td>${courses.getId()}</td>
                                    <td>${courses.getName()}</td>
                                    <c:forEach items="${categoryList}" var="category">
                                        <c:if test="${category.getId() == courses.getCourseLevelId()}">
                                            <td>${category.getName()}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td>${courses.getInstructor()}</td>
                                    <td>${courses.getPrice()} VND</td>
                                    <td class="action-course d-flex justify-content-around">
                                        <a role="button" class="btn btn-primary learn btn-content mb-1"
                                           href="/learn?id=${courses.getId()}">Xem</a>
                                        <a role="button" class="btn btn-primary edit btn-content mb-1"
                                           href="/dashboard/course/edit?id=${courses.getId()}">Sửa</a>
                                        <a role="button"
                                           onclick="displayModalDelete('${courses.getId()}','${courses.getName()}')"
                                           class="btn btn-primary delete btn-content mb-1" data-bs-toggle="modal"
                                           data-bs-target="#exampleModal">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation example" class="mt-3">
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${endPage}" var="page">
                                <li class="page-item"><a class="page-link" href="/dashboard/course?currentPage=${page}">${page}</a> </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Bạn có chắc chắn không?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="modal-body-detail-delete"class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <a id="deleteDetailContent" role="button" class="btn btn-danger">Xóa</a>
            </div>
        </div>
    </div>
</div>
<script>
    function displayModalDelete(id,title) {
        document.getElementById("modal-body-detail-delete").innerHTML = "Bạn có chắc chắn muốn xóa khóa học <span class='course-content-name'>"+ title + "</span> không ?";
        document.getElementById("deleteDetailContent").setAttribute("href", "/dashboard/course/delete?id="+id);
    }
</script>
<c:import url="footer-dashboard.jsp"></c:import>