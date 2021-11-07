package com.handout.entity.desc;

import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Prod_Desc")
@NoArgsConstructor
public class ProdDesc extends ProdCombDesc {
}
