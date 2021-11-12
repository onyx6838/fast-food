package com.handout.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.handout.entity.desc.ProdDesc;
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
@Entity(name = "Product")
public class Product extends BaseEntity<String> {
    @Column(name = "`ProductID`")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "`Name`", length = 50)
    private String name;

    @Column(name = "`Slug`", length = 50)
    private String slug;

    @Column(name = "`Image`", length = 800)
    private String image;

    @Column(name = "`Description`")
    private String description;

    @Column(name = "`Price`", precision = 19, scale = 4)
    private Double price;

    @Column(name = "`Rating`")
    private Integer rating;

    @Column(name = "`Status`")
    @Enumerated(EnumType.ORDINAL)
    private Status status;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "CategoryID")
    private Category category;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "item_id_prod", nullable = false)
    @OrderColumn(name = "list_index")
    @Where(clause = "type='Prod_Desc'")
    private List<ProdDesc> description_list = new ArrayList<>();
}