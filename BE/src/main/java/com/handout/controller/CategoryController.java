package com.handout.controller;

import com.handout.entity.Category;
import com.handout.entity.Product;
import com.handout.service.ICategoryService;
import com.handout.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/categories")
@CrossOrigin("*")
public class CategoryController {

    private final ICategoryService categoryService;

    private final IProductService productService;

    @Autowired
    public CategoryController(ICategoryService categoryService, IProductService productService) {
        this.categoryService = categoryService;
        this.productService = productService;
    }

    @GetMapping()
    public ResponseEntity<Page<Category>> getAllCategories(Pageable pageable) {
        Page<Category> entities = categoryService.getAllCategories(pageable);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

    @GetMapping("/{id}/products")
    public ResponseEntity<?> getProductsByCategory(@PathVariable(name = "id") int id,
                                                   @RequestParam(required = false) String name,
                                                   Pageable pageable){
        //Page<Product> products = categoryService.getProductsByCategoryIdAndFindByName(name, id, pageable);
        Page<Product> products = productService.getAllProductsBySpec(pageable, name, id);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

}
