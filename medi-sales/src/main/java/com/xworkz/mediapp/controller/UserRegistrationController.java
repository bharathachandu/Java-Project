package com.xworkz.mediapp.controller;
import com.xworkz.mediapp.dto.MediDto;
import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.entity.MediEntity;
import com.xworkz.mediapp.entity.MediProductEntity;
import com.xworkz.mediapp.service.MediService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class UserRegistrationController {
    @Autowired
    private MediService mediService;
    private static List<MediProductDto> attributesList = new ArrayList<>();

    @GetMapping("index")
    public String index()
    {
        return "index";
    }
    @GetMapping("signup")
    public String signup()
    {
        return "signup";
    }
    @GetMapping("response")
    public String response()
    {
        return "response";
    }
    @GetMapping("signIn")
    public String signIn()
    {
        return "signIn";
    }
    @GetMapping("updatePass")
    public String updatePass()
    {
        return "updatePassword";
    }
    @GetMapping("sendOtp")
    public String sendOtp()
    {
        return "sendOtp";
    }
    @PostMapping("user")
    public String onSave(@Valid MediDto dto, BindingResult bindingResult, Model model) {
        boolean hasErrors = bindingResult.hasErrors();
        System.out.println(hasErrors);
        if (hasErrors) {
            log.info("dto has errors");
            model.addAttribute("dto", dto);
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            allErrors.forEach(error -> {
                FieldError fieldError = (FieldError) error;
                System.out.println(fieldError.getField() + " Error Message: " + fieldError.getDefaultMessage());

                // Add field-specific error messages
                switch (fieldError.getField()) {
                    case "id":
                        model.addAttribute("idError", fieldError.getDefaultMessage());
                        break;
                    case "company_name":
                        model.addAttribute("companyNameError", fieldError.getDefaultMessage());
                        break;
                    case "contact_person":
                        model.addAttribute("contactPersonError", fieldError.getDefaultMessage());
                        break;
                    case "bussiness_type":
                        model.addAttribute("bussinessTypeError", fieldError.getDefaultMessage());
                        break;
                    case "email":
                        model.addAttribute("emailError", fieldError.getDefaultMessage());
                        break;
                    case "address":
                        model.addAttribute("addressError", fieldError.getDefaultMessage());
                        break;
                    case "number":
                        model.addAttribute("phoneError", fieldError.getDefaultMessage());
                        break;
                    case "password":
                        model.addAttribute("passwordError", fieldError.getDefaultMessage());
                         break;
                    case "c_password":
                        model.addAttribute("cPasswordError", fieldError.getDefaultMessage());
                        break;
                    default:
                        log.info("Unhandled field error: " + fieldError.getField());
                }
            });
            return "signup";
        }
        if (mediService.addUser(dto)) {
            log.info("onSave() is executed");
            mediService.sendRegistration("Registration","your registration is successFull", dto.getEmail());
            model.addAttribute("dto", dto);
            return "response";
        } else
        {
            log.info("onSave() is not executed");
            model.addAttribute("info", "E-Mail Id Already Registered");
            return "signup";
        }
    }
    @GetMapping("sign")
    public String loginByEmail(String email, String password, Model model, HttpSession session) {
        log.info("Email is {}", email);
        log.info("Password is {}", password);
        MediDto mediDto = mediService.validateLogin(email, password);
        System.out.println(mediDto);
        session.setAttribute("sessionDto",mediDto);
        if (mediDto.getId() != null) {
            log.info("loginByEmail() is executed");
            model.addAttribute("entity", mediDto);
            return "loginResponse";
        } else if (mediDto.getLoginAlert() > 3) {
            log.info("loginByEmail() is not executed");
            model.addAttribute("info", "Account is Blocked, please reset password and login");
            model.addAttribute("email", email);
            model.addAttribute("isLocked", true); // Add this flag
            return "signIn";
        }
        else
            log.info("loginByEmail() is not executed");
        model.addAttribute("info", "Invalid Details, please provide valid details");
        model.addAttribute("email", email);
        model.addAttribute("isLocked", false); // Ensure the flag is present
        return "signIn";
    }
    @GetMapping("validateOtp")
    public String validateOtp(@RequestParam String otp, @RequestParam String email, Model model) {
        mediService.validateOtp(otp,email);
        model.addAttribute("email", email);
        return "updatePassword";
    }
    @PostMapping("updatePass")
    public String updatePasswordByEmail(String email,String password,String c_Password, Model model)
    {
        if(password.equals(c_Password))
        {
            log.info("updatePasswordByEmail() is executed" );

            mediService.updatePasswordByEmail(email,password,c_Password);
            return "updatedResponse";
        }
        else
            log.info("updatePasswordByEmail() is not executed" );
        return null;
    }
    @PostMapping("stock")
    public String onProductSave(@Valid MediProductDto dto, BindingResult bindingResult, Model model, HttpServletRequest servletRequest) {
        /*boolean hasErrors = bindingResult.hasErrors();
        System.out.println(hasErrors);
        if (hasErrors) {
            log.info("dto has errors");
            model.addAttribute("dto", dto);
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            allErrors.forEach(error -> {
                FieldError fieldError = (FieldError) error;
                System.out.println(fieldError.getField() + " Error Message: " + fieldError.getDefaultMessage());

                // Add field-specific error messages
                switch (fieldError.getField()) {
                    case "id":
                        model.addAttribute("idError", fieldError.getDefaultMessage());
                        break;
                    case "company_name":
                        model.addAttribute("companyNameError", fieldError.getDefaultMessage());
                        break;
                    case "contact_person":
                        model.addAttribute("contactPersonError", fieldError.getDefaultMessage());
                        break;
                    case "bussiness_type":
                        model.addAttribute("bussinessTypeError", fieldError.getDefaultMessage());
                        break;
                    case "email":
                        model.addAttribute("emailError", fieldError.getDefaultMessage());
                        break;
                    case "address":
                        model.addAttribute("addressError", fieldError.getDefaultMessage());
                        break;
                    case "number":
                        model.addAttribute("phoneError", fieldError.getDefaultMessage());
                        break;
                    case "password":
                        model.addAttribute("passwordError", fieldError.getDefaultMessage());
                        break;
                    case "c_password":
                        model.addAttribute("cPasswordError", fieldError.getDefaultMessage());
                        break;
                    default:
                        log.info("Unhandled field error: " + fieldError.getField());
                }
            });
            return "signup";
        }*/
        MediDto sessionDto = (MediDto) servletRequest.getSession().getAttribute("sessionDto");
        log.info("dto is {}",dto);
        log.info("sessionDto is {}",sessionDto);
        mediService.addProduct(dto,sessionDto);
        log.info("onSave() is executed");
            model.addAttribute("dto", dto);
            return "createStockResponse";
    }
    @GetMapping("viewStocks")
    public String getAllStocks(Model model) {
        List<MediProductDto> entity = mediService.getAllProductsStocks();
        log.info("entity is {}",entity);
        model.addAttribute("entity",entity);
        return "viewStock";
    }
    @GetMapping("generate/{id}")
    public String getBill(Model model,@PathVariable Integer id) {
        log.info("id is {}",id);
        MediProductEntity entity = mediService.getProductById(id);
        log.info("Medi Product entity for bill entity is {}",entity);
        model.addAttribute("entity",entity);
        return "viewBill";
    }
    @GetMapping("generatebill")
    public String getGenerateBillPage(Model model){
        return "generatebill";
    }
    @PostMapping("getBill")
    public String generateBill(@RequestParam("product_name") String product_name,
                               @RequestParam("contact_person") String contact_person,
                               @RequestParam("quantity") int quantity,
                               @RequestParam("gst") double gst,
                               @RequestParam("discount") double discount,
                               Model model, HttpSession session) {

        DecimalFormat df = new DecimalFormat("#.##");  // To format to two decimal places
        double finalTotal = 0.0;

        MediDto userDto = mediService.getUserByCustomerName(contact_person);
        model.addAttribute("contact_person", userDto.getContact_person());
        model.addAttribute("address", userDto.getAddress());

        for (MediProductDto existingProduct : attributesList) {
            if (existingProduct.getProduct_name().equals(product_name)) {
                double discountedPrice = (existingProduct.getRate() * quantity * discount) / 100;
                double gstAmount = (discountedPrice * gst) / 100;
                double totalAmount = existingProduct.getRate() * quantity - discountedPrice + gstAmount;

                existingProduct.setGst(existingProduct.getGst() + gst);
                existingProduct.setDiscount(existingProduct.getDiscount() + discount);
                existingProduct.setQuantity(existingProduct.getQuantity() + quantity);
                existingProduct.setTotalAmount(Double.parseDouble(df.format(totalAmount + existingProduct.getTotalAmount())));

                model.addAttribute("dtoList", attributesList);

                for (MediProductDto distributorDto : attributesList) {
                    finalTotal += distributorDto.getTotalAmount();
                }

                model.addAttribute("total", df.format(finalTotal));
                return "generatebill";
            }
        }

        MediProductDto product = mediService.getDistributorDtoByProductName(product_name);
        double discountedPrice = (product.getRate() * quantity * discount) / 100;
        double gstAmount = (discountedPrice * gst) / 100;
        double totalAmount = product.getRate() * quantity - discountedPrice + gstAmount;

        product.setTotalAmount(Double.parseDouble(df.format(totalAmount)));

        MediProductDto dto = new MediProductDto();
        BeanUtils.copyProperties(product, dto);
        dto.setGst(gst);
        dto.setDiscount(discount);
        dto.setQuantity(quantity);
        attributesList.add(dto);
        model.addAttribute("dtoList", attributesList);
        session.setAttribute("sessionProductDto", attributesList);

        for (MediProductDto distributorDto : attributesList) {
            finalTotal += distributorDto.getTotalAmount();
        }

        model.addAttribute("total", df.format(finalTotal));
        session.setAttribute("finalAmt", df.format(finalTotal));

        return "generatebill";
    }
}


