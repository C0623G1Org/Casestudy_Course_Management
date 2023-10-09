<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
<c:import url="/dashboard/admin-siderbar.jsp"></c:import>
            <div class="col-xl-9 col-lg-12 content-dashboard">
                <div class="mb-5">
                    <c:import url="/dashboard/header-content-dashboard.jsp"></c:import>
                </div>
                <div class="row edit-course mt-4 px-5" >
                    <c:if test="${not empty messegeError}">
                        <div class="alert alert-danger" role="alert">
                                ${messegeError}
                        </div>
                    </c:if>
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">Thêm mới khóa học</h3>
                        <p>Thêm mới khóa hoc</p>
                    </div>
                    <form class="add-course edit-course-content" action="/dashboard/course/add" method="post">

                        <div class="mb-3">
                            <label for="name-course" class="form-label"><i class="fa-solid fa-book"></i> Tên khóa học</label>
                            <input type="text" class="form-control" name="name-course" id="name-course" value="${courseName}">
                        </div>

                        <div class="mb-3">
                            <label for="avatar-course" class="form-label"><i class="fa-solid fa-book"></i> Avatar</label>
                            <input type="text" class="form-control" name="avatar-course" id="avatar-course" value="${avatar}">
                        </div>

                        <div class="mb-3">
                            <label for="description-course" class="form-label"><i class="fa-solid fa-book"></i> Mô tả khóa học</label>
                            <textarea class="form-control" id="description-course" name="description-course" rows="3">${descriptionCourse}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="price-course" class="form-label"><i class="fa-solid fa-book"></i> Giá khóa học</label>
                            <input type="text" class="form-control" name="price-course" id="price-course" value="${priceCourse}">
                        </div>

                        <div class="mb-3">
                            <label for="knowledge" class="form-label"><i class="fa-solid fa-book"></i> Bạn sẽ học được gì?</label>
                            <textarea class="form-control" id="knowledge" name="knowledge" rows="5">${knowledge}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="requirements" class="form-label"><i class="fa-solid fa-book"></i> Yêu cầu</label>
                            <textarea class="form-control" id="requirements" name="requirements" rows="3">
                                ${requirements}
                            </textarea>
                        </div>

                        <div class="mb-3">
                            <label for="instructor" class="form-label"><i class="fa-solid fa-book"></i> Tác giả</label>
                            <input type="text" class="form-control" name="instructor" id="instructor" value="${instructor}">
                        </div>

                        <div class="mb-3">
                            <label for="course-inclusion" class="form-label"><i class="fa-solid fa-book"></i> Thông tin khác</label>
                            <textarea class="form-control" id="course-inclusion" name="course-inclusion" rows="3">${courseInclusion}</textarea>
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