package com.handout.service.impl;

import com.handout.entity.Order;
import com.handout.repository.IOrderRepository;
import com.handout.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService {
    @Autowired
    private IOrderRepository repository;

    @Override
    public List<Order> getAllOrders() {
        return repository.findAll();
    }
}
