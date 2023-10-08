<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <c:import url="admin-siderbar.jsp"></c:import>
            </div>
            <div class="col-lg-9 content-dashboard ps-5 ">
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
                </div>
                <div class="row my-5 content-edit-info ">
                    <form action="/dashboard/member/edit" class="edit-user-inf my-4 text-start" method="post">
                        <div class="edit-header">
                            <div class="avatar col-4">
                                <img src="${req.requestURI}/public/image/ava.png" alt="ava"/> <br>
                                <button class="ava-btn" type="submit">
                                    <i class='bx bxs-user' style='color:#5585fd'></i>
                                    <span>Edit avatar</span>
                                </button>
                            </div>
                            <input type="hidden" name="id" value="${user.getId()}">
                            <div class="edit-header-inf col-7">
                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="user_name"><i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Tên đăng nhập</span>
                                        </label>
<%--                                        <label class="lb" for="user_name">--%>
<%--                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>--%>
<%--                                            <span>Edit</span>--%>
<%--                                        </label>--%>
                                    </div>
                                    <input class="form-control" placeholder=" Nhập tên" type="text" id="user_name" name="userName" value="${user.getUsername()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="name">
                                            <i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Họ và Tên</span>
                                        </label>
<%--                                        <label class="lb" for="name">--%>
<%--                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>--%>
<%--                                            <span>Edit</span>--%>
<%--                                        </label>--%>
                                    </div>
                                    <input class="form-control" type="text" id="name"  name="fullName" value="${user.getFullName()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="email">
                                            <i class='bx bx-mail-send' style='color:#5585fd'></i>
                                            <span>Email của bạn</span>
                                        </label>
<%--                                        <label class="lb" for="email">--%>
<%--                                            <i class='bx bx-edit-alt' style='color:#5585fd'></i>--%>
<%--                                            <span>Edit</span>--%>
<%--                                        </label>--%>
                                    </div>
                                    <input class="form-control" type="text" id="email" name="email" value="${user.getEmail()}">
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
                                <input class="form-control" type="date" id="birthday" name="birthday" value="${user.getBirthday()}">
                            </div>
                        </div>
                        <div class="save">
                            <button type="submit">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../dashboard/footer-dashboard.jsp"></c:import>