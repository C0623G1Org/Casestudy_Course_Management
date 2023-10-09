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
                <c:import url="header-content-dashboard.jsp"></c:import>
                <div class="row my-5 content-edit-info ">
                    <form class="edit-user-inf my-4 text-start" action="/dashboard/update" method="post">
                        <input type="hidden" value="${user.getId()}" name="id">
                        <div class="edit-header">
                            <div class="avatar col-4">
                                <img src="${req.requestURI}/public/image/3607444.png" alt="ava"/> <br>
                                <button class="ava-btn" type="submit">
                                    <i class='bx bxs-user' style='color:#5585fd'></i>
                                    <span>Edit avatar</span>
                                </button>
                            </div>
                            <input type="hidden" name="role" value="${user.getRole()}">
                            <div class="edit-header-inf col-7">
                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="user_name"><i class='bx bxs-user-circle'
                                                                             style='color:#5585fd'></i>
                                            <span>Tên đăng nhập</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="user_name" value="${user.getUsername()}">
                                    <input class="form-control" type="hidden" name="username" value="${user.getUsername()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="name">
                                            <i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Họ và Tên</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="name" value="${user.getFullName()}">
                                    <input class="form-control" type="hidden"  name="fullName" value="${user.getFullName()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="email">
                                            <i class='bx bx-mail-send' style='color:#5585fd'></i>
                                            <span>Email của bạn</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="email" value="${user.getEmail()}">
                                    <input class="form-control" type="hidden" name="email" value="${user.getEmail()}">
                                </div>
                            </div>
                        </div>

                        <div class="edit-body">
                            <h4>Cập nhật thông tin</h4>
                            <p>Cập nhật thêm thông tin của bạn.</p>
                            <c:if test="${not empty alert}">
                                <div class="alert alert-danger" role="alert">
                                        ${alert}
                                </div>
                            </c:if>
                            <div class="edit-phone">
                                <label class="lb" for="phone">
                                    <i class='bx bxs-phone-call' style='color:#5585fd'></i>
                                    <span>Số điện thoại</span>
                                </label>
                                <input class="form-control" type="text" id="phone" name="phone" value="${user.getPhone()}">
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
                                <input class="form-control" type="text" id="id_card" name="idCard" value="${user.getIdCard()}">
                            </div>
                            <div class="edit-birthday">
                                <label class="lb" for="birthday">
                                    <i class='bx bxs-cake' style='color:#5585fd'></i>
                                    <span>Ngày sinh</span>
                                </label>
                                <input class="form-control"  type="date" id="birthday" name="birthday" value="${user.getBirthday()}">
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