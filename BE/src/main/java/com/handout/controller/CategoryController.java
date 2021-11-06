package com.handout.controller;

import com.handout.entity.Category;
import com.handout.entity.Product;
import com.handout.service.ICategoryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;

@RestController
@RequestMapping(value = "api/v1/categories")
@CrossOrigin("*")
public class CategoryController {

    private final ICategoryService categoryService;

    private final ModelMapper modelMapper;

    @Autowired
    public CategoryController(ICategoryService categoryService, ModelMapper modelMapper) {
        this.categoryService = categoryService;
        this.modelMapper = modelMapper;
    }

    @GetMapping()
    public ResponseEntity<Page<Category>> getAllCategories(Pageable pageable) {
        Page<Category> entities = categoryService.getAllCategories(pageable);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProductsByCategory(@PathVariable(name = "id") int id, Pageable pageable) {
        Category category = categoryService.getCategoryByID(id);
//        ProductCategoryDto productCategoryDto = modelMapper.map(category, ProductCategoryDto.class);
//        Page<?> page = (Page<?>) productCategoryDto.getProducts();
        return new ResponseEntity<>(category.getProducts(), HttpStatus.OK);
    }

    @GetMapping("/{id}/products")
    public ResponseEntity<?> getProductsByCategory(@PathVariable(name = "id") int id, @RequestParam(required = false) String name, Pageable pageable) throws UnsupportedEncodingException {
        Page<Product> products = categoryService.getProductsByCategoryIdAndFindByName(name, id, pageable);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
}
