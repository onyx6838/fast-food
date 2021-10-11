package com.handout.entity;

import com.handout.entity.enumerate.Status;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
@Entity(name = "OrderDetail")
public class OrderDetail extends BaseEntity<String>{
    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ComboID")
    private Combo combo;

    @ManyToOne
    @JoinColumn(name = "ProductID")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "OrderID")
    private Order order;

    @Column(name = "Discount")
    private Integer discount;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Status")
    @Enumerated(EnumType.ORDINAL)
    private Status status;
}
