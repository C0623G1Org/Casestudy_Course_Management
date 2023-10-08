<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="/dashboard/admin-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard">
                <div class="header-content">
<%--                    <div class="hello">--%>
<%--                        <form class="row form-search-course g-2">--%>
<%--                            <div class="col-auto">--%>
<%--                                <input type="text" class="form-control" id="inputEmail"--%>
<%--                                       placeholder=" Nhập khóa học cần tìm">--%>
<%--                            </div>--%>
<%--                            <div class="col-auto">--%>
<%--                                <button type="submit" class="btn btn-primary">Tìm</button>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
                    <div class="user">
                      <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
                            <img class="rounded-circle me-1" width="35" height="35"
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg"
                                 alt="">${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="row edit-course mt-4 px-5" >
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">Thêm mới khóa học</h3>
                        <p>Thêm mới khóa hoc</p>
                    </div>
                    <form class="add-course edit-course-content" action="/dashboard/course/add" method="post">

                        <div class="mb-3">
                            <label for="name-course" class="form-label"><i class="fa-solid fa-book"></i> Tên khóa học</label>
                            <input type="text" class="form-control" name="name-course" id="name-course">
                        </div>

                        <div class="mb-3">
                            <label for="avatar-course" class="form-label"><i class="fa-solid fa-book"></i> Avatar</label>
                            <input type="text" class="form-control" name="avatar-course" id="avatar-course">
                        </div>

                        <div class="mb-3">
                            <label for="description-course" class="form-label"><i class="fa-solid fa-book"></i> Mô tả khóa học</label>
                            <textarea class="form-control" id="description-course" name="description-course" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="price-course" class="form-label"><i class="fa-solid fa-book"></i> Giá khóa học</label>
                            <input type="number" class="form-control" name="price-course" id="price-course">
                        </div>

                        <div class="mb-3">
                            <label for="knowledge" class="form-label"><i class="fa-solid fa-book"></i> Bạn sẽ học được gì?</label>
                            <textarea class="form-control" id="knowledge" name="knowledge" rows="5"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="requirements" class="form-label"><i class="fa-solid fa-book"></i> Yêu cầu</label>
                            <textarea class="form-control" id="requirements" name="requirements" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="instructor" class="form-label"><i class="fa-solid fa-book"></i> Tác giả</label>
                            <input type="text" class="form-control" name="instructor" id="instructor">
                        </div>

                        <div class="mb-3">
                            <label for="course-inclusion" class="form-label"><i class="fa-solid fa-book"></i> Thông tin khác</label>
                            <textarea class="form-control" id="course-inclusion" name="course-inclusion" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="course-level" class="form-label"><i class="fa-solid fa-rectangle-list"></i>Mức độ</label>
                            <select class="form-select form-control" id="course-level" name="course-level">
                                <c:forEach items="${categoryList}" var="categoryList" varStatus="loop">
                                    <option value="${categoryList.getId()}">${categoryList.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>