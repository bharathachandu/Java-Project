package com.xworkz.mallapp.service;

import com.xworkz.mallapp.dao.MallDao;
import com.xworkz.mallapp.dto.MallDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.NoResultException;
import java.util.Collections;
import java.util.List;

@Component
public class MallServiceImpl implements MallService {

    @Autowired
    private MallDao mallDao;

    @Override
    public boolean addShop(MallDto mallDto) {
        boolean isShopAdded = false;
        if (mallDto != null) {
            mallDao.addShop(mallDto);
            isShopAdded = true;
        } else {
            System.out.println("Please provide valid shop details to add.");
        }
        return isShopAdded;
    }

    @Override
    public MallDto validateGetShopById(int id) {

            return mallDao.getShopById(id);

    }

    @Override
    public boolean validateUpdateShopNameById(String updatedShopName, int id) {
        boolean isUpdated = false;
        if (id > 0 && updatedShopName != null && !updatedShopName.isEmpty()) {
            mallDao.updateShopNameById(updatedShopName, id);
            isUpdated = true;
        } else {
            System.out.println("Invalid ID or shop name provided.");
        }
        return isUpdated;
    }

    @Override
    public void validateRemoveShop(int id) {
        if (id > 0) {
            mallDao.removeShop(id);
        }
    }

    @Override
    public String validateGetOwnerNameById(Integer id) {
        if (id > 0) {
                return mallDao.getOwnerNameById(id);
        }
        return null;
    }

    @Override
    public Object[] validateGetShopNameAndLocationById(Integer id) {
        if (id > 0) {
                return mallDao.getShopNameAndLocationById(id);
        }
        return null;
    }

    @Override
    public Object[] validateGetRevenueAndSizeByShopName(String shopName) {
        if (shopName != null && !shopName.isEmpty()) {
            try {
                return mallDao.getRevenueAndSizeByShopName(shopName);
            } catch (NoResultException e) {
                System.out.println("No result found for the provided shop name.");
            }
        } else {
            System.out.println("Invalid shop name provided.");
        }
        return null;
    }

    @Override
    public MallDto validateUpdateShopNameById(Integer id, String shopName) {
        if (id > 0 && shopName != null && !shopName.isEmpty()) {
            return mallDao.updateShopNameById(id, shopName);
        } else {
            System.out.println("Invalid ID or shop name provided.");
        }
        return null;
    }

    @Override
    public MallDto validateUpdateRevenueById(Integer id, double revenue) {
        if (id > 0 && revenue > 0) {
            return mallDao.updateRevenueById(id, revenue);
        } else {
            System.out.println("Invalid ID or revenue provided.");
        }
        return null;
    }

    @Override
    public boolean validateUpdateSizeByName(String name, double size) {
        if (name != null && !name.isEmpty() && size > 0) {
            return mallDao.updateSizeByName(name, size);
        } else {
            System.out.println("Invalid shop name or size provided.");
        }
        return false;
    }

    @Override
    public boolean validateRemoveShopByName(String name) {
        if (name != null && !name.isEmpty()) {
            return mallDao.removeShopByName(name);
        } else {
            System.out.println("Invalid shop name provided.");
        }
        return false;
    }

    @Override
    public List<MallDto> validateGetShop() {
        return mallDao.getShops();
    }

    @Override
    public boolean updateShop(MallDto dto) {
        return mallDao.updateShop(dto);
    }
}
