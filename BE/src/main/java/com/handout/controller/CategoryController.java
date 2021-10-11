package com.handout.controller;

import com.handout.entity.Category;
import com.handout.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "api/v1/categories")
@CrossOrigin("*")
public class CategoryController {
    @Autowired
    private ICategoryService service;

    @GetMapping()
    public ResponseEntity<Page<Category>> getAllCategories(Pageable pageable) {
        Page<Category> entities = service.getAllCategories(pageable);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }
}
