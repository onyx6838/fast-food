package com.handout.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
@Entity(name = "`Account`")
public class Account extends BaseEntity<String> {
    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name = "Phone", length = 30)
    private String phone;

    @Column(name = "Email", length = 50)
    private String email;

    @Column(name = "Password", length = 50)
    private String password;

    @Column(name = "Address")
    private String address;

    @Column(name = "Role", length = 50)
    private String role;

    @OneToMany(mappedBy = "payerAccount", fetch = FetchType.EAGER)
    private List<Order> employees;

    @OneToMany(mappedBy = "receiverAccount", fetch = FetchType.EAGER)
    private List<Order> customers;
}
