package com.handout.service.impl;

import com.handout.entity.Account;
import com.handout.entity.Order;
import com.handout.form.OrderForm;
import com.handout.repository.IOrderRepository;
import com.handout.service.IAccountService;
import com.handout.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderService implements IOrderService {
    @Autowired
    private IOrderRepository repository;

    @Autowired
    private IAccountService accountService;

    @Override
    public Order createOrder(Order order, OrderForm form) {
        Account account = accountService.findById(form.getCustomerId());
        order.setCustomerAccount(account);
        return repository.save(order);
    }

    @Override
    public List<Order> getAllOrders() {
        return repository.findAll();
    }
}
