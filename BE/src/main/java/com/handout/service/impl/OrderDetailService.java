package com.handout.service.impl;

import com.handout.dto.CheckoutDto;
import com.handout.entity.Combo;
import com.handout.entity.Order;
import com.handout.entity.OrderDetail;
import com.handout.entity.Product;
import com.handout.repository.IOrderDetailRepository;
import com.handout.service.IComboService;
import com.handout.service.IOrderDetailService;
import com.handout.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderDetailService implements IOrderDetailService {

    @Value("${images.resource}")
    private String imagesPath;

    @Autowired
    private IComboService comboService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IOrderDetailRepository orderDetailRepository;

    @Override
    public void createOrderDetail(Order order, CheckoutDto dto) {

        dto.getCart().forEach(x -> {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            if (x.getIsCombo()) {
                Combo combo = comboService.getComboByID(x.getId());
                String originalImg = combo.getImage().replace(imagesPath, "");
                combo.setImage(originalImg);
                orderDetail.setCombo(combo);
            } else {
                Product product = productService.getProductById(x.getId());
                String originalImg = product.getImage().replace(imagesPath, "");
                product.setImage(originalImg);
                orderDetail.setProduct(product);
            }

            orderDetail.setQuantity(x.getQuantity());
            orderDetailRepository.save(orderDetail);
        });
    }
}
