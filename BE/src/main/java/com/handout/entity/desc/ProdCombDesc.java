package com.handout.entity.desc;

import com.handout.entity.Combo;
import com.handout.entity.Product;
import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "prod_comb_desc")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type", discriminatorType = DiscriminatorType.STRING)
public class ProdCombDesc {
    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "short_desc")
    private String short_desc;

    @Column(name = "description")
    private String description;

    @Column(name = "lang", length = 20)
    private String lang;

//    @OneToOne
//    @JoinColumn(name = "item_id", referencedColumnName = "id", nullable = false)
//    protected Product product;
//
//    @OneToOne
//    @JoinColumn(name = "item_id", referencedColumnName = "id", nullable = false)
//    protected Combo combo;

}