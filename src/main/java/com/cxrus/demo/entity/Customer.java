package com.cxrus.demo.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "customers")
@Data
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customerid")
    private Integer customerId;

    @Column(name = "companyname", nullable = false, length = 100)
    private String companyName;

    @Column(name = "contactname", length = 50)
    private String contactName;

    @Column(name = "contacttitle", length = 50)
    private String contactTitle;

    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "city", length = 50)
    private String city;

    @Column(name = "region", length = 50)
    private String region;

    @Column(name = "postalcode", length = 20)
    private String postalCode;

    @Column(name = "country", length = 50)
    private String country;

    @Column(name = "phone", length = 30)
    private String phone;

    @Column(name = "fax", length = 30)
    private String fax;
}
