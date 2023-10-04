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
                <div class="row edit-course mt-4 px-5" >
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">${course.getName()}</h3>
                        <p>Chỉnh sửa học phần: <span class="course-content-name">${courseContent.getName()}</span></p>
                    </div>
                    <form class="edit-course-content" action="dashboard/course/content?id=${courseContent.getId()}" method="post">
                        <div class="mb-3">
                            <label for="nameContent" class="form-label"><i class="fa-solid fa-book"></i> Tên học phần</label>
                            <input type="text" class="form-control" name="nameContent" id="nameContent" value="${courseContent.getName()}">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Mô tả cho học phần</label>
                            <textarea class="form-control" id="description" description="description" rows="3">${courseContent.getName()}</textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="row content-edit-course p-5" >
                    <div class="content-detail-list">
                        <h3>Nội dung có trong học phần</h3>
                        <p>Danh sách nội dung có trong học phần ${courseContent.getName()}</p>
                        <a href="/dashboard/course/content/detail/add?id-content=${courseContent.getId()}" role="button" class="btn btn-primary btn-sm add-detail-content" ><i class="fa-solid fa-plus"></i> <span>Thêm mới nội dung học</span></a>
                    </div>
                    <c:forEach items="${detailedContents}" var="detailedContents" varStatus="loop">
                    <div class="container mt-3">
                        <div class="row course-detail">
                            <div class="col-9">
                                <h3><i class="fa-solid fa-video"></i> ${detailedContents.getTitle()}</h3>
                                <p>${detailedContents.getContent()}</p>
                            </div>
                            <div class="col-3">
                                <div class="d-flex justify-content-between">
                                    <c:if test="${detailedContents.getCourseContentTypeId() == 1}">
                                        <a href="/learn/lesson/?id=${course.getId()}&content-detail=${detailedContents.getId()}"
                                           role="button" class="btn btn-primary learn btn-content mb-1">Xem</a>
                                    </c:if>
                                    <c:if test="${detailedContents.getCourseContentTypeId() == 2}">
                                        <a href="/learn/reading/?id=${course.getId()}&content-detail=${detailedContents.getId()}"
                                           role="button" class="btn btn-primary learn btn-content mb-1">Xem</a>
                                    </c:if>
                                    <c:if test="${detailedContents.getCourseContentTypeId() == 3}">
                                        <a href="/learn/exercise/?id=${course.getId()}&content-detail=${detailedContents.getId()}"
                                           role="button" class="btn btn-primary learn btn-content mb-1">Xem</a>
                                    </c:if>
                                    <a href="/dashboard/course/content/detail/edit?id=${detailedContents.getId()}&content-id=${courseContent.getId()}" role="button" class="btn btn-primary edit btn-content mb-1">Sửa</a>
                                    <a role="button" onclick="displayModalDelete('${detailedContents.getId()}','${detailedContents.getTitle()}')" class="btn btn-primary delete btn-content mb-1" data-bs-toggle="modal" data-bs-target="#exampleModal">
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
        document.getElementById("deleteDetailContent").setAttribute("href", "/dashboard/course/content/detail/delete?id="+id);
    }
</script>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>
