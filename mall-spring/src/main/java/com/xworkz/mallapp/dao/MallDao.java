package com.xworkz.mallapp.dao;


import com.xworkz.mallapp.dto.MallDto;

import java.util.List;

public interface MallDao {
    boolean addShop(MallDto mallDto);
    MallDto getShopById(int id);
    boolean updateShopNameById(String updatedShopName, int id);
    void removeShop(int id);
    String getOwnerNameById(Integer id);
    Object[] getShopNameAndLocationById(Integer id);
    Object[] getRevenueAndSizeByShopName(String shopName);
    MallDto updateShopNameById(Integer id, String shopName);
    MallDto updateRevenueById(Integer id, double revenue);
    boolean updateSizeByName(String name, double size);
    boolean removeShopByName(String name);

    List<MallDto> getShops();

    boolean updateShop(MallDto dto);
}
