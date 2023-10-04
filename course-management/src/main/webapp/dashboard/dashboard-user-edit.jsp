<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row d-flex justify-content-between">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="user-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard ps-5 ">
                <div class="header-content">
                    <div class="hello">
                        <form class="row form-search-course g-2">
                            <div class="col-auto">
                                <input type="text" class="form-control" id="inputEmail"
                                       placeholder=" Nhập khóa học cần tìm" name="course">
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary">Tìm</button>
                            </div>
                        </form>
                    </div>
                    <div class="user">
                       <span class="badge d-flex align-items-center p-1 pe-2 text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
<%--                            <img class="rounded-circle me-1" width="35" height="35"--%>
<%--                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg" alt="">--%>
                           ${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="row my-5 content-edit-info ">
                    <form class="edit-user-inf my-4 text-start" action="/dashboard/update" method="post">
                        <input type="hidden" value="${user.getId()}" name="id">
                        <div class="edit-header">
                            <div class="avatar col-4">
                                <img src="../public/image/ava.png" alt="ava"/> <br>
                                <button class="ava-btn" type="submit">
                                    <i class='bx bxs-user' style='color:#5585fd'></i>
                                    <span>Edit avatar</span>
                                </button>
                            </div>
                            <input type="hidden" name="id" value="${user.getId()}">
                            <div class="edit-header-inf col-7">
                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="user_name"><i class='bx bxs-user-circle'
                                                                             style='color:#5585fd'></i>
                                            <span>Tên đăng nhập</span>
                                        </label>
                                        <label class="lb" for="user_name">
                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>
                                            <span>Edit</span>
                                        </label>
                                    </div>
                                    <input type="text" id="user_name" name="username" value="${user.getUsername()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="name">
                                            <i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Họ và Tên</span>
                                        </label>
                                        <label class="lb" for="name">
                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>
                                            <span>Edit</span>
                                        </label>
                                    </div>
                                    <input type="text" id="name" name="fullName" value="${user.getFullName()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="email">
                                            <i class='bx bx-mail-send' style='color:#5585fd'></i>
                                            <span>Email của bạn</span>
                                        </label>
                                        <label class="lb" for="email">
                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>
                                            <span>Edit</span>
                                        </label>
                                    </div>
                                    <input type="text" id="email" name="email" value="${user.getEmail()}">
                                </div>
                            </div>
                        </div>

                        <div class="edit-body">
                            <h4>Cập nhật thông tin</h4>
                            <p>Cập nhật thêm thông tin của bạn.</p>

                            <div class="edit-phone">
                                <label class="lb" for="phone">
                                    <i class='bx bxs-phone-call' style='color:#5585fd'></i>
                                    <span>Số điện thoại</span>
                                </label>
                                <input type="text" id="phone" name="phone" value="${user.getPhone()}">
                            </div>
                            <div class="edit-phone">
                                <i class='bx bxs-id-card' style='color:#5585fd'></i>
                                <span>Giới tính</span>
                                <input style="width: 20px;height: auto" type="radio" name="gender" <c:if test="${user.isGender()==true}">checked</c:if> value="male" > Nam
                                <input style="width: 20px;height: auto" type="radio" name="gender" <c:if test="${user.isGender()==false}">checked</c:if> value="female"> Nữ<br>
                            </div>
                            <div class="id_card">
                                <label class="lb" for="id_card">
                                    <i class='bx bxs-id-card' style='color:#5585fd'></i>
                                    <span>Căn cước công dân</span>
                                </label>
                                <input type="text" id="id_card" name="idCard" value="${user.getIdCard()}">
                            </div>
                            <div class="edit-birthday">
                                <label class="lb" for="birthday">
                                    <i class='bx bxs-cake' style='color:#5585fd'></i>
                                    <span>Ngày sinh</span>
                                </label>
                                <input type="date" id="birthday" name="birthday" value="${user.getBirthday()}">
                            </div>
                            <div class="save">
                                <button type="submit">Lưu thay đổi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="footer-dashboard.jsp"></c:import>