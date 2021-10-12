package com.handout.repository;

import com.handout.entity.Combo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IComboRepository extends JpaRepository<Combo, Integer> {
    Combo findComboByName(String name);
}
