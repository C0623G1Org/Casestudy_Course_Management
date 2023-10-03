<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header-dashboard.jsp"></c:import>
<section>
    <link rel="stylesheet" href="../public/loan.css">
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
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg" alt="">Trần Thị Vân Loan
                       </span>
                    </div>
                </div>

                <div class="row my-5 content-edit-info ">
                    <form action="/dashboard?action=password" method="post" class="edit-user-inf my-4 text-start">
                        <div class="edit-body">
                            <h4>Thay đổi mật khẩu</h4>
                            <p>Cập nhật mật khẩu của bạn.</p>

                            <div class="edit-phone">
                                <label class="lb" for="phone">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập mật khẩu cũ</span>
                                </label>
                                <input type="password" id="phone">
                            </div>
                            <div class="id_card">
                                <label class="lb" for="id_card">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập mật khẩu mới</span>
                                </label>
                                <input type="password" id="id_card">
                            </div>
                            <div class="edit-birthday">
                                <label class="lb" for="birthday">
                                    <i class='bx bxs-key' style='color:#5585fd'></i>
                                    <span>Nhập lại mật khẩu mới</span>
                                </label>
                                <input type="password" id="birthday" name="password">
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