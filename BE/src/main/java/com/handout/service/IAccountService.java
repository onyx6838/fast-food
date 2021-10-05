package com.handout.service;


import com.handout.entity.Account;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface IAccountService extends UserDetailsService {
    Account getAccountByUsername(String username);

    Account findById(int id);
}
