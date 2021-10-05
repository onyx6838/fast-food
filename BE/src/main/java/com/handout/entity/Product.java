package com.handout.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@NoArgsConstructor
@Data
@Table
@Entity(name = "Product")
public class Product implements Serializable {
    @Column(name = "ProductID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name = "Slug", length = 50)
    private String slug;

    @Column(name = "Image", length = 800)
    private String image;

    @Column(name = "Description", length = 50)
    private String description;

    @Column(name = "Price", precision = 19, scale = 4)
    private double price;
}
