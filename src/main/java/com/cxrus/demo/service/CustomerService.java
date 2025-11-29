package com.cxrus.demo.service;

import com.cxrus.demo.dto.TopCustomerDTO;
import com.cxrus.demo.repo.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;

@Service
public class CustomerService {
    @Autowired
    private OrderRepository orderRepository;

    public List<TopCustomerDTO> getTop10CustomersByOrders(LocalDate startDate, LocalDate endDate) {
        return orderRepository.findTop10CustomersByOrderCount(startDate, endDate);
    }
}
