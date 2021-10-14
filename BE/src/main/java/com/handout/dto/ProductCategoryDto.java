package com.handout.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class ProductCategoryDto {
    List<DetailProductDto> products;

    @Data
    @NoArgsConstructor
    static class DetailProductDto {
        private int id;

        private String name;

        private String slug;

        private String image;

        private String description;

        private Double price;

        private Integer rating;
    }
}
