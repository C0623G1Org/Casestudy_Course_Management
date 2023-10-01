$(document).ready(function() {
    $('#form-signup').submit(function(e) {
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
            success: function(data) {
                if (data != "") {
                    $('#msg-signup').html("<div class='alert alert-danger' role='alert'>" + data + "</div>");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown); // Hiển thị lỗi trong console
            }
        });
    });
});$(document).ready(function() {
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
            success: function(data) {
                if (data != "") {
                    $('#msg-login').html("<div class='alert alert-danger' role='alert'>" + data + "</div>");
                } else {
                    window.location.href = "/dashboard";
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown); // Hiển thị lỗi trong console
            }
        });
    });
});