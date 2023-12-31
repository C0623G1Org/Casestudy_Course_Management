<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
                <c:import url="admin-siderbar.jsp"></c:import>
            <div class="col-lg-9 content-dashboard ps-5 ">
                <div class="mb-5">
                    <c:import url="header-content-dashboard.jsp"></c:import>
                </div>
                <div class="row my-5 content-edit-info ">
                    <form action="#" class="edit-user-inf my-4 text-start">

                        <div class="edit-header">
                            <div class="avatar col-4">
                                <img src="${req.requestURI}/public/image/3607444.png" alt="ava"/> <br>
                            </div>

                            <div class="edit-header-inf col-7">
                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="user_name"><i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Tên đăng nhập</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="user_name" name="userName" value="${user.getUsername()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="name">
                                            <i class='bx bxs-user-circle' style='color:#5585fd'></i>
                                            <span>Họ và Tên</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="name"  name="fullName" value="${user.getFullName()}">
                                </div>

                                <div class="edit-inf col-12">
                                    <div class="label-edit-header">
                                        <label class="lb" for="email">
                                            <i class='bx bx-mail-send' style='color:#5585fd'></i>
                                            <span>Email của bạn</span>
                                        </label>
                                    </div>
                                    <input class="form-control" type="text" id="email" name="email" value="${user.getEmail()}">
                                </div>
                            </div>
                        </div>

                        <div class="edit-body">
                            <h4>Thông tin</h4>
                            <p>Thông tin chi tiết</p>

                            <div class="edit-phone">
                                <label class="lb" for="phone">
                                    <i class='bx bxs-phone-call' style='color:#5585fd'></i>
                                    <span>Số điện thoại</span>
                                </label>
                                <input class="form-control" type="text" id="phone" name="phone" value="${user.getPhone()}">
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
                                <input class="form-control" type="text" id="birthday" name="birthday" value="${user.getBirthday()}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/dashboard/footer-dashboard.jsp"></c:import>