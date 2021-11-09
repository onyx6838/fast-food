package com.handout.repository;

import com.handout.entity.Combo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface IComboRepository extends JpaRepository<Combo, Integer>, JpaSpecificationExecutor<Combo> {
    @Query("SELECT c FROM Combo c where (:name is null or trim(c.name) like lower(CONCAT('%',trim(:name),'%')))")
    Page<Combo> getCombosByName(String name, Pageable pageable);
}
