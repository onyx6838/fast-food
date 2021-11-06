package com.handout.service.impl;

import com.handout.entity.Category;
import com.handout.entity.Product;
import com.handout.repository.ICategoryRepository;
import com.handout.service.ICategoryService;
import com.handout.service.IProductService;
import com.handout.utils.UrlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;

@Service
public class CategoryService implements ICategoryService {
    private final ICategoryRepository categoryRepository;

    private final IProductService productService;

    @Autowired
    public CategoryService(ICategoryRepository categoryRepository, IProductService productService) {
        this.categoryRepository = categoryRepository;
        this.productService = productService;

    }

    @Override
    public Page<Category> getAllCategories(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    @Override
    public Category getCategoryByID(int id) {
        return categoryRepository.findById(id).get();
    }

    // catId
    @Override
    public Page<Product> getProductsByCategoryIdAndFindByName(String name, int id, Pageable pageable) throws UnsupportedEncodingException {
        UrlUtils urlUtils = new UrlUtils();
        return productService.getProductsByCategoryIdAndFindByName(name, id , pageable);
    }
}
