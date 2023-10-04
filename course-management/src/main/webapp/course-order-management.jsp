<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/3/2023
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../dashboard/header-dashboard.jsp"></c:import>
<section>
    <div class="container my-4">
        <div class="row">
            <div class="col-lg-3 siderbar-dashboard">
                <div class="menu-left">
                    <div class="img-logo-dashboard">
                        <a href="/">
                            <img src="../public/image/logo-website-dark-thanhpv.png" width="100%"/>
                        </a>
                    </div>
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li>
                            <a href="#" class="nav-link active" aria-current="page">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30"
                                     fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                          d="M5.6 2H5.5C5.042 2 4.648 2 4.3 2.082C3.76127 2.21073 3.2687 2.48609 2.87686 2.87758C2.48502 3.26906 2.20922 3.76139 2.08 4.3C2 4.648 2 5.04 2 5.5V10.5C2 10.958 2 11.352 2.082 11.7C2.21073 12.2387 2.48609 12.7313 2.87758 13.1231C3.26906 13.515 3.76139 13.7908 4.3 13.92C4.648 14 5.04 14 5.5 14H10.5C10.958 14 11.352 14 11.7 13.918C12.2387 13.7893 12.7313 13.5139 13.1231 13.1224C13.515 12.7309 13.7908 12.2386 13.92 11.7C14 11.352 14 10.96 14 10.5V5.5C14 5.042 14 4.648 13.918 4.3C13.7893 3.76127 13.5139 3.2687 13.1224 2.87686C12.7309 2.48502 12.2386 2.20922 11.7 2.08C11.352 2 10.96 2 10.5 2H5.6ZM4.766 4.028C4.852 4.008 4.986 4 5.6 4H10.4C11.016 4 11.148 4.006 11.234 4.028C11.4137 4.07096 11.5779 4.16285 11.7085 4.29347C11.8391 4.42409 11.931 4.58834 11.974 4.768C11.994 4.852 12 4.984 12 5.6V10.4C12 11.016 11.994 11.148 11.972 11.234C11.929 11.4137 11.8371 11.5779 11.7065 11.7085C11.5759 11.8391 11.4117 11.931 11.232 11.974C11.15 11.992 11.018 12 10.4 12H5.6C4.984 12 4.852 11.994 4.766 11.972C4.58634 11.929 4.42209 11.8371 4.29147 11.7065C4.16085 11.5759 4.06896 11.4117 4.026 11.232C4.008 11.15 4 11.018 4 10.4V5.6C4 4.984 4.006 4.852 4.028 4.766C4.07096 4.58634 4.16285 4.42209 4.29347 4.29147C4.42409 4.16085 4.58834 4.06896 4.768 4.026L4.766 4.028ZM19.6 2H19.5C19.042 2 18.648 2 18.3 2.082C17.7613 2.21073 17.2687 2.48609 16.8769 2.87758C16.485 3.26906 16.2092 3.76139 16.08 4.3C16 4.648 16 5.04 16 5.5V10.5C16 10.958 16 11.352 16.082 11.7C16.2107 12.2387 16.4861 12.7313 16.8776 13.1231C17.2691 13.515 17.7614 13.7908 18.3 13.92C18.648 14 19.04 14 19.5 14H24.5C24.958 14 25.352 14 25.7 13.918C26.2387 13.7893 26.7313 13.5139 27.1231 13.1224C27.515 12.7309 27.7908 12.2386 27.92 11.7C28 11.352 28 10.96 28 10.5V5.5C28 5.042 28 4.648 27.918 4.3C27.7893 3.76127 27.5139 3.2687 27.1224 2.87686C26.7309 2.48502 26.2386 2.20922 25.7 2.08C25.352 2 24.96 2 24.5 2H19.6ZM18.766 4.028C18.852 4.008 18.986 4 19.6 4H24.4C25.016 4 25.148 4.006 25.234 4.028C25.4137 4.07096 25.5779 4.16285 25.7085 4.29347C25.8391 4.42409 25.931 4.58834 25.974 4.768C25.994 4.852 26 4.984 26 5.6V10.4C26 11.016 25.992 11.148 25.972 11.234C25.929 11.4137 25.8372 11.5779 25.7065 11.7085C25.5759 11.8391 25.4117 11.931 25.232 11.974C25.148 11.994 25.016 12 24.4 12H19.6C18.984 12 18.852 11.994 18.766 11.972C18.5863 11.929 18.4221 11.8371 18.2915 11.7065C18.1609 11.5759 18.069 11.4117 18.026 11.232C18.008 11.15 18 11.018 18 10.4V5.6C18 4.984 18.006 4.852 18.028 4.766C18.071 4.58634 18.1628 4.42209 18.2935 4.29147C18.4241 4.16085 18.5883 4.06896 18.768 4.026L18.766 4.028ZM5.5 16H10.5C10.958 16 11.352 16 11.7 16.082C12.2387 16.2107 12.7313 16.4861 13.1231 16.8776C13.515 17.2691 13.7908 17.7614 13.92 18.3C14 18.648 14 19.04 14 19.5V24.5C14 24.958 14 25.352 13.918 25.7C13.7893 26.2387 13.5139 26.7313 13.1224 27.1231C12.7309 27.515 12.2386 27.7908 11.7 27.92C11.352 28 10.96 28 10.5 28H5.5C5.042 28 4.648 28 4.3 27.918C3.76127 27.7893 3.2687 27.5139 2.87686 27.1224C2.48502 26.7309 2.20922 26.2386 2.08 25.7C2 25.352 2 24.96 2 24.5V19.5C2 19.042 2 18.648 2.082 18.3C2.21073 17.7613 2.48609 17.2687 2.87758 16.8769C3.26906 16.485 3.76139 16.2092 4.3 16.08C4.648 16 5.04 16 5.5 16ZM5.6 18C4.984 18 4.852 18.006 4.766 18.028C4.58634 18.071 4.42209 18.1628 4.29147 18.2935C4.16085 18.4241 4.06896 18.5883 4.026 18.768C4.008 18.85 4 18.982 4 19.6V24.4C4 25.016 4.006 25.148 4.028 25.234C4.07096 25.4137 4.16285 25.5779 4.29347 25.7085C4.42409 25.8391 4.58834 25.931 4.768 25.974C4.852 25.994 4.984 26 5.6 26H10.4C11.016 26 11.148 25.992 11.234 25.972C11.4137 25.929 11.5779 25.8372 11.7085 25.7065C11.8391 25.5759 11.931 25.4117 11.974 25.232C11.994 25.148 12 25.016 12 24.4V19.6C12 18.984 11.994 18.852 11.972 18.766C11.929 18.5863 11.8371 18.4221 11.7065 18.2915C11.5759 18.1609 11.4117 18.069 11.232 18.026C11.15 18.008 11.018 18 10.4 18H5.6ZM19.6 16H19.5C19.042 16 18.648 16 18.3 16.082C17.7613 16.2107 17.2687 16.4861 16.8769 16.8776C16.485 17.2691 16.2092 17.7614 16.08 18.3C16 18.648 16 19.04 16 19.5V24.5C16 24.958 16 25.352 16.082 25.7C16.2107 26.2387 16.4861 26.7313 16.8776 27.1231C17.2691 27.515 17.7614 27.7908 18.3 27.92C18.648 28.002 19.042 28.002 19.5 28.002H24.5C24.958 28.002 25.352 28.002 25.7 27.92C26.2384 27.7909 26.7305 27.5154 27.122 27.124C27.5134 26.7325 27.7889 26.2404 27.918 25.702C28 25.354 28 24.96 28 24.502V19.5C28 19.042 28 18.648 27.918 18.3C27.7893 17.7613 27.5139 17.2687 27.1224 16.8769C26.7309 16.485 26.2386 16.2092 25.7 16.08C25.352 16 24.96 16 24.5 16H19.6ZM18.766 18.028C18.852 18.008 18.986 18 19.6 18H24.4C25.016 18 25.148 18.006 25.234 18.028C25.4137 18.071 25.5779 18.1628 25.7085 18.2935C25.8391 18.4241 25.931 18.5883 25.974 18.768C25.994 18.852 26 18.984 26 19.6V24.4C26 25.016 25.992 25.148 25.972 25.234C25.929 25.4137 25.8372 25.5779 25.7065 25.7085C25.5759 25.8391 25.4117 25.931 25.232 25.974C25.148 25.994 25.016 26 24.4 26H19.6C18.984 26 18.852 25.992 18.766 25.972C18.5863 25.929 18.4221 25.8372 18.2915 25.7065C18.1609 25.5759 18.069 25.4117 18.026 25.232C18.008 25.15 18 25.018 18 24.4V19.6C18 18.984 18.006 18.852 18.028 18.766C18.071 18.5863 18.1628 18.4221 18.2935 18.2915C18.4241 18.1609 18.5883 18.069 18.768 18.026L18.766 18.028Z"
                                          fill="white"/>
                                </svg>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="34" viewBox="0 0 30 34"
                                     fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                          d="M13.3754 0H16.6246C19.4523 0 21.6923 0 23.4446 0.235385C25.2477 0.478462 26.7077 0.989231 27.86 2.14C29.0108 3.29231 29.5215 4.75231 29.7646 6.55539C30 8.30923 30 10.5477 30 13.3754V19.7015C30 22.5292 30 24.7692 29.7646 26.5215C29.5215 28.3246 29.0108 29.7846 27.86 30.9369C26.7077 32.0877 25.2477 32.5985 23.4446 32.8415C21.6908 33.0769 19.4523 33.0769 16.6246 33.0769H13.3754C10.5477 33.0769 8.30769 33.0769 6.55539 32.8415C4.75231 32.5985 3.29231 32.0877 2.14 30.9369C0.989231 29.7846 0.478462 28.3246 0.235385 26.5215C1.83399e-07 24.7677 0 22.5292 0 19.7015V13.3754C0 10.5477 1.83399e-07 8.30769 0.235385 6.55539C0.478462 4.75231 0.989231 3.29231 2.14 2.14C3.29231 0.989231 4.75231 0.478462 6.55539 0.235385C8.30923 0 10.5477 0 13.3754 0ZM6.86154 2.52308C5.31385 2.73077 4.42154 3.12154 3.76923 3.77231C3.12 4.42308 2.72923 5.31538 2.52154 6.86308C2.30923 8.44462 2.30615 10.5277 2.30615 13.4615V19.6154C2.30615 22.5492 2.30923 24.6338 2.52154 26.2154C2.72923 27.7615 3.12 28.6538 3.77077 29.3046C4.42154 29.9554 5.31385 30.3462 6.86154 30.5538C8.44308 30.7662 10.5262 30.7692 13.46 30.7692H16.5369C19.4708 30.7692 21.5554 30.7662 23.1369 30.5538C24.6831 30.3462 25.5754 29.9554 26.2262 29.3046C26.8769 28.6538 27.2677 27.7615 27.4754 26.2138C27.6877 24.6338 27.6908 22.5492 27.6908 19.6154V13.4615C27.6908 10.5277 27.6877 8.44462 27.4754 6.86154C27.2677 5.31538 26.8769 4.42308 26.2262 3.77231C25.5754 3.12154 24.6831 2.73077 23.1354 2.52308C21.5554 2.31077 19.4708 2.30769 16.5369 2.30769H13.46C10.5262 2.30769 8.44462 2.31077 6.86154 2.52308ZM7.69231 13.4615C7.69231 13.1555 7.81387 12.862 8.03026 12.6456C8.24665 12.4293 8.54014 12.3077 8.84615 12.3077H21.1538C21.4599 12.3077 21.7534 12.4293 21.9697 12.6456C22.1861 12.862 22.3077 13.1555 22.3077 13.4615C22.3077 13.7676 22.1861 14.061 21.9697 14.2774C21.7534 14.4938 21.4599 14.6154 21.1538 14.6154H8.84615C8.54014 14.6154 8.24665 14.4938 8.03026 14.2774C7.81387 14.061 7.69231 13.7676 7.69231 13.4615ZM7.69231 19.6154C7.69231 19.3094 7.81387 19.0159 8.03026 18.7995C8.24665 18.5831 8.54014 18.4615 8.84615 18.4615H16.5385C16.8445 18.4615 17.138 18.5831 17.3544 18.7995C17.5707 19.0159 17.6923 19.3094 17.6923 19.6154C17.6923 19.9214 17.5707 20.2149 17.3544 20.4313C17.138 20.6477 16.8445 20.7692 16.5385 20.7692H8.84615C8.54014 20.7692 8.24665 20.6477 8.03026 20.4313C7.81387 20.2149 7.69231 19.9214 7.69231 19.6154Z"
                                          fill="white"/>
                                </svg>
                                Quản lý khóa học
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"
                                     fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                          d="M10.0298 2.41667C10.4965 1.43333 11.5031 0.75 12.6665 0.75H19.3331C20.4965 0.75 21.5015 1.43333 21.9698 2.41667C23.1081 2.42667 23.9965 2.47833 24.7898 2.78833C25.7369 3.15879 26.5605 3.78835 27.1665 4.605C27.7781 5.42833 28.0665 6.48333 28.4598 7.935L29.6965 12.4717L30.1631 13.8733L30.2031 13.9233C31.7048 15.8467 30.9898 18.7067 29.5598 24.425C28.6498 28.0633 28.1965 29.8817 26.8398 30.9417C25.4831 32 23.6081 32 19.8581 32H12.1415C8.39148 32 6.51648 32 5.15981 30.9417C3.80314 29.8817 3.34814 28.0633 2.43981 24.425C1.00981 18.7067 0.29481 15.8467 1.79648 13.9233L1.83648 13.8733L2.30314 12.4717L3.53981 7.935C3.93481 6.48333 4.22314 5.42667 4.83314 4.60333C5.43936 3.7873 6.26297 3.15833 7.20981 2.78833C8.00314 2.47833 8.88981 2.425 10.0298 2.41667ZM10.0331 4.92C8.92981 4.93167 8.48648 4.97333 8.11981 5.11667C7.60975 5.31613 7.16616 5.65518 6.83981 6.095C6.54648 6.49 6.37314 7.04167 5.88981 8.82L4.93981 12.3017C6.63981 12 8.96314 12 12.1398 12H19.8581C23.0365 12 25.3581 12 27.0581 12.3L26.1098 8.81833C25.6265 7.04 25.4531 6.48833 25.1598 6.09333C24.8335 5.65351 24.3899 5.31447 23.8798 5.115C23.5131 4.97167 23.0698 4.93 21.9665 4.91833C21.7298 5.41641 21.3568 5.8372 20.8907 6.1319C20.4247 6.42659 19.8846 6.58312 19.3331 6.58333H12.6665C12.1152 6.58327 11.5753 6.42699 11.1092 6.1326C10.6431 5.83821 10.27 5.41777 10.0331 4.92Z"
                                          fill="#F8F8F8"/>
                                </svg>
                                Quản lý đơn hàng
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="38" viewBox="0 0 30 38"
                                     fill="none">
                                    <path d="M15 15C19.1421 15 22.5 11.6421 22.5 7.5C22.5 3.35786 19.1421 0 15 0C10.8579 0 7.5 3.35786 7.5 7.5C7.5 11.6421 10.8579 15 15 15Z"
                                          fill="white"></path>
                                    <path d="M30 29.0625C30 33.7219 30 37.5 15 37.5C0 37.5 0 33.7219 0 29.0625C0 24.4031 6.71625 20.625 15 20.625C23.2838 20.625 30 24.4031 30 29.0625Z"
                                          fill="white"></path>
                                </svg>
                                Quản lý thành viên
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="31" viewBox="0 0 30 31"
                                     fill="none">
                                    <path d="M15.0006 0C15.3416 0 15.6686 0.135464 15.9097 0.376591C16.1509 0.617718 16.2863 0.944757 16.2863 1.28576C16.2863 1.62677 16.1509 1.95381 15.9097 2.19493C15.6686 2.43606 15.3416 2.57153 15.0006 2.57153C11.7042 2.57153 8.5428 3.88101 6.21191 6.21191C3.88101 8.5428 2.57153 11.7042 2.57153 15.0006C2.57153 18.297 3.88101 21.4583 6.21191 23.7892C8.5428 26.1201 11.7042 27.4296 15.0006 27.4296C15.3416 27.4296 15.6686 27.5651 15.9097 27.8062C16.1509 28.0473 16.2863 28.3744 16.2863 28.7154C16.2863 29.0564 16.1509 29.3834 15.9097 29.6245C15.6686 29.8657 15.3416 30.0011 15.0006 30.0011C11.0222 30.0011 7.20672 28.4207 4.39356 25.6076C1.58041 22.7944 0 18.979 0 15.0006C0 11.0222 1.58041 7.20672 4.39356 4.39356C7.20672 1.58041 11.0222 0 15.0006 0Z"
                                          fill="white"/>
                                    <path d="M22.6637 10.7661C22.4366 10.5224 22.313 10.2 22.3189 9.8669C22.3247 9.5338 22.4597 9.21599 22.6952 8.98041C22.9308 8.74484 23.2486 8.6099 23.5817 8.60402C23.9148 8.59814 24.2372 8.72179 24.481 8.94891L29.624 14.092C29.8648 14.333 30 14.6598 30 15.0006C30 15.3413 29.8648 15.6681 29.624 15.9092L24.481 21.0522C24.3632 21.1785 24.2213 21.2799 24.0636 21.3501C23.9059 21.4204 23.7356 21.4582 23.563 21.4612C23.3903 21.4643 23.2188 21.4325 23.0587 21.3679C22.8986 21.3032 22.7532 21.207 22.6311 21.0849C22.509 20.9628 22.4128 20.8173 22.3481 20.6572C22.2834 20.4971 22.2517 20.3256 22.2547 20.153C22.2578 19.9804 22.2955 19.8101 22.3658 19.6524C22.4361 19.4947 22.5374 19.3527 22.6637 19.235L25.6124 16.2863H11.5719C11.2309 16.2863 10.9039 16.1509 10.6627 15.9097C10.4216 15.6686 10.2861 15.3416 10.2861 15.0006C10.2861 14.6596 10.4216 14.3325 10.6627 14.0914C10.9039 13.8503 11.2309 13.7148 11.5719 13.7148H25.6124L22.6637 10.7661Z"
                                          fill="white"/>
                                </svg>
                                Đăng xuất
                            </a>
                        </li>
                    </ul>
                    <img width="100%" src="../public/image/vector-banner-2-thanhpv.png">
                </div>
            </div>

            <div class="col-lg-9 content-dashboard">
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
                                 src="https://zpsocial-f54-org.zadn.vn/24a379da816c6f32367d.jpg"
                                 alt="">${user.getFullName()}
                       </span>
                    </div>
                </div>
                <div class="header-content my-5">
                    <div class="hello">
                        <h3>Welcome back,</h3>
                    </div>
                    <div class="day-now">
                        <p>26-09-2023</p>
                    </div>
                </div>

                <div class="body-content">
                    <c:forEach items="${courseList}" var="courseList">
                        <div class="card mb-3" style="width: 100%;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <img src="../public/image/Rectangle 43.png">
                                    </div>
                                    <div class="col-10">
                                        <div class="row">
                                            <div class="col-7">
                                                <h4>${courseList.getName()}</h4>
                                            </div>
                                            <div class="col-5">
                                                <div class="row">
                                                    <div class="col-7 category">
                                                        <p class="text-right">Javascript
                                                        </p>
                                                    </div>
                                                    <div class="col-5 category">
                                                        <p class="text-right"><i class="fa-solid fa-star"></i>4.8
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="body-1">
                                                <div>
                                                    <p>Author</p>
                                                </div>

                                                <div>
                                                    <p><i class="fa-regular fa-user"></i>${courseList.getInstructor()}
                                                    </p>
                                                </div>

                                                <div>
                                                    <p><i class="fa-regular fa-clock"></i>24h 12m</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-solid fa-users"></i>1523</p>
                                                </div>
                                                <div>
                                                    <p>25 học phần</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-solid fa-video"></i>70 bài giảng</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-regular fa-file"></i>120 bài đọc</p>
                                                </div>
                                                <div>
                                                    <p><i class="fa-regular fa-star"></i>50 bài tập</p>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="mt-5 body-content-2">
                    <div>
                        <h3>Đăng kí khóa học hôm nay</h3>
                        <p class="mt-3">Các đơn đăng kí khóa học mới trong hôm nay</p>
                    </div>
                </div>
                <div class="mt-4 body-content-2">
                    <div class="card-table">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center" scope="col"><i class="fa-solid fa-arrow-down-wide-short"></i>Đơn
                                    hàng
                                </th>
                                <th class="text-center" scope="col">Tình trạng</th>
                                <th class="text-center" scope="col">Chi tiết đơn hàng</th>
                                <th class="text-center" scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td class="done">
                                    <div class="done-content"><i class="fa-solid fa-check"></i>Đã hoàn thành</div>
                                </td>
                                <td>Thành viên loanttv đã đăng kí khóa học Basic SQL Tutorial</td>
                                <td>Xem chi tiết</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td class="done">
                                    <div class="done-content"><i class="fa-solid fa-check"></i>Đã hoàn thành</div>
                                </td>
                                <td>Thành viên loanttv đã đăng kí khóa học Basic SQL Tutorial</td>
                                <td>Xem chi tiết</td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="../dashboard/footer-dashboard.jsp"></c:import>
