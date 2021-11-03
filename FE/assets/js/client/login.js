$(function () {
    $('#rememberMe').prop('checked', storage.getRememberMe());
});

function login() {
    var username = $('#username').val();
    var password = $('#password').val();

    if (validator.blank(username)) {
        showNameErrMsg('Chưa nhập tài khoản')
        setInterval(() => hideNameErrMsg('none'), 3000)
        return;
    }

    if (!validator.size(username, 6, 18)) {
        showNameErrMsg('Độ dài từ 6 đến 18 kí tự')
        setInterval(() => hideNameErrMsg('none'), 3000)
        return;
    }

    // if (!validator.email(username)) {
    //     showNameErrMsg('theo định dạng email', 3000)
    //     return;
    // }

    if (validator.pattern(username, /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/)) {
        showNameErrMsg('không chứa kí tự đặc biệt')
        setInterval(() => hideNameErrMsg('none'), 3000)
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
        var isRememberMe = $('#rememberMe').prop('checked');
        storage.saveRememberMe(isRememberMe);

        storage.setItem("ID", data.id);
        storage.setItem("FULL_NAME", data.fullName);
        storage.setItem("USERNAME", username);
        storage.setItem("ROLE", data.role);
        storage.setItem("TOKEN", data.jwt);
        storage.setItem("EMAIL", data.email);
        storage.setItem("PHONE", data.phone);

        window.location.replace("index.html");
    }).fail((jqXHR, textStatus, errorThrown) => {
        if (jqXHR.status == 401 || jqXHR.status == 500) {
            //ignoreSwal();
            showNameErrMsg("Tài khoản hoặc mật khẩu không đúng");
            setInterval(() => hideNameErrMsg('none'), 3000)
            return;
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

    if (validator.size(username, 6, 10)) {
        showNameErrMsg('from 6 10 charaters')
        setInterval(() => hideNameErrMsg('none'), 3000)
        return;
    }
    if (!validator.pattern(username, /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/)) {
        showNameErrMsg('not contain special charaters')
        setInterval(() => hideNameErrMsg('none'), 3000)
        return;
    }


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
        successRegisSwal().then(window.location.replace("sign-in.html"));
    }).fail(function (jqXHR, textStatus, errorThrown) {
        if (jqXHR.status == 401 || jqXHR.status == 415 || jqXHR.status == 500) {
            showNameErrMsg("Lỗi hệ thống");
            setInterval(() => hideNameErrMsg('none'), 3000)
            return;
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