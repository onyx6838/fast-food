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

function showNameErrMsg(message) {
    $('#name-err-msg').html(message);
    hideNameErrMsg('block');
}

function hideNameErrMsg(style) {
    $('#name-err-msg').css('display', style);
}