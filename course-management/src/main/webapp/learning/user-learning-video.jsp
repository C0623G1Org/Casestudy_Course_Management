<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header-learning.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="siderbar-learning.jsp"></c:import>
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
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg" alt="">${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="intro-dashboard-page mt-5">
                    <h3>${course.getName()}</h3>
                    <p>${course.getDescription()}</p>
                </div>
                <div class="row content-course video my-3">
                    <div class="col-lg-12">
                        <c:if test="${not empty content.getIdVideo()}">
                            <div class="video-course mb-3">
                                <iframe width="100%" height="500px"
                                        src="https://www.youtube.com/embed/${content.getIdVideo()}"
                                        title="YouTube video player" frameborder="0"
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                        allowfullscreen></iframe>
                            </div>
                        </c:if>
                        <h3>${content.getTitle()}</h3>
                        <p>${content.getContent()}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer-learning.jsp"></c:import>