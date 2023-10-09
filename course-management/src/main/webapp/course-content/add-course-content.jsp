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
                </div>                <div class="row edit-course mt-4 px-5" >
                    <div class="row edit-course-1 ">
                        <h3 style="font-weight: bold">${course.getName()}</h3>
                        <p>Thêm mới học phần cho khóa học <span class="course-content-name">${course.getName()}</span></p>
                    </div>
                    <c:if test="${not empty messegeError}">
                        <div class="alert alert-danger" role="alert">
                                ${messegeError}
                        </div>
                    </c:if>
                    <form class="edit-course-content" action="/dashboard/course/content/add" method="post">
                        <div class="mb-3">
                            <input type="hidden" name="id-course" value="${course.getId()}">

                            <label for="nameContent" class="form-label"><i class="fa-solid fa-book"></i> Tên học phần</label>
                            <input type="text" class="form-control" name="name-content" id="nameContent">
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
