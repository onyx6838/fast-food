package com.handout.entity.authentication;

import com.handout.entity.Account;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("RefreshToken")
@NoArgsConstructor
public class RefreshToken extends Token{
    public RefreshToken(String token, Account account, long expiredTime) {
        super(token, account, expiredTime);
    }
}
