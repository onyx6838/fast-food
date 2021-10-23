package com.handout.service.impl;

import com.handout.config.event.OnSendRegistrationUserConfirmViaEmailEvent;
import com.handout.entity.Account;
import com.handout.entity.authentication.RegistrationUserToken;
import com.handout.entity.authentication.ResetPasswordToken;
import com.handout.entity.enumerate.UserStatus;
import com.handout.repository.IAccountRepository;
import com.handout.repository.IRegistrationAccountTokenRepository;
import com.handout.repository.IResetPasswordTokenRepository;
import com.handout.service.IAccountService;
import com.handout.service.IEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class AccountService implements IAccountService {
    @Value("${reset-password.token.expired-time}")
    private long resetPasswordTokenExpiredTime;

    @Value("${registration.token.expired-time}")
    private long registrationPasswordTokenExpiredTime;

    private final IAccountRepository repository;

    private final IResetPasswordTokenRepository resetPasswordTokenRepository;

    private final ApplicationEventPublisher eventPublisher;

    private final IRegistrationAccountTokenRepository registrationAccountTokenRepository;

    private final PasswordEncoder passwordEncoder;

    private final IEmailService emailService;

    @Autowired
    public AccountService(IAccountRepository repository,
                          IResetPasswordTokenRepository resetPasswordTokenRepository,
                          ApplicationEventPublisher eventPublisher,
                          IRegistrationAccountTokenRepository registrationAccountTokenRepository,
                          PasswordEncoder passwordEncoder,
                          @Lazy IEmailService emailService) {
        this.repository = repository;
        this.resetPasswordTokenRepository = resetPasswordTokenRepository;
        this.eventPublisher = eventPublisher;
        this.registrationAccountTokenRepository = registrationAccountTokenRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    @Override
    public Account getAccountByUsername(String username) {
        return repository.findByUsername(username);
    }

    @Override
    public Account findById(int id) {
        return repository.findById(id).get();
    }

    @Override
    public void createAccount(Account account) {
        // create user
        account.setPassword(passwordEncoder.encode(account.getPassword()));
        repository.save(account);

        // create new user registration token
        createNewRegistrationUserToken(account);

        // send email to confirm
        sendConfirmAccountRegistrationViaEmail(account.getEmail());
    }

    @Override
    public Account findAccountByEmail(String email) {
        return repository.findByEmail(email);
    }

    @Override
    public void activeAccount(String token) {
        RegistrationUserToken registrationUserToken = registrationAccountTokenRepository.findByToken(token);

        Account account = registrationUserToken.getAccount();
        account.setStatus(UserStatus.ACTIVE);

        repository.save(account);

        // remove Registration User Token
        registrationAccountTokenRepository.deleteById(registrationUserToken.getId());
    }

    @Override
    public void sendConfirmAccountRegistrationViaEmail(String email) {
        eventPublisher.publishEvent(new OnSendRegistrationUserConfirmViaEmailEvent(email));
    }

    @Override
    public void resetPassword(String token, String newPassword) {
        // get token
        ResetPasswordToken resetPasswordToken = getResetPasswordToken(token);

        // change password
        Account user = resetPasswordToken.getAccount();
        user.setPassword(passwordEncoder.encode(newPassword));
        repository.save(user);        // ???

        deleteResetPasswordTokenByAccountId(resetPasswordToken.getId());
    }

    @Override
    public ResetPasswordToken getResetPasswordToken(String token) {
        return resetPasswordTokenRepository.findByToken(token);
    }

    @Override
    public void deleteResetPasswordTokenByAccountId(int accountId) {
        resetPasswordTokenRepository.deleteByUserId(accountId);
    }

    @Override
    public boolean existsByEmail(String email) {
        return repository.existsByEmail(email);
    }

    @Override
    public void resetPasswordViaEmail(String email) {
        // find user by email
        Account account = findAccountByEmail(email);

        // remove token token if exists
        resetPasswordTokenRepository.deleteByUserId(account.getId());

        // create new reset password token
        String newToken = createNewResetPasswordToken(account);

        // send email
        emailService.sendResetPassword(account, newToken);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = repository.findByUsername(username);
        if (account == null) {
            throw new UsernameNotFoundException(username);
        }
        return new User(account.getUsername(), account.getPassword(),
                AuthorityUtils.createAuthorityList(account.getRole()));
    }

    private void createNewRegistrationUserToken(Account account) {
        // create new token for confirm Registration
        final String newToken = UUID.randomUUID().toString();
        RegistrationUserToken token = new RegistrationUserToken(newToken, account, registrationPasswordTokenExpiredTime);

        registrationAccountTokenRepository.save(token);
    }

    private String createNewResetPasswordToken(Account account) {
        // create new token for Resetting password
        final String newToken = UUID.randomUUID().toString();
        ResetPasswordToken token = new ResetPasswordToken(newToken, account, resetPasswordTokenExpiredTime);

        resetPasswordTokenRepository.save(token);
        return newToken;
    }

}
