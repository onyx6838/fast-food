package com.handout.service;

import com.handout.entity.Account;

public interface IEmailService {
    void sendRegistrationUserConfirm(String email);

    void sendResetPassword(Account account, String token);
}
