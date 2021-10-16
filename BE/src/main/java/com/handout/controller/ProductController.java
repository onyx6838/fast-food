package com.handout.controller;

import com.handout.dto.DetailProductDto;
import com.handout.entity.Product;
import com.handout.service.IProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/products")
@CrossOrigin("*")
public class ProductController {
    private final IProductService productService;   // field injection

    private final ModelMapper modelMapper;

    @Autowired  // constructor Injection
    public ProductController(IProductService productService, ModelMapper modelMapper) {
        this.productService = productService;
        this.modelMapper = modelMapper;
    }

    @GetMapping()
    public ResponseEntity<?> getAllProducts(Pageable pageable) {
        Page<Product> entitiesPage = productService.getAllProducts(pageable);
        return new ResponseEntity<>(entitiesPage, HttpStatus.OK);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getProductByID(@PathVariable(name = "id") int id) {
        Product entity = productService.getProductById(id);
        DetailProductDto dto = modelMapper.map(entity, DetailProductDto.class);
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }
}