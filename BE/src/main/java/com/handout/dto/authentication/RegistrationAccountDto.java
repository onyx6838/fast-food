package com.handout.dto.authentication;

import com.handout.validation.form.account.UserEmailExists;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegistrationAccountDto {
    // check not null, check length , check exists, check format (regex)
    @NotNull
    @Size(min = 6, max = 15)
    private String userName;
    // check not null, check length , check exists on database, check format (regex)
    @NotNull
    @Size(min = 10)
    @UserEmailExists
    private String email;

    @NotNull
    private String password;

    @Size(max = 50)
    private String firstName;

    @Size(max = 50)
    private String lastName;

    @NotNull
    private String role;
}
