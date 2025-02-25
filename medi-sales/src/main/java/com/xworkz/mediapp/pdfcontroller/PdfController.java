package com.xworkz.mediapp.pdfcontroller;


import com.xworkz.mediapp.dto.MediDto;
import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.service.MediService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/")
@Slf4j
public class PdfController {

    @Autowired
    private MediService mediService;

    @GetMapping("generatePdf")
    public  String getPdf( HttpServletRequest servletRequest)
    {
        List<MediProductDto> sessionProductDto = (List<MediProductDto>) servletRequest.getSession().getAttribute("sessionProductDto");
        Object finalAmount =  servletRequest.getSession().getAttribute("finalAmt");
        MediDto sessionUserDto = (MediDto) servletRequest.getSession().getAttribute("sessionDto");
        log.info("session dto in controller is : {}",sessionProductDto);
        log.info("session user dto in controller is : {}",sessionUserDto);
        mediService.pdfGenerate(sessionProductDto,sessionUserDto,finalAmount);
        return "Pdf generated";
    }
}
