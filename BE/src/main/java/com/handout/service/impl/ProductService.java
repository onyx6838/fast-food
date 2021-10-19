package com.handout.service.impl;

import com.handout.entity.Product;
import com.handout.repository.IProductRepository;
import com.handout.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductService implements IProductService {
    @Autowired
    private IProductRepository productRepository;

    @Override
    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.findById(id).get();
    }
}
