package com.handout.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class LoginInfoDto {
    private int id;
    private String fullName;
    private String username;
    private String role;
    private String jwt;
    private String refreshToken;
}
