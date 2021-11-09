package com.handout.specification;

import com.handout.entity.Combo;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class ComboSpecification implements Specification<Combo> {
    private final String field;
    private final String operator;
    private final Object value;

    public ComboSpecification(String field, String operator, Object value) {
        this.field = field;
        this.operator = operator;
        this.value = value;
    }

    @Override
    public Predicate toPredicate(Root<Combo> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        if (operator.equalsIgnoreCase("LIKE")) {
            return builder.like(builder.lower(root.get(field)), "%" + value.toString() + "%");
        }
        return null;
    }
}
