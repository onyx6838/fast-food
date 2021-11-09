package com.handout.entity.desc;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Comb_Desc")
@NoArgsConstructor
@Getter
@Setter
public class CombDesc extends ProdCombDesc {

}
