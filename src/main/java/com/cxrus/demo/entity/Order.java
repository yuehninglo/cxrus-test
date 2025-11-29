package com.cxrus.demo.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "orders")
@Data
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderid")
    private Integer orderId;

    @Column(name = "customerid")
    private Integer customerId;

    @Column(name = "employeeid")
    private Integer employeeId;

    @Column(name = "orderdate")
    private LocalDate orderDate;

    @Column(name = "requireddate")
    private LocalDate requiredDate;

    @Column(name = "shippeddate")
    private LocalDate shippedDate;

    @Column(name = "shipvia")
    private Integer shipVia;

    @Column(name = "freight", precision = 10, scale = 2)
    private BigDecimal freight;

    @Column(name = "shipname", length = 100)
    private String shipName;

    @Column(name = "shipaddress", length = 100)
    private String shipAddress;

    @Column(name = "shipcity", length = 50)
    private String shipCity;

    @Column(name = "shipregion", length = 50)
    private String shipRegion;

    @Column(name = "shippostalcode", length = 20)
    private String shipPostalCode;

    @Column(name = "shipcountry", length = 50)
    private String shipCountry;

    @ManyToOne
    @JoinColumn(name = "customerid", insertable = false, updatable = false)
    private Customer customer;
}
