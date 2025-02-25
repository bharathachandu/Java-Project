package com.xworkz.mallapp.controller;

import com.xworkz.mallapp.dto.MallDto;
import com.xworkz.mallapp.service.MallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Component
@RequestMapping("/")
public class UserRegistrationController {
    @Autowired
    private MallService mallService;

    @PostMapping("shop")
    public String onSave(MallDto dto, Model model)
    {
        model.addAttribute("name",dto.getOwnerName());
        mallService.addShop(dto);
        return "response.jsp";
    }

    @GetMapping("allShop")
    public String getAllShop(Model model)
    {
        List<MallDto> shops = mallService.validateGetShop();
        model.addAttribute("allShops",shops);
        return "getAllDetails.jsp";
    }

    @GetMapping("fetchApp")
    public String getUserById(Integer id,Model model)
    {
        MallDto dto = mallService.validateGetShopById(id);
        model.addAttribute("shop",dto);
        return "updateDetails.jsp";
    }

    @PostMapping("updateShop")
    public String updateUser( MallDto dto, Model model)
    {
        model.addAttribute("name",dto.getOwnerName());
        mallService.updateShop(dto);
        return "updateResponse.jsp";
    }

    @GetMapping("delete/{id}")
    public RedirectView deleteUser(@PathVariable("id") String id, Model model, HttpServletRequest request)
    {
        mallService.validateRemoveShop(Integer.parseInt(id));
        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(request.getContextPath()+"/allShop");
        return redirectView;
    }
}
