package com.handout.entity;

import com.handout.entity.enumerate.Status;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity(name = "ComboProduct")
public class ComboProduct extends BaseEntity<String> {
    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ComboID")
    private Combo combo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ProductID")
    private Product product;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Price", precision = 19, scale = 4)
    private Double price;

    @Column(name = "Status")
    @Enumerated(EnumType.ORDINAL)
    private Status status;
}
