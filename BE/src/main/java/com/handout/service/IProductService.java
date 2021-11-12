package com.handout.service;

import com.handout.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IProductService {
    Page<Product> getAllProducts(Pageable pageable);

    Product getProductById(int id);

    Page<Product> getAllProductsByCatIdAndFindByName(Pageable pageable, String name, int id);
}
