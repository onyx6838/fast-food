package com.handout.service.impl;

import com.handout.entity.Combo;
import com.handout.repository.IComboRepository;
import com.handout.service.IComboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComboService implements IComboService {
    @Autowired
    private IComboRepository repository;

    @Value("${images.resource}")
    private String imagesPath;

    @Override
    public List<Combo> getAllCombos() {
        return repository.findAll();
    }

    @Override
    public Page<Combo> getCombosByName(String name, Pageable pageable) {
        Page<Combo> combos = repository.getCombosByName(name, pageable);
        combos.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return combos;
    }

    @Override
    public Combo getComboByID(int id) {
        return repository.findById(id).get();
    }
}
