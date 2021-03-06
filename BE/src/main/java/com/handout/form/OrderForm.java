package com.handout.form;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
public class OrderForm {
    private int customerId;

    @NotNull
    private String name;

    private String contact;

    @NotNull
    private String province;

    private String district;

    @NotNull
    private String address;

    private String ward;

    @NotNull
    private String note;

    @NotNull
    private String username;

    @NotNull
    private Double totalPrice;
}