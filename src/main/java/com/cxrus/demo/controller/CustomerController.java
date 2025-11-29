package com.cxrus.demo.controller;

import com.cxrus.demo.dto.TopCustomerDTO;
import com.cxrus.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDate;
import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/")
    public String index(Model model) {
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(30);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "index";
    }

    @GetMapping("/top-customers")
    public String getTopCustomers(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            Model model) {
        List<TopCustomerDTO> topCustomers = customerService.getTop10CustomersByOrders(startDate, endDate);
        model.addAttribute("topCustomers", topCustomers);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("searched", true);
        return "index";
    }
}
