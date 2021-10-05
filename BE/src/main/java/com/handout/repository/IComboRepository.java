package com.handout.repository;

import com.handout.entity.Category;
import com.handout.entity.Combo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IComboRepository extends JpaRepository<Combo, Integer> {
    Combo findComboByName(String name);
}
