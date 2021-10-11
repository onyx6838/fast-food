package com.handout.entity;

import com.handout.entity.enumerate.OrderStatus;
import com.handout.entity.enumerate.PaymentStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
@Entity(name = "Order")
public class Order extends BaseEntity<String> {
    @Column(name = "OrderID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Description")
    private String description;

    @Column(name = "Province", length = 50)
    private String province;

    @Column(name = "District", length = 50)
    private String district;

    @Column(name = "Ward", length = 50)
    private String ward;

    @Column(name = "TotalPrice", precision = 19, scale = 4)
    private Double totalPrice;

    @Column(name = "Note")
    private String note;

    @Column(name = "OrderStatus")
    @Enumerated(EnumType.ORDINAL)
    private OrderStatus orderStatus;

    @Column(name = "PaymentStatus")
    @Enumerated(EnumType.ORDINAL)
    private PaymentStatus paymentStatus;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderDetail> orderDetails;

    @ManyToOne
    @JoinColumn(name="EmployeeID")
    private Account employeeAccount;

    @ManyToOne
    @JoinColumn(name="CustomerID")
    private Account customerAccount;
}
