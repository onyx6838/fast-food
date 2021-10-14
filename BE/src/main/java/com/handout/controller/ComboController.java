package com.handout.controller;

import com.handout.entity.Combo;
import com.handout.service.IComboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "api/v1/combos")
@CrossOrigin("*")
public class ComboController {
    @Autowired
    private IComboService service;

    @GetMapping()
    public ResponseEntity<List<Combo>> getAllCombos() {
        List<Combo> entities = service.getAllCombos();
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

}
