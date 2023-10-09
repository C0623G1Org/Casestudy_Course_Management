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
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">${courseContent.getName()}</h3>
                        <p>Thêm mới nội dung cho học phần: <a href="/dashboard/course/content?id=${courseContent.getId()}"><span class="course-content-name">${courseContent.getName()}</span></a></p>
                    </div>
                    <form class="edit-course-content" action="/dashboard/course/content/detail/add" method="post">
                        <input type="hidden" name="course-content-id" value="${courseContent.getId()}">
                        <div class="mb-3">
                            <label for="nameContent" class="form-label"><i class="fa-solid fa-book"></i> Tiêu đề</label>
                            <input type="text" class="form-control" name="name-detail" id="nameContent">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Nội dung</label>
                            <textarea class="form-control" id="description" name="description-detail" description="description" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="id-video" class="form-label"><i class="fa-solid fa-rectangle-list"></i> ID Video (nếu có)</label>
                            <input type="text" class="form-control" id="id-video" name="id-video" rows="3">
                        </div>
                        <div class="mb-3">
                            <label for="content-type" class="form-label"><i class="fa-solid fa-rectangle-list"></i>Loại bài học</label>
                            <select name="content-type" id="content-type" required class="form-select form-control">
                                <c:forEach items="${contentTypes}" var="contentTypes" varStatus="loop">
                                    <option value="${contentTypes.getId()}">${contentTypes.getName()}</option>
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