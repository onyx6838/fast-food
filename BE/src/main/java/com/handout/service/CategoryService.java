package com.handout.service;

import com.handout.entity.Category;
import com.handout.repository.ICategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService implements ICategoryService {
    @Autowired
    private ICategoryRepository repository;

    @Override
    public List<Category> getAllCategories() {
        return repository.findAll();
    }

    @Override
    public Category getCategoryByID(int id) {
        return repository.getById(id);
    }

    @Override
    public Category getCategoryByName(String name) {
        return repository.findCategoryByName(name);
    }
}
