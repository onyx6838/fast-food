package com.handout.repository;

import com.handout.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface IAccountRepository extends JpaRepository<Account, Integer> {
    Account findByUsername(String username);
}
