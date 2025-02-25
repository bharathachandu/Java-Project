package com.xworkz.mallapp.service;

import com.xworkz.mallapp.dto.MallDto;

import java.util.List;

public interface MallService {
    boolean addShop(MallDto mallDto);
    MallDto validateGetShopById(int id);
    boolean validateUpdateShopNameById(String updatedShopName, int id);
    void validateRemoveShop(int id);
    String validateGetOwnerNameById(Integer id);
    Object[] validateGetShopNameAndLocationById(Integer id);
    Object[] validateGetRevenueAndSizeByShopName(String shopName);
    MallDto validateUpdateShopNameById(Integer id, String shopName);
    MallDto validateUpdateRevenueById(Integer id, double revenue);
    boolean validateUpdateSizeByName(String name, double size);
    boolean validateRemoveShopByName(String name);

    List<MallDto> validateGetShop();

    boolean updateShop(MallDto dto);
}
