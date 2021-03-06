$(function () {
    $('#rememberMe').prop('checked', storage.getRememberMe());
});

function login() {
    var username = $('#username').val();
    var password = $('#password').val();

    if (validator.blank(username) || !username.replace(/\s/g, '').length) {
        showNameErrMsg('Chưa nhập tài khoản')
        setInterval(() => toggleErrMsg('none'), 3000)
        return;
    }

    if (!validator.size(username, 6, 18)) {
        showNameErrMsg('Độ dài từ 6 đến 18 kí tự')
        setInterval(() => toggleErrMsg('none'), 3000)
        return;
    }

    // if (!validator.email(username)) {
    //     showNameErrMsg('theo định dạng email', 3000)
    //     return;
    // }

    if (validator.pattern(username, /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/)) {
        showNameErrMsg('không chứa kí tự đặc biệt')
        setInterval(() => toggleErrMsg('none'), 3000)
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
            setInterval(() => toggleErrMsg('none'), 3000)
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
    if (validator.blank(username) || !username.replace(/\s/g, '').length) {
        showNameErrMsg('Chưa nhập tài khoản')
        setInterval(() => toggleErrMsg('none'), 3000)
        return;
    }
    if (validator.blank(password) || !password.replace(/\s/g, '').length) {
        showNameErrMsgForSignUp('name-err-msg-password', 'Chưa nhập password')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-password', 'none'), 3000)
        return;
    }

    if (validator.blank(email) || !email.replace(/\s/g, '').length) {
        showNameErrMsgForSignUp('name-err-msg-email', 'Chưa nhập email')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-email', 'none'), 3000)
        return;
    }

    if (validator.blank(firstname) || !firstname.replace(/\s/g, '').length) {
        showNameErrMsgForSignUp('name-err-msg-firstname', 'Chưa nhập họ/tên đệm')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-firstname', 'none'), 3000)
        return;
    }
    if (validator.blank(lastname) || !lastname.replace(/\s/g, '').length) {
        showNameErrMsgForSignUp('name-err-msg-lastname', 'Chưa nhập tên')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-lastname', 'none'), 3000)
        return;
    }

    if (!validator.size(username, 6, 10)) {
        showNameErrMsgForSignUp('name-err-msg-username', 'tài khoản độ dài 6 đến 10 kí tự')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-username', 'none'), 3000)
        return;
    }

    if (validator.pattern(username, /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/)) {
        showNameErrMsgForSignUp('name-err-msg-username', 'không chứa kí tự đặc biệt')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-username', 'none'), 3000)
        return;
    }

    if (!validator.email(email)) {
        showNameErrMsgForSignUp('name-err-msg-email', 'theo định dạng email example@xyz.com')
        setInterval(() => hideNameErrMsgForSignUp('name-err-msg-email', 'none'), 3000)
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
        successRegisSwal()
        setInterval(() => window.location.replace("sign-in.html"), 2000)
    }).fail(function (jqXHR, textStatus, errorThrown) {
        if (jqXHR.status == 401 || jqXHR.status == 415 || jqXHR.status == 500) {
            showNameErrMsg("Lỗi hệ thống");
            setInterval(() => toggleErrMsg('none'), 3000)
            return;
        } else {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}

function showNameErrMsgForSignUp(block, message) {
    const selector = '#' + block
    $(selector).html(message);
    toggleErrMsg('block');
}

function hideNameErrMsgForSignUp(block, style) {
    const selector = '#' + block
    $(selector).css('display', style);
}

function showNameErrMsg(message) {
    $('#name-err-msg').html(message);
    toggleErrMsg('block');
}

function toggleErrMsg(style) {
    $('#name-err-msg').css('display', style);
}