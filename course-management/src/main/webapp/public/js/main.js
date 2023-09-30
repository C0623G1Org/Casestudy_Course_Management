$(document).ready(function () {
    $("#login-btn-popup").click(function () {
        $('.form-modal').show();
        $("#log-in").hide();
    });
    $("#login-here").click(function (event) {
        event.preventDefault();
        $("#sign-up").hide();
        $("#log-in").show();
    });
    $("#sign-up-here").click(function (event) {
        event.preventDefault();
        $("#sign-up").show();
        $("#log-in").hide();
    });
    $(".login-modal, .close-icon").click(function () {
        $('.form-modal').hide();
    });
});