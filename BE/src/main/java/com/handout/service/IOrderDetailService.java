package com.handout.service;

import com.handout.dto.CheckoutDto;
import com.handout.entity.Order;

public interface IOrderDetailService {
    void createOrderDetail(Order order, CheckoutDto dto);
}
