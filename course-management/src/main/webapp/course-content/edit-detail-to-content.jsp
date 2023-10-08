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
                        <h3 style="font-weight: bold">${detailedContent.getTitle()}</h3>
                        <p>Chỉnh sửa <span class="course-content-name">${detailedContent.getTitle()}</span></p>
                    </div>
                    <form class="edit-course-content" action="/dashboard/course/content/detail/edit" method="post">
                        <input type="hidden" name="course-detail-id" value="${detailedContent.getId()}">
                        <input type="hidden" name="course-content-id" value="${courseContent.getId()}">
                        <div class="mb-3">
                            <label for="nameContent" class="form-label"><i class="fa-solid fa-book"></i> Tiêu đề</label>
                            <input type="text" class="form-control" name="name-detail" id="nameContent" value="${detailedContent.getTitle()}">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Nội dung</label>
                            <textarea class="form-control" id="description" name="description-detail" description="description" rows="3">${detailedContent.getContent()}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="id-video" class="form-label"><i class="fa-solid fa-rectangle-list"></i> ID Video (nếu có)</label>
                            <input type="text" class="form-control" id="id-video" name="id-video" value="${detailedContent.getIdVideo()}">
                        </div>
                        <div class="mb-3">
                            <label for="content-type" class="form-label"><i class="fa-solid fa-rectangle-list"></i> Loại bài học</label>
                            <select name="content-type" id="content-type" required class="form-select form-control">
                                <c:forEach items="${contentTypes}" var="contentTypes" varStatus="loop">
                                    <option <c:if test="${detailedContent.getCourseContentTypeId() == contentTypes.getId()}">selected</c:if> value="${contentTypes.getId()}">${contentTypes.getName()}</option>
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