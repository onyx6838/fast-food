package com.handout.entity.desc;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Prod_Desc")
@NoArgsConstructor
@Getter
@Setter
public class ProdDesc extends ProdCombDesc {

}
