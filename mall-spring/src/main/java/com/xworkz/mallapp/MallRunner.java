package com.xworkz.mallapp;

import com.xworkz.mallapp.config.SpringConfiguration;
import com.xworkz.mallapp.dto.MallDto;
import com.xworkz.mallapp.service.MallService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Arrays;

public class MallRunner {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(SpringConfiguration.class);

        MallService mallService = applicationContext.getBean(MallService.class);

        // Add Shop Example
        MallDto mallDto = new MallDto();
        mallDto.setShopName("New World");
        mallDto.setOwnerName("raju");
        mallDto.setLocation("kalsipalya");
        mallDto.setRevenue(1_000_000.50);
        mallDto.setSize(1500.75);


        boolean isAdded = mallService.addShop(mallDto);
        System.out.println("Shop added: " + isAdded);

        /*MallDto fetchedShop = mallService.validateGetShopById(1);
        if (fetchedShop != null) {
            System.out.println("Fetched Shop: " + fetchedShop);
        } else {
            System.out.println("Shop not found with ID 1");
        }

        boolean isUpdated = mallService.validateUpdateShopNameById("Tech Zone", 1);
        System.out.println("Shop name updated: " + isUpdated);

        mallService.validateRemoveShop(2);
        System.out.println("Shop with ID 2 removed");

        String ownerName = mallService.validateGetOwnerNameById(1);
        System.out.println("Owner Name: " + ownerName);

        Object[] shopNameAndLocation = mallService.validateGetShopNameAndLocationById(1);
        System.out.println("Shop Name and Location: " + Arrays.toString(shopNameAndLocation));

        Object[] revenueAndSize = mallService.validateGetRevenueAndSizeByShopName("Electro World");
        System.out.println("Revenue and Size: " + Arrays.toString(revenueAndSize));

        MallDto updatedShop = mallService.validateUpdateRevenueById(1, 1_200_000.75);
        System.out.println("Updated Shop: " + updatedShop);

        boolean isSizeUpdated = mallService.validateUpdateSizeByName("Electro World", 1800.00);
        System.out.println("Shop size updated: " + isSizeUpdated);

        boolean isRemoved = mallService.validateRemoveShopByName("Tech Zone");
        System.out.println("Shop removed by name: " + isRemoved);*/
    }
}
