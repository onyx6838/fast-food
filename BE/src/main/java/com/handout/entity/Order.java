package com.handout.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.handout.entity.enumerate.OrderStatus;
import com.handout.entity.enumerate.PaymentStatus;
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
@Entity(name = "`Order`")
public class Order extends BaseEntity<String> {
    @Column(name = "OrderID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Contact", length = 20)
    private String contact;

    @Column(name = "Address")
    private String address;

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

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "EmployeeID")
    private Account employeeAccount;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "CustomerID")
    private Account customerAccount;
}
