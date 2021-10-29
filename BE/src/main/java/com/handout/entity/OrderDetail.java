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
