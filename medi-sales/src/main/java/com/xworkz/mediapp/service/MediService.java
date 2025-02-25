package com.xworkz.mediapp.service;

import com.xworkz.mediapp.dto.MediDto;
import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.entity.MediProductEntity;

import java.util.List;

public interface MediService {
    boolean addUser(MediDto dto);
    boolean sendRegistration(String subject, String body, String email);
    MediDto validateLogin(String email, String password);

    String checkEmail(String email);

    String checkPhone(Long no);

    String sendOtp(String email);

    String validateOtp(String otp, String email);

    boolean updatePasswordByEmail(String email, String password, String c_Password);

    boolean addProduct(MediProductDto dto,MediDto sessionDto);

    List<MediProductDto> getAllProductsStocks();

    MediProductEntity getProductById(Integer id);

    MediProductDto getDistributorDtoByProductName(String product_name);

    List<MediDto> getAllCustomers();

    int getStockByProduct(String product_name);

    MediDto getUserByCustomerName(String contact_person);

    void pdfGenerate(List<MediProductDto> dto,MediDto mediDto,Object finalAmount);

    List<MediDto> getPersonsByBn(String bn);
}
