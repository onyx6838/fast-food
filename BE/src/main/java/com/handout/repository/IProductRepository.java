package com.handout.repository;

import com.handout.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IProductRepository extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product> {

    @Query("SELECT p FROM Product p where (:name is null or p.name like lower(CONCAT('%',:name,'%'))) AND p.category.id = :catId")
    Page<Product> getProductsByCategoryIdAndFindByName(@Param("name") String name, @Param("catId") int catId, Pageable pageable);
}
