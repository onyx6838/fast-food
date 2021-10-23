package com.handout.entity.authentication;

import com.handout.entity.Account;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("ResetPasswordToken")
@NoArgsConstructor
public class ResetPasswordToken extends Token{
    public ResetPasswordToken(String token, Account account, long expiredTime) {
        super(token, account, expiredTime);
    }
}
