package com.handout.controller;

import com.handout.dto.CheckoutDto;
import com.handout.entity.Order;
import com.handout.form.OrderForm;
import com.handout.service.IOrderDetailService;
import com.handout.service.IOrderService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/cart")
@CrossOrigin("*")
public class CartController {

    private final ModelMapper modelMapper;

    private final IOrderService orderService;

    private final IOrderDetailService orderDetailService;

    @Autowired
    public CartController(ModelMapper modelMapper, IOrderService orderService, IOrderDetailService orderDetailService) {
        this.modelMapper = modelMapper;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
    }

    @PostMapping()
    public ResponseEntity<?> checkout(@RequestBody CheckoutDto dto) {
        Order order = modelMapper.map(dto.getOrder(), Order.class);
        order.setId(0);
        OrderForm form = modelMapper.map(dto.getOrder(), OrderForm.class);
        Order created = orderService.createOrder(order, form);
        orderDetailService.createOrderDetail(created, dto);
        return new ResponseEntity<>("ok", HttpStatus.OK);
    }
}
