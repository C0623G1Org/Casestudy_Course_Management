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
                    <form action="/dashboard/password?id=${user.getId()}" method="post" class="edit-user-inf my-4 text-start">
                        <div class="edit-body">
                            <h4>Thay đổi mật khẩu</h4>
                            <p>Cập nhật mật khẩu của bạn.</p>
                            <c:if test="${not empty alert}">
                                <div class="alert alert-danger" role="alert">
                                        ${alert}
                                </div>
                            </c:if>
                            <c:if test="${not empty sucsess}">
                                <div class="alert alert-success" role="alert">
                                        ${sucsess}
                                </div>
                            </c:if>
                            <div class="edit-phone">
                                <label class="lb" for="oldPassWord">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập mật khẩu cũ</span>
                                </label>
                                <input class="form-control" type="password" id="oldPassWord" name="oldPassWord">
                            </div>
                            <div class="id_card">
                                <label class="lb" for="newPassword">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập mật khẩu mới</span>
                                </label>
                                <input class="form-control" type="password" id="newPassword" name="newPassword">
                            </div>
                            <div class="edit-birthday">
                                <label class="lb" for="againNewPassword">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập lại mật khẩu mới</span>
                                </label>
                                <input class="form-control" type="password" id="againNewPassword" name="againNewPassword">
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
<c:import url="footer-dashboard.jsp"></c:import>