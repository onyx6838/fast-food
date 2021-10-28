package com.handout.service;

import com.handout.entity.Order;
import com.handout.form.OrderForm;

import java.util.List;

public interface IOrderService {
    Order createOrder(Order order, OrderForm form);
    List<Order> getAllOrders();
}
