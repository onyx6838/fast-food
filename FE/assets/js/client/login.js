$(function () {
    //$('#rememberMe').prop('checked', storage.getRememberMe());
});

function login() {
    var username = $('#username').val();
    var password = $('#password').val();

    // validate
    if (!username) {
        showNameErrMsg("Please input username!");
        return;
    }

    if (!password) {
        showNameErrMsg("Please input password!");
        return;
    }

    if (username.length < 6 || username.length > 50 || password.length < 6 || password.length > 50) {
        // show error message
        showNameErrMsg("Login fail!");
        return;
    }

    $.ajax({
        url: 'http://localhost:8080/api/v1/login',
        type: 'POST',
        data: {
            username: username,
            password: password
        }
    }).done((data) => {
        localStorage.setItem("ID", data.id);
        localStorage.setItem("FULL_NAME", data.fullName);
        localStorage.setItem("USERNAME", username);
        localStorage.setItem("ROLE", data.role);
        localStorage.setItem("TOKEN", data.jwt);

        window.location.replace("index.html");
    }).fail((jqXHR, textStatus, errorThrown) => {
        if (jqXHR.status == 401) {
            showNameErrMsg("Login fail!");
        } else {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}

function register() {
    var username = $('#register-username').val();
    var firstname = $('#register-firstname').val();
    var lastname = $('#register-lastname').val();
    var email = $('#register-email').val();
    var password = $('#register-password').val();

    // TODO valid
    $.ajax({
        url: 'http://localhost:8080/api/v1/accounts',
        type: 'POST',
        data: JSON.stringify({
            userName: username,
            firstName: firstname,
            lastName: lastname,
            email: email,
            password: password,
            role: "User"
        }),
        contentType: "application/json ; charset=utf-8"
    }).done(function (data, status, xhr) {
        $('.toast').toast('show')
        //alert("We have sent 1 email. Please check email to active account!");
        setInterval(() => {
            window.location.replace("sign-in.html");
        }, 3000);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        if (jqXHR.status == 401 || jqXHR.status == 415 || jqXHR.status == 500) {
            showNameErrMsg("Regis fail!");
        } else {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}

function showNameErrMsg(message) {
    $('#name-err-msg').html(message);
    hideNameErrMsg('block');
}

function hideNameErrMsg(style) {
    $('#name-err-msg').css('display', style);
}