package com.handout.service;

import com.handout.entity.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> getAllCategories();

    Category getCategoryByID(int id);

    Category getCategoryByName(String name);

}
