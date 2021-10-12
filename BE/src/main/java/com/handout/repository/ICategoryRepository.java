package com.handout.repository;

import com.handout.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICategoryRepository extends JpaRepository<Category, Integer> {
    Category findCategoryByName(String name);
}
