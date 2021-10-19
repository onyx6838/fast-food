package com.handout.entity;

import com.handout.entity.enumerate.Status;
import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity(name = "Combo")
public class Combo extends BaseEntity<String> {
    @Column(name = "ComboID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name = "TotalPrice", length = 50)
    private Double totalPrice;

    @Column(name = "Image", length = 800)
    private String image;

    @Column(name = "Description", length = 50)
    private String description;

    @Column(name = "Status")
    @Enumerated(EnumType.ORDINAL)
    private Status status;

//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<ComboProduct> comboProducts;
//
//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<OrderDetail> orderDetails;
}
