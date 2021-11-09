package com.handout.service;

import com.handout.entity.Combo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IComboService {
    Page<Combo> getAllCombos(String name, Pageable pageable);

    Page<Combo> getCombosByName(String name, Pageable pageable);

    Combo getComboByID(int id);

}
