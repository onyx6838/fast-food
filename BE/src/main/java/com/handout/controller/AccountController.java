package com.handout.controller;

import com.handout.entity.Account;
import com.handout.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/accounts")
@CrossOrigin("*")
public class AccountController {

    @Autowired
    private IAccountService accountService;

    @GetMapping("/{username}")
    public ResponseEntity<Account> findByUsername(@PathVariable(name = "username") String username) {
        Account entities = accountService.getAccountByUsername(username);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

}
