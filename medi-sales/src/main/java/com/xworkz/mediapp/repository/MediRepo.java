package com.xworkz.mediapp.repository;

import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.entity.MediEntity;
import com.xworkz.mediapp.entity.MediProductEntity;

import java.util.List;

public interface MediRepo {
    boolean addUser(MediEntity mediEntity);
    MediEntity getEntityByEmail(String email);

    boolean updateUserEntity(MediEntity mediEntity);

    MediEntity getEntityByPhone(Long no);

    boolean updatePasswordByEmail(String email, String password, String c_Password);

    boolean addProduct(MediProductEntity mediEntity);

    List<MediProductEntity> getAllProductsStocks();

    MediProductEntity getProductById(Integer id);

    MediProductEntity getDistributorDtoByProductName(String product_name);

    List<MediEntity> getAllCustomers();

    int getStockByProduct(String product_name);

    MediEntity getUserByCustomerName(String contact_person);

    List<MediEntity> getPersonsByBn(String bn);
}
