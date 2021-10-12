package com.handout.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailProductDto {
    private String name;

    private String slug;

    private String image;

    private String description;

    private Double price;

    private Integer rating;
}
