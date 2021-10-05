package com.handout.repository;

import com.handout.entity.ComboProduct;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IComboProductRepository extends JpaRepository<ComboProduct, Integer> {
}
