package com.handout.service.impl;

import com.handout.entity.Combo;
import com.handout.repository.IComboRepository;
import com.handout.service.IComboService;
import com.handout.specification.ComboSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

@Service
public class ComboService implements IComboService {
    @Autowired
    private IComboRepository repository;

    @Value("${images.resource}")
    private String imagesPath;

    @Override
    public Page<Combo> getAllCombos(String name, Pageable pageable) {
        Specification<Combo> spec = null;
        if (!ObjectUtils.isEmpty(name)) {
            spec = new ComboSpecification("name", "LIKE", name);
        }
        Page<Combo> combos = repository.findAll(spec, pageable);
        combos.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return combos;
    }

    @Override
    public Page<Combo> getCombosByName(String name, Pageable pageable) {
        Page<Combo> combos = repository.getCombosByName(name, pageable);
        combos.forEach(x -> x.setImage(imagesPath + x.getImage()));
        return combos;
    }

    @Override
    public Combo getComboByID(int id) {
        Combo combo = repository.findById(id).get();
        combo.setImage(imagesPath + combo.getImage());
        return combo;
    }
}
