$(document).ready(function () {
    $('#form-signup').submit(function (e) {
        e.preventDefault();
        var usernameSignUp = $('#usernameSignUp').val();
        var passwordSignUp = $('#passwordSignUp').val();
        var passwordSignUpAgain = $('#passwordSignUpAgain').val();
        var emailSignUp = $('#emailSignUp').val();
        $.ajax({
            type: 'POST',
            url: '/user/signup',
            data: {
                'usernameSignUp': usernameSignUp,
                'passwordSignUp': passwordSignUp,
                'passwordSignUpAgain': passwordSignUpAgain,
                'emailSignUp': emailSignUp
            },
            success: function (data) {
                debugger;
                if (data !== "") {
                    $('#msg-signup').html("<div class='alert alert-danger' role='alert'>" + data + "</div>");
                } else {
                    window.location.href = "/dashboard";
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown); // Hiển thị lỗi trong console
            }
        });
    });
});
$(document).ready(function() {
    $('#form-login').submit(function(e) {
        e.preventDefault();
        var usernameLogIn = $('#usernameLogIn').val();
        var passwordLogIn = $('#passwordLogIn').val();
        $.ajax({
            type: 'POST',
            url: '/user/login',
            data: {
                'usernameLogIn': usernameLogIn,
                'passwordLogIn': passwordLogIn,
            },
            success: function (data) {
                if (data !== "") {
                    $('#msg-login').html("<div class='alert alert-danger' role='alert'>" + data + "</div>");
                } else {
                    window.location.href = "/dashboard";
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown); // Hiển thị lỗi trong console
            }
        });
    });
});

window.addEventListener("DOMContentLoaded", function () {
    let currentUrl = window.location.pathname;
    let currentSearch = window.location.search;
    let href = currentUrl + currentSearch;
    let targetLink = document.querySelector('a[href="' + href + '"]');
    if (targetLink) {
        targetLink.classList.add("active");
    }
});
window.addEventListener("DOMContentLoaded", function () {
    const links = document.querySelectorAll('#admin-siderbar li a');
    let href = window.location.pathname;
    let targetLink = document.querySelector('a[href="' + href + '"]');
    links.forEach(link => {
        if (link === href) {
            targetLink.classList.replace('text-white','active');
        }
    });
});

window.addEventListener("DOMContentLoaded", function () {
    const links = document.querySelectorAll('#user-siderbar li a');
    let href = window.location.pathname;
    let targetLink = document.querySelector('a[href="' + href + '"]');
    links.forEach(link => {
        if (link === href) {
            targetLink.classList.replace('text-white','active');
        }
    });
});
