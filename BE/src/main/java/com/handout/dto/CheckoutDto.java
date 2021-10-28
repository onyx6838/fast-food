package com.handout.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@NoArgsConstructor
public class CheckoutDto {
    private OrderDto order;

    private List<CartItemDto> cart;

    @Data
    @NoArgsConstructor
    public static class OrderDto {
        private int customerId;

        @NotNull
        private String name;

        @NotNull
        private String province;

        @NotNull
        private String note;

        @NotNull
        private String username;

        @NotNull
        private Double totalPrice;
    }

    @Data
    @NoArgsConstructor
    public static class CartItemDto {
        private int id;

        @JsonProperty("qty")
        private Integer quantity;

        private Boolean isCombo;
    }
}
