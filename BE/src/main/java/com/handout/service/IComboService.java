package com.handout.service;

import com.handout.entity.Combo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IComboService {
    List<Combo> getAllCombos();

    Page<Combo> getCombosByName(String name, Pageable pageable);

    Combo getComboByID(int id);

}
