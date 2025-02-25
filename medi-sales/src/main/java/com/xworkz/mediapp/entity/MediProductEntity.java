package com.xworkz.mediapp.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "dist_details")
@Data
@ToString
@NamedQuery(name = "getProductById",query = "SELECT s FROM MediProductEntity s where s.id=:id")
@NamedQuery(name = "getAllProductsStocks",query = "SELECT s FROM MediProductEntity s")
public class MediProductEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String product_Company;
    private String product_name;
    private String hsn;
    private String mrp;
    private String  pack ;
    private String  batch_no ;
    private String  mfg_date ;
    private String  exp_date ;
    private Integer quantity;
    private Double  rate ;
    private Double discount;
    private String  createdBy;
    private LocalDate createdDate ;
    private String updateBy;
    private Date updateDate;
    private Double discountAmt;
    private Double gst;
    private Double gstAmount;
    private Double totalAmount;
}
