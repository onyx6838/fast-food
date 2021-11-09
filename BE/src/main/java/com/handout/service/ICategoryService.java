package com.handout.service;

import com.handout.entity.Category;
import com.handout.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ICategoryService {
    Page<Category> getAllCategories(Pageable pageable);

    Category getCategoryByID(int id);

}
