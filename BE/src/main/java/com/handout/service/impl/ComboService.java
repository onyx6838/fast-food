package com.handout.service.impl;

import com.handout.entity.Combo;
import com.handout.repository.IComboRepository;
import com.handout.service.IComboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComboService implements IComboService {
    @Autowired
    private IComboRepository repository;

    @Override
    public List<Combo> getAllCombos() {
        return repository.findAll();
    }

    @Override
    public Combo getComboByID(int id) {
        return repository.findById(id).get();
    }

    @Override
    public Combo getComboByName(String name) {
        return repository.findComboByName(name);
    }
}
