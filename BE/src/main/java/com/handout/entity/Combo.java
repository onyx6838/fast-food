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
@Entity(name = "Combo")
public class Combo extends BaseEntity<String> {
    @Column(name = "ComboID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name")
    private String name;

    @Column(name = "TotalPrice", length = 50)
    private Double totalPrice;

    @Column(name = "Image", length = 800)
    private String image;

    @Column(name = "Description")
    private String description;

    @Column(name = "Status")
    @Enumerated(EnumType.ORDINAL)
    private Status status;

//    @OneToMany(mappedBy = "combo")
//    @JsonManagedReference
//    private List<ProdCombDesc> descList;

//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<ComboProduct> comboProducts;
//
//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<OrderDetail> orderDetails;
}
