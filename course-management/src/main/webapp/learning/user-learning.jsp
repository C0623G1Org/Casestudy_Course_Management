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
                <div class="mb-5">
                    <c:import url="/dashboard/header-content-dashboard.jsp"></c:import>
                </div>
                <div class="intro-dashboard-page mt-5">
                    <h3>${course.getName()}</h3>
                    <p>${course.getDescription()}</p>
                </div>
                <div class="row content-course video my-3">
                    <div class="col-lg-12">
                        <div class="video-course mb-3">
                            <img src="${course.getAvatar()}" alt="${course.getName()}">
                        </div>
                        <h3 class="mb-4">Bạn sẽ học được gì?</h3>
                        <div class="content-knowledge">
                            ${course.getKnowledge()}
                        </div>
                        <h3 class="mb-4">Yêu cầu</h3>
                        <div class="content-requirements">
                            ${course.getRequirements()}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer-learning.jsp"></c:import>
