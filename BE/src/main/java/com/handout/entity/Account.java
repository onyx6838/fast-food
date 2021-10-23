package com.handout.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.handout.entity.enumerate.UserStatus;
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
@Entity(name = "account")
public class Account extends BaseEntity<String> {
    @Column(name = "`ID`")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "`FullName`", length = 50)
    private String fullName;

    @Column(name = "`Phone`", length = 30)
    private String phone;

    @Column(name = "`Email`", length = 50)
    private String email;

    @Column(name = "`Username`", length = 50)
    private String username;

    @Column(name = "`Password`", length = 800)
    private String password;

    @Column(name = "`Address`")
    private String address;

    @Column(name = "`Role`", length = 50)
    private String role;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "`Status`", nullable = false)
    private UserStatus status = UserStatus.NOT_ACTIVE;

    @JsonManagedReference
    @OneToMany(mappedBy = "employeeAccount", fetch = FetchType.LAZY)
    private List<Order> employees;

    @JsonManagedReference
    @OneToMany(mappedBy = "customerAccount", fetch = FetchType.LAZY)
    private List<Order> customers;
}
