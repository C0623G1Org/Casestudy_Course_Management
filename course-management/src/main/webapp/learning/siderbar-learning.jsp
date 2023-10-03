<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="menu-left learning">
    <div class="img-logo-dashboard">
        <img src="/public/image/logo-website-dark-thanhpv.png" width="100%"/>
    </div>
    <div class="table-of-contents">
        <h2>${course.getName()}</h2>
        <hr>
        <div class="accordion" id="accordionExample">
            <c:forEach var="courseContents" items="${courseContents}" varStatus="loop">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading${loop.count}">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse${loop.count}" aria-expanded="true"
                                aria-controls="collapse${loop.count}">
                                ${loop.count}. ${courseContents.getName()}
                        </button>
                    </h2>
                    <div id="collapse${loop.count}"
                         class="accordion-collapse collapse <c:if test="${content.getCourseContentId() == courseContents.getId()}">show</c:if> "
                         aria-labelledby="heading${loop.count}"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="list-group">
                                <c:forEach items="${detailedContents.get(courseContents.getId())}" var="detailedContent"
                                           varStatus="item">
                                    <c:if test="${detailedContent.getCourseContentTypeId() == 1}">
                                        <a href="/learn/lesson/?id=${course.getId()}&content-detail=${detailedContent.getId()}"
                                           class="list-group-item list-group-item-action "
                                           aria-current="true"><i class="fa-solid fa-video"></i> Bài giảng ${detailedContent.getTitle()}
                                        </a>
                                    </c:if>
                                    <c:if test="${detailedContent.getCourseContentTypeId() == 2}">
                                        <a href="/learn/reading/?id=${course.getId()}&content-detail=${detailedContent.getId()}"
                                           class="list-group-item list-group-item-action"
                                           aria-current="true"><i class="fa-solid fa-book-open-reader"></i>  Bài đọc ${detailedContent.getTitle()}
                                        </a>
                                    </c:if>
                                    <c:if test="${detailedContent.getCourseContentTypeId() == 3}">
                                        <a href="/learn/exercise/?id=${course.getId()}&content-detail=${detailedContent.getId()}"
                                           class="list-group-item list-group-item-action"
                                           aria-current="true"><i class="fa-solid fa-graduation-cap"></i> Bài tập ${detailedContent.getTitle()}
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>