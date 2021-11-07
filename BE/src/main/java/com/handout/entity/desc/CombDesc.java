package com.handout.entity.desc;

import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Comb_Desc")
@NoArgsConstructor
public class CombDesc extends ProdCombDesc {
}
