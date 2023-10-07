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
                            <img class="rounded-circle me-1" width="35" height="35"
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg"
                                 alt="">${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="row edit-course mt-4 px-5">
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">Chỉnh sửa khóa học</h3>
                        <p>Chỉnh sửa khóa học ${course.getName()}</p>
                    </div>
                    <form class="add-course edit-course-content" action="/dashboard/course/edit" method="post">
                        <input type="hidden" name="id-course" value="${course.getId()}">
                        <div class="mb-3">
                            <label for="name-course" class="form-label"><i class="fa-solid fa-book"></i> Tên khóa
                                học</label>
                            <input type="text" class="form-control" name="name-course" id="name-course"
                                   value="${course.getName()}">
                        </div>
                        <div class="mb-3">
                            <label for="avatar-course" class="form-label"><i class="fa-solid fa-book"></i> Avatar</label>
                            <input type="text" class="form-control" name="avatar-course" id="avatar-course"
                                   value="${course.getAvatar()}">
                        </div>

                        <div class="mb-3">
                            <label for="description-course" class="form-label"><i class="fa-solid fa-book"></i> Mô tả
                                khóa học</label>
                            <textarea class="form-control" id="description-course" name="description-course" rows="3">
                                ${course.getDescription()}
                            </textarea>
                        </div>

                        <div class="mb-3">
                            <label for="price-course" class="form-label"><i class="fa-solid fa-book"></i> Giá khóa
                                học</label>
                            <input type="text" class="form-control" name="price-course" id="price-course"
                                   value=" ${course.getPrice()}">
                        </div>

                        <div class="mb-3">
                            <label for="knowledge" class="form-label"><i class="fa-solid fa-book"></i> Bạn sẽ học được
                                gì?</label>
                            <textarea class="form-control" id="knowledge" name="knowledge" rows="5">
                                ${course.getKnowledge()}
                            </textarea>
                        </div>

                        <div class="mb-3">
                            <label for="requirements" class="form-label"><i class="fa-solid fa-book"></i> Yêu
                                cầu</label>
                            <textarea class="form-control" id="requirements" name="requirements" rows="3">
                                ${course.getKnowledge()}
                            </textarea>
                        </div>

                        <div class="mb-3">
                            <label for="instructor" class="form-label"><i class="fa-solid fa-book"></i> Tác giả</label>
                            <input type="text" class="form-control" name="instructor" id="instructor"
                                   value="${course.getInstructor()}">
                        </div>

                        <div class="mb-3">
                            <label for="course-inclusion" class="form-label"><i class="fa-solid fa-book"></i> Thông tin
                                khác</label>
                            <textarea class="form-control" id="course-inclusion" name="course-inclusion" rows="3">
                                ${course.getCourseInclusion()}
                            </textarea>
                        </div>

                        <div class="mb-3">
                            <label for="course-level" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Course Level</label>
                            <select class="form-select form-control" id="course-level" name="course-level">
                                <c:forEach items="${categoryList}" var="categoryList" varStatus="loop">
                                    <option value="${categoryList.getId()}">${categoryList.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="row content-edit-course p-5">
                    <div class="content-detail-list">
                        <h3>Học phần</h3>
                        <p>Các học phần trong khóa học ${course.getName()}</p>
                        <a href="/dashboard/course/content/add?id=${course.getId()}" role="button"
                           class="btn btn-primary btn-sm add-detail-content"><i class="fa-solid fa-plus"></i> <span>Thêm mới nội dung học</span></a>
                    </div>
                    <c:forEach items="${courseContents}" var="courseContents" varStatus="loop">
                        <div class="container mt-3">
                            <div class="row course-detail">
                                <div class="col-9">
                                    <h3>${courseContents.getName()}</h3>
                                        <%--                                    <p>${detailedContents.getContent()}</p>--%>
                                </div>
                                <div class="col-3">
                                    <div class="d-flex justify-content-between">
                                        <a href="/learn?id=${courseContents.getId()}"
                                           role="button" class="btn btn-primary learn btn-content mb-1">Xem</a>
                                        <a href="/dashboard/course/content?id=${courseContents.getId()}"
                                           role="button" class="btn btn-primary edit btn-content mb-1">Sửa</a>
                                        <a role="button"
                                           onclick="displayModalDelete('${courseContents.getId()}','${courseContents.getName()}')"
                                           class="btn btn-primary delete btn-content mb-1" data-bs-toggle="modal"
                                           data-bs-target="#exampleModal">
                                            Xóa
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a id="deleteDetailContent" role="button" class="btn btn-danger">Xóa</a>
            </div>
        </div>
    </div>
</div>
<script>
    function displayModalDelete(id,title) {
        document.getElementById("modal-body-detail-delete").innerHTML = "Bạn có chắc chắn muốn xóa bài học <span class='course-content-name'>"+ title + "</span> không ?";
        document.getElementById("deleteDetailContent").setAttribute("href", "/dashboard/course/content/delete?id="+id);
    }
</script>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>
