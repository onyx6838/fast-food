package com.handout.form;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderForm {
    private int customerId;

    private String name;

    private String province;

    private String note;

    private String username;

    private Double totalPrice;
}