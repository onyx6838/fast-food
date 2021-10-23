package com.handout.service.impl;

import com.handout.service.IAccountService;
import com.handout.service.IEmailService;
import com.handout.config.resourceproperties.ServerProperty;
import com.handout.entity.Account;
import com.handout.repository.IRegistrationAccountTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService implements IEmailService {
    private final IAccountService accountService;

    private final IRegistrationAccountTokenRepository registrationAccountTokenRepository;

    private final JavaMailSender mailSender;

    private final ServerProperty serverProperty;

    @Autowired
    public EmailService(IAccountService accountService,
                        IRegistrationAccountTokenRepository registrationAccountTokenRepository,
                        JavaMailSender mailSender,
                        ServerProperty serverProperty) {
        this.accountService = accountService;
        this.registrationAccountTokenRepository = registrationAccountTokenRepository;
        this.mailSender = mailSender;
        this.serverProperty = serverProperty;
    }

    @Override
    public void sendRegistrationUserConfirm(String email) {
        Account account = accountService.findAccountByEmail(email);
        String token = registrationAccountTokenRepository.findByAccountId(account.getId());

        String confirmationUrl = serverProperty.getUrl() +  "/api/v1/accounts/activeUser?token=" + token;

        String subject = "Xác Nhận Đăng Ký Account";
        String content = "Bạn đã đăng ký thành công. Click vào link dưới đây để kích hoạt tài khoản \n"
                + confirmationUrl;

        sendEmail(email, subject, content);
    }

    private void sendEmail(final String recipientEmail, final String subject, final String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(recipientEmail);
        message.setSubject(subject);
        message.setText(content);

        mailSender.send(message);
    }

    @Override
    public void sendResetPassword(Account account, String token) {
        String confirmationUrl = "http://127.0.0.1:5501/html/reset-password.html/" + token;

        String subject = "Reset Password";
        String content = "Click on the link below to reset your password (if not you, please ignore).\n"
                + confirmationUrl;

        sendEmail(account.getEmail(), subject, content);
    }
}
