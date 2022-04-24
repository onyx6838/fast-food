package com.handout.dto;

import com.handout.entity.desc.ProdDesc;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

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

    private Integer quantity;

    private List<ProdDesc> description_list;
}
