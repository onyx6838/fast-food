package com.handout.entity;

import com.handout.entity.enumerate.Status;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
@Entity(name = "Product")
public class Product extends BaseEntity<String> {
    @Column(name = "`ProductID`")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "`Name`", length = 50)
    private String name;

    @Column(name = "`Slug`", length = 50)
    private String slug;

    @Column(name = "`Image`", length = 800)
    private String image;

    @Column(name = "`Description`")
    private String description;

    @Column(name = "`Price`", precision = 19, scale = 4)
    private Double price;

    @Column(name = "`Rating`")
    private Integer rating;

    @Column(name = "`Status`")
    @Enumerated(EnumType.ORDINAL)
    private Status status;

    @ManyToOne
    @JoinColumn(name = "CategoryID")
    private Category category;

//    avoid hell call
//    @OneToMany(mappedBy = "product")
//    private List<ComboProduct> comboProducts;
//
//    @OneToMany(mappedBy = "product")
//    private List<OrderDetail> orderDetails;
}
