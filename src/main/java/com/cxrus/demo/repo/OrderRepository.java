package com.cxrus.demo.repo;

import com.cxrus.demo.dto.TopCustomerDTO;
import com.cxrus.demo.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.NativeQuery;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    @NativeQuery("select s.CompanyName from Customers s left join Orders o " +
                 "on s.CustomerID = o.CustomerID " +
                 "where o.OrderDate between :startDate AND :endDate " +
                 "group by s.CompanyName " +
                 "order by count(o.OrderID) desc limit 10")
    List<TopCustomerDTO> findTop10CustomersByOrderCount(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );
}
