package com.handout.controller;

import com.handout.entity.Product;
import com.handout.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/v1/products")
@CrossOrigin("*")
public class ProductController {
    @Autowired
    private IProductService productService;

    @GetMapping()
    public ResponseEntity<Page<Product>> getAllDepartments(Pageable pageable) {
        Page<Product> entitiesPage = productService.getAllProducts(pageable);
        return new ResponseEntity<>(entitiesPage, HttpStatus.OK);
    }
}