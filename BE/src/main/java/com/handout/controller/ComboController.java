package com.handout.controller;

import com.handout.entity.Combo;
import com.handout.service.IComboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/combos")
@CrossOrigin("*")
public class ComboController {

    private final IComboService comboService;

    @Autowired
    public ComboController(IComboService comboService) {
        this.comboService = comboService;
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getComboById(@PathVariable(name = "id") int id) {
        Combo entity = comboService.getComboByID(id);
        return new ResponseEntity<>(entity, HttpStatus.OK);
    }

    @GetMapping()
    public ResponseEntity<Page<Combo>> getAllCombos(@RequestParam(required = false) String name,
                                                    @PageableDefault(value = 100) Pageable pageable) {
        //Page<Combo> entities = comboService.getCombosByName(name, pageable);
        Page<Combo> entities = comboService.getAllCombos(name, pageable);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }
}
