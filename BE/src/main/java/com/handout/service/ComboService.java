package com.handout.service;

import com.handout.entity.Combo;
import com.handout.repository.IComboRepository;
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
        return repository.getById(id);
    }

    @Override
    public Combo getComboByName(String name) {
        return repository.findComboByName(name);
    }
}
