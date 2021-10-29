package com.handout.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.handout.entity.enumerate.Status;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity(name = "Category")
public class Category extends BaseEntity<String> {
    @Column(name = "CategoryID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name = "Slug", length = 50)
    private String slug;

    @Column(name = "OrderBy")
    private Integer orderBy;

    @Column(name = "Image", length = 800)
    private String image;

    @Column(name = "Status")
    @Enumerated(EnumType.ORDINAL)
    private Status status;

    @OneToMany(mappedBy = "category")
    @JsonManagedReference
    private List<Product> products;
}
