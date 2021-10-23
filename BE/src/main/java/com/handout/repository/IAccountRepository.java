package com.handout.repository;

import com.handout.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IAccountRepository extends JpaRepository<Account, Integer> {
    boolean existsByUsername(String userName);

    boolean existsByEmail(String email);

    Account findByUsername(String name);

    Account findByEmail(String email);
}
