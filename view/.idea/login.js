$(document).ready(function(){
    $("#login-btn").click(function () {
        $('.form-modal').show();
        $("#log-in").hide();
    })
    $("#login-here").click(function () {
        $("#sign-up").hide();
        $("#log-in").show();
    })
    $("#sign-up-here").click(function () {
        $("#sign-up").show();
        $("#log-in").hide();
    })
    $(".login-modal, .close-icon").click(function () {
        $('.form-modal').hide();
    })
})

// const loginBtn = document.querySelector('#login-btn')
// const loginModal = document.querySelector('.login-modal')
// const loginModalClose = document.querySelector('.close-icon')
// show Login Box after clicking login button
// function showLoginBox() {
//     loginModal.classList.add('open')
// }
// loginBtn.addEventListener('click', showLoginBox)
//
// hide Login Box after clicking close icon
// function hideLoginBox() {
//     loginModal.classList.remove('open')
// }
// loginModalClose.addEventListener('click', hideLoginBox)