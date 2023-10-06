<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp"></c:import>
<section>
  <div class="container">
    <div class="row hero-home">
      <div class="col-lg-6">
        <h1>Master New Skills with LTTA</h1>
        <p>Những khóa học được LTTA sản xuất theo tiêu chuẩn chất lượng cao đối với học tập trực tuyến</p>
        <div class="row d-flex align-items-center">
          <div class="col-4">
            <a class="btn-hero btn btn-primary" href="/course" role="button">Get Started</a>
          </div>
          <div class="col-5">
            <div class="circle-item">
              <img src="../public/image/Ellipse 1.png" alt="">
              <img src="../public/image/Ellipse 2.png" alt="">
              <img src="../public/image/Ellipse 3.png" alt="">
              <img src="../public/image/Ellipse 4.png" alt="">
            </div>
          </div>
          <div class="col-3 using">
            <p class="title">42k +</p>
            <p>User using</p>
          </div>
        </div>
        <div class="d-flex align-items-center">
          <div class="col-lg-4">
            <img src="../public/image/logo-banner-1 1.png" height="38" width="174"/>
          </div>
          <div class="col-lg-4">
            <img src="../public/image/logo-banner-2.png" height="94" width="167"/>
          </div>
          <div class="col-lg-4">
            <img src="../public/image/W3Schools_logo.png" height="77" width="82"/>
          </div>
        </div>
      </div>
      <div class="col-lg-6 img-hero">
        <img src="../public/image/vector-banner 1.png">
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container why my-5">
    <div class="row">
      <div class="col-lg-8">
        <h2>
          New Skills with LTTA Platform A Detail Look at Our Currient
        </h2>
      </div>
      <div class="col-lg-4">
        <p>Những khóa học được LTTA tiêu chuẩn chất lượng cao đối với học tập trực tuyến</p>
        <a role="button" href="/course" class="btn-started btn btn-primary">Get Started</a>
      </div>
    </div>
    <div class="row my-5 justify-content-around">
      <div class="col-lg-5">
        <div class="feature col one">
          <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-gradient fs-2 mb-3">
            <i class="fa-solid fa-circle-half-stroke"></i>
          </div>
          <h5 class="fs-2 text-body-emphasis">Lorem ipsum dolor sit amet adipisicing elit. Doloremque,
            voluptatibus.</h5>
          <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, esse iure! Molestiae officia,
            nulla nam voluptatum, voluptas maiores deserunt, labore explicabo quia qui vel vero sint
            accusantium quidem quam saepe.</p>
        </div>
      </div>
      <div class="col-lg-7">
        <div class="feature col two">
          <div class="feature-icon d-inline-flex align-items-center justify-content-center bg-gradient fs-2 mb-3">
            <i class="fa-solid fa-circle-half-stroke"></i>
          </div>
          <h5 class="fs-2 text-body-emphasis">Lorem ipsum, dolor sit amet elit. Incidunt sapiente dolores
            saepe quia magni excepturi quidem quam saepe!</h5>
          <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, esse iure! Molestiae officia,
            nulla nam voluptatum, voluptas maiores deserunt, labore explicabo quia qui vel vero sint
            accusantium quidem quam saepe. labore explicabo quia qui vel vero sint accusantium quidem quam
            saepe.</p>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container my-5">
    <div class="row voucher-home">
      <div class="col-lg-4">
        <h3>Ưu đãi của chúng tôi dành cho bạn</h3>
      </div>
      <div class="col-lg-8">
        <div class="row">
          <div class="bg-circe col-lg-3">
            <p>Ưu đãi 1</p>
          </div>
          <div class="bg-circe col-lg-3">
            <p>Ưu đãi 2</p>
          </div>
          <div class="bg-circe col-lg-3">
            <p>Ưu đãi 3</p>
          </div>
          <div class="bg-circe col-lg-3">
            <p>Ưu đãi 4</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container my-5 course-home">
    <div class="row text-center">
      <div class="col-md-6 offset-md-3 col-auto">
        <h2>Khoá học phổ biến</h2>
        <div class="row form-search-home mt-3">
          <div class="col-lg-4 search-by-name">
            <p>Tìm theo tên</p>
          </div>
          <div class="col-lg-4 search-by-tutor">
            <p>Tìm theo Tutor</p>
          </div>
          <div class="col-lg-4 btn-search">
            <p>Tìm kiếm</p>
          </div>
        </div>
      </div>
    </div>
    <div class="row my-5">
      <c:forEach items="${courseList}" var="courseList">
        <div class="col-lg-4">
          <div class="card" style="width: 100%;">
            <div class="card-body">
              <div class="row card-head">
                <div class="col-md-4">
                  <img src="${courseList.getAvatar()}" class="card-img" alt="">
                </div>
                <div class="col-md-8 ml-auto">
                  <div class="category">
                    <c:forEach items="${categoryList}" var="category">
                      <c:if test="${category.getId() == courseList.getCourseLevelId()}">
                        <p class="text-right">${category.getName()}</p>
                      </c:if>
                    </c:forEach>
                  </div>
                  <h3>${courseList.getName()}</h3>
                </div>
              </div>
              <p class="card-text">${courseList.getDescription()}</p>
              <div class="card-bottom">
                <div class="author"><i class="fa-solid fa-graduation-cap"></i> ${courseList.getInstructor()}</div>
                <div class="rating"><i class="fa-solid fa-star"></i> 4.8</div>
              </div>
              <div class="card-price">
                <div class="price">${courseList.getPrice()} VNĐ</div>
                  <%--                <a style="color: #FFFFFF" role="button" class="btn-login btn btn-primary" href="/course/id=${courseList.getId()}">Đăng kí</a>--%>
                <a style="color: #FFFFFF" role="button" class="btn-login btn btn-primary" href="/course/detail?id=${courseList.getId()}">Đăng kí</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="row">
      <div class="text-center d-flex justify-content-between">
        <div class="col-lg-12">
          <a role="button" href="/course" class="btn-hero btn btn-primary">Xem thêm</a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container">
    <div class="px-4 py-5 my-3 text-center">
      <div class="col-lg-6 mx-auto">
        <h1 class="display-5 fw-bold text-body-emphasis">Những người từng học nói gì về chúng tôi ?</h1>
        <p class="lead mb-4">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit quia dolorem
          dignissimos reprehenderit quaerat accusantium.</p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-3">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <div class="row card-head">
              <div class="col-md-4">
                <img src="../public/image/icon-avatar.png">
              </div>
              <div class="col-md-8 ml-auto">
                <div class="feedback">
                  <p class="name">ThanhPV</p>
                </div>
                <h3>C0623G1</h3>
              </div>
            </div>
            <div class="rating mt-3">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="content">Khóa học rất hữu ích và dễ hiểu. Giảng viên rất giỏi, đã truyền đạt kiến thức
              một cách rõ ràng và chi tiết. Tôi đã học được nhiều điều mới và có thể áp dụng vào công việc
              của mình.</p>
            <div class="card-bottom">
              <div class="category">Javascript</div>
            </div>
            <div class="card-name-course my-2">
              <h3>Javascript Foudatament</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <div class="row card-head">
              <div class="col-md-4">
                <img src="../public/image/icon-avatar.png">
              </div>
              <div class="col-md-8 ml-auto">
                <div class="feedback">
                  <p class="name">ThanhPV</p>
                </div>
                <h3>C0623G1</h3>
              </div>
            </div>
            <div class="rating mt-3">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="content">Tôi thực sự thích khóa học này. Nội dung được trình bày một cách cụ thể và dễ
              hiểu. Nhờ khóa học này, tôi đã nắm vững các kỹ năng cần thiết để phát triển các trang web
              chuyên nghiệp.</p>
            <div class="card-bottom">
              <div class="category">Javascript</div>
            </div>
            <div class="card-name-course my-2">
              <h3>Javascript Foudatament</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <div class="row card-head">
              <div class="col-md-4">
                <img src="../public/image/icon-avatar.png">
              </div>
              <div class="col-md-8 ml-auto">
                <div class="feedback">
                  <p class="name">ThanhPV</p>
                </div>
                <h3>C0623G1</h3>
              </div>
            </div>
            <div class="rating mt-3">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="content">Khóa học rất thú vị và bổ ích. Giảng viên rất am hiểu về lĩnh vực này. Tôi đã học được cách phát triển ứng dụng di động và đã có
              thể tạo ra một ứng dụng đơn giản sau khóa học</p>
            <div class="card-bottom">
              <div class="category">Javascript</div>
            </div>
            <div class="card-name-course my-2">
              <h3>Javascript Foudatament</h3>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <div class="row card-head">
              <div class="col-md-4">
                <img src="../public/image/icon-avatar.png">
              </div>
              <div class="col-md-8 ml-auto">
                <div class="feedback">
                  <p class="name">ThanhPV</p>
                </div>
                <h3>C0623G1</h3>
              </div>
            </div>
            <div class="rating mt-3">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="content">Tôi rất hài lòng với khóa học này. Cách giảng dạy từ cơ bản đến nâng cao rất
              rõ ràng. Tôi đã học được các kỹ thuật lập trình game cần thiết và đã tạo ra một trò chơi nhỏ
              sau khóa học.</p>
            <div class="card-bottom">
              <div class="category">Javascript</div>
            </div>
            <div class="card-name-course my-2">
              <h3>Javascript Foudatament</h3>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<c:import url="footer.jsp"></c:import>