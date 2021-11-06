package com.handout.service.impl;

import com.handout.entity.Product;
import com.handout.repository.IProductRepository;
import com.handout.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductService implements IProductService {
    @Autowired
    private IProductRepository productRepository;

    @Value("${images.resource}")
    private String imagesPath;

    @Override
    public Page<Product> getAllProducts(Pageable pageable) {

        if (null == pageable) {
            pageable = Pageable.unpaged();
        }
        Page<Product> products = productRepository.findAll(pageable);
        products.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return products;
    }

    @Override
    public Page<Product> getProductsByCategoryIdAndFindByName(String name, int id, Pageable pageable) {
        Page<Product> products =  productRepository.getProductsByCategoryIdAndFindByName(name, id, pageable);
        products.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return products;
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.findById(id).get();
    }
}
