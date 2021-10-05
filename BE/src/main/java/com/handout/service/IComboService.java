package com.handout.service;

import com.handout.entity.Category;
import com.handout.entity.Combo;

import java.util.List;

public interface IComboService {
    List<Combo> getAllCombos();

    Combo getComboByID(int id);

    Combo getComboByName(String name);
}
