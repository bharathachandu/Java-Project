package com.xworkz.mediapp.dto;

import lombok.*;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MediProductDto implements Serializable {

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
