package com.handout.service.impl;

import com.handout.entity.Product;
import com.handout.repository.IProductRepository;
import com.handout.service.IProductService;
import com.handout.specification.ProductSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

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
        Page<Product> products = productRepository.getProductsByCategoryIdAndFindByName(name, id, pageable);
        products.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return products;
    }

    @Override
    public Product getProductById(int id) {
        Product product = productRepository.findById(id).get();
        product.setImage(imagesPath + product.getImage());
        return product;
    }

    // search products belong to specific categories with {id}
    @Override
    public Page<Product> getAllProductsBySpec(Pageable pageable, String name, int id) {
        Specification<Product> where = new ProductSpecification("category.id", "=", id);
        if (!ObjectUtils.isEmpty(name)) {
            Specification<Product> nameSpec = new ProductSpecification("name", "LIKE", name);
            where = where.and(nameSpec);
        }
        Page<Product> products = productRepository.findAll(where, pageable);
        products.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return products;
    }
}
