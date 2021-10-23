package com.handout.service;


import com.handout.entity.Account;
import com.handout.entity.authentication.ResetPasswordToken;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface IAccountService extends UserDetailsService {
    Account getAccountByUsername(String username);

    Account findById(int id);

    void createAccount(Account account);

    Account findAccountByEmail(String email);

    void activeAccount(String token);

    void sendConfirmAccountRegistrationViaEmail(String email);

    void resetPassword(String token, String newPassword);

    ResetPasswordToken getResetPasswordToken(String token);

    void deleteResetPasswordTokenByAccountId(int accountId);

    boolean existsByEmail(String email);

    void resetPasswordViaEmail(String email);
}
