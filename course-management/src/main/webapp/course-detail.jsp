<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"></c:import>
<section>
    <div class="container">
        <div class="card">
            <img src="../public/image/image 8.png" class="card-img" alt="ảnh"/>
            <div class="text-1">
                <div class="card-img-overlay">
                    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
                        <div class="container-fluid py-5">
                            <h3 class="display-5 fw-bold">Khóa học ${course.getName()}</h3>
                            <p class="col-md-8 fs-5">${course.getDescription()}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-2 container mt-4">
        <div class="row content-font main-content">
            <div class="col-6">
                <h1 class="mb-4">Bạn sẽ học được gì?</h1>
                <div class="content-knowledge">
                    ${course.getKnowledge()}
                </div>
                <hr class="mb-3">
                <div class="content-font-course">
                    <h1 class="mb-4">Nội dung khóa học</h1>
                    <div class="accordion" id="accordionExample">
                        <c:forEach var="courseContents" items="${courseContents}" varStatus="loop">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapse${loop.count}" aria-expanded="true"
                                            aria-controls="collapse${loop.count}">
                                        <h3>${loop.count}. ${courseContents.getName()}</h3>
                                    </button>
                                </h2>
                                <div id="collapse${loop.count}"
                                     class="accordion-collapse collapse<c:if test="${loop.first}"> show</c:if>"
                                     data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                            <c:forEach items="${detailedContents}" var="detailedContents" varStatus="item">
                                                <c:if test="${courseContents.getId() == detailedContents.getCourseContentId()}">
                                                <a href="#" class="list-group-item list-group-item-action"
                                                   aria-current="true">
                                                    ${detailedContents.getTitle()}
                                                </a>
                                                <hr>
                                                </c:if>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <hr class="mt-4 mb-4">
                <h1 class="mb-4">Yêu cầu</h1>
                <div class="content-requirements">
                    ${course.getRequirements()}
                </div>
            </div>
            <div class="col-6 column-2">
                <div class="content-1">
                    <img src="../public/image/Rectangle 52.png"/>
                    <div class="mt-5">
                        <h1>${course.getName()}</h1>
                        <p>${course.getDescription()}</p>
                    </div>
                    <h1 class="mt-5">${course.getPrice()} $</h1>
                    <div class="mt-4 col-4" style="background: #E2F6FF; padding: 5px; border-radius: 40px">
                        <div class="author" style="text-align: center">
                            <i class="fa-solid fa-graduation-cap"></i> <span
                                style="color: #0B103F;font-weight: 600;">${course.getInstructor()}</span>
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class="content-other-info">
                            ${course.getOtherInfoCourse()}
                        </div>
                    </div>
                    <div class="mt-3">
                        <a href="#" role="button" class="btn btn-primary btn-order-course">Mua khóa học</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer.jsp"></c:import>