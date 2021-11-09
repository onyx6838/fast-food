package com.handout.entity;

import com.handout.entity.desc.CombDesc;
import com.handout.entity.enumerate.Status;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

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

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "item_id", nullable = false)
    @OrderColumn(name = "list_index")
    @Where(clause = "type='Comb_Desc'")
    private List<CombDesc> description_list = new ArrayList<>();

//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<ComboProduct> comboProducts;
//
//    @OneToMany(mappedBy = "combo", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<OrderDetail> orderDetails;
}