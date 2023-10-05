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
                        <p>Thêm mới học phần cho khóa học <span class="course-content-name">${course.getName()}</span></p>
                    </div>
                    <form class="edit-course-content" action="/dashboard/course/content/add" method="post">
                        <div class="mb-3">
                            <input type="hidden" name="id-course" value="${course.getId()}">
                            <label for="nameContent" class="form-label"><i class="fa-solid fa-book"></i> Tên học phần</label>
                            <input type="text" class="form-control" name="name-content" id="nameContent">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Mô tả cho học phần</label>
                            <textarea class="form-control" id="description" description="description" rows="3"></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>
