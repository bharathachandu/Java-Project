package com.xworkz.mediapp.ajax;

import com.xworkz.mediapp.dto.MediDto;
import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.service.MediService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("api/")
@Slf4j
public class AjaxController {
    @Autowired
    private MediService mediService;
    @GetMapping("checkEmail/{email}")
    public String emailExists(@PathVariable String email) {
        log.info("email:{}", email);
        return mediService.checkEmail(email);
    }
    @GetMapping("checkPhone/{number}")
    public String phoneExists(@PathVariable Long number) {
        log.info("phone:{}", number);
        return mediService.checkPhone(number);
    }
    @GetMapping("sendOtp/{email}")
    public String sendOtp(@PathVariable String email, Model model) {
        return mediService.sendOtp(email);
    }

    @GetMapping("getProducts")
    public List<String> getProducts(Model model){
        List<MediProductDto> distributors = mediService.getAllProductsStocks();

        return distributors.stream().map(MediProductDto::getProduct_name).collect(Collectors.toList());
    }


    @GetMapping("getCustomer")
    public List<String> getCustomerName(HttpServletRequest servletRequest,Model model) {
        MediDto sessionDto = (MediDto) servletRequest.getSession().getAttribute("sessionDto");
        System.out.println("The session dto is "+sessionDto);

        List<MediDto> userDtos = new ArrayList<>();
        String businessType = sessionDto.getBussiness_type();
        System.out.println("The Bussiness type is "+businessType);
        if(businessType.equalsIgnoreCase("Manufacturer"))
        {
            System.out.println("1st if execution starter");
            String bn = "Wholesale";
            userDtos =mediService.getPersonsByBn(bn);
            model.addAttribute("bn",bn);
            System.out.println("1st if execution ended");
        }
        if(businessType.equalsIgnoreCase("Wholesale"))
        {
            System.out.println("2nd if execution starter");
            String bn = "Retail";
            userDtos =mediService.getPersonsByBn(bn);
            model.addAttribute("bn",bn);
            System.out.println("2nd if execution ended");

        }
        if(businessType.equalsIgnoreCase("Retail"))
        {
            System.out.println("3rd if execution starter");
            String bn = "Patient";
            userDtos =mediService.getPersonsByBn(bn);
            model.addAttribute("bn",bn);
            System.out.println("3rd if execution ended");

        }
        System.out.println("The userDtos are: " + userDtos);

        return userDtos.stream()
                .map(MediDto::getContact_person)
                .collect(Collectors.toList());
    }

    @GetMapping("getStockByProduct")
    public int getStocks(String product_name){

        return mediService.getStockByProduct(product_name);
    }

}
