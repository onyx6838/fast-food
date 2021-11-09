package com.handout.specification;

import com.handout.entity.Product;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class ProductSpecification implements Specification<Product> {
    private final String field;
    private final String operator;
    private final Object value;

    public ProductSpecification(String field, String operator, Object value) {
        this.field = field;
        this.operator = operator;
        this.value = value;
    }

    @Override
    public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        if (operator.equalsIgnoreCase("LIKE")) {
            return builder.like(builder.lower(root.get(field)), "%" + value.toString() + "%");
        }
        if (operator.equalsIgnoreCase("=")) {
            if (field.equalsIgnoreCase("category.id")) {
                return builder.equal(root.get("category").get("id"), value);
            }
        }
        return null;
    }
}
