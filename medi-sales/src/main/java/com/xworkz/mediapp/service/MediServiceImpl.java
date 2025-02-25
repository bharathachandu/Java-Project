package com.xworkz.mediapp.service;
import com.itextpdf.html2pdf.HtmlConverter;
import com.xworkz.mediapp.constant.Constant;
import com.xworkz.mediapp.dto.MediDto;
import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.entity.MediEntity;
import com.xworkz.mediapp.entity.MediProductEntity;
import com.xworkz.mediapp.repository.MediRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

@Slf4j
@Service
public class MediServiceImpl implements MediService{
    @Autowired
    private MediRepo mediRepo;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
    public boolean addUser(MediDto dto) {
        MediEntity mediEntity = new MediEntity();
        dto.setPassword(passwordEncoder.encode(dto.getPassword()));
        BeanUtils.copyProperties(dto,mediEntity);
        log.info("dto details = {}",dto);
        log.info("entity details = {}",mediEntity);
        boolean i = mediRepo.addUser(mediEntity);
        System.out.println(i);
        return i;
    }
    @Override
    public boolean sendRegistration(String subject, String body, String email) {
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true); // Support multipart for attachments
            mimeMessageHelper.setFrom(Constant.FROM_EMAIL.getPath(), Constant.FROM_NAME.getPath());
            mimeMessageHelper.addTo(email);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(body);
        };
        try
        {
            javaMailSender.send(preparator);
            return true;
        } catch (Exception e) {
            e.printStackTrace(); // Log exception for debugging
            return false;
        }
    }

    @Override
    public MediDto validateLogin(String email, String password) {
        MediDto mediDto = new MediDto();
        MediEntity mediEntity = mediRepo.getEntityByEmail(email);
        if(email!=null&&passwordEncoder.matches(password,mediEntity.getPassword())) {
            BeanUtils.copyProperties(mediEntity, mediDto);
            mediEntity.setLoginAlert(0);
            mediRepo.updateUserEntity(mediEntity);
            return mediDto;
        }
        else {
            mediEntity = mediRepo.getEntityByEmail(email);
            System.out.println(mediDto);
            mediEntity.setLoginAlert(mediEntity.getLoginAlert()+1);
            mediRepo.updateUserEntity(mediEntity);
            mediDto.setLoginAlert(mediEntity.getLoginAlert()+1);
            System.out.println(mediEntity.getLoginAlert());
            return mediDto;
        }
    }
    @Override
    public String checkEmail(String email) {
        MediEntity entity = mediRepo.getEntityByEmail(email);
        if(entity!=null)
        {
            return "Email Exists";
        }
        return "email doesnt exist";
    }
    @Override
    public String checkPhone(Long no) {
        MediEntity entity = mediRepo.getEntityByPhone(no);
        System.out.println(entity);
        if(entity!=null)
        {
            return "Phone Number Exists";
        }
        return "Phone Number doesnt exist";
    }
    @Override
    public String sendOtp(String email) {
        MediEntity entity = mediRepo.getEntityByEmail(email);
        log.info("Entity details:{}",entity);
        if(entity.getEmail()!=null)
        {
            Random random =new Random();
            Integer otp = random.nextInt(999999);
            log.info("--------------------------------------------------otp:{}",otp);
            sendRegistration("OTP verification","your otp is: "+otp,email);
            entity.setOtp(passwordEncoder.encode(otp.toString()));
            mediRepo.updateUserEntity(entity);
            return otp.toString();
        }
        else
            return "otp not sent";
    }

    @Override
    public String validateOtp(String otp, String email) {
        MediEntity entity = mediRepo.getEntityByEmail(email);
        System.out.println("validate otp method o/p---------------"+entity);
        if(entity.getOtp().equals(otp))
        {
            return "valid otp";
        }
        return "otp not valid";
    }

    @Override
    public boolean updatePasswordByEmail(String email, String password, String c_Password) {
        return mediRepo.updatePasswordByEmail(email,passwordEncoder.encode(password),c_Password);
    }

    @Override
    public boolean addProduct(MediProductDto dto, MediDto sessionDto) {
        MediProductEntity mediEntity = new MediProductEntity();
        Date currentDate = new Date();
        SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
        String day = dayFormat.format(currentDate);
        SimpleDateFormat minuteFormat = new SimpleDateFormat("mm");
        String minute = minuteFormat.format(currentDate);
        SimpleDateFormat secondFormat = new SimpleDateFormat("ss");
        String second = secondFormat.format(currentDate);
        String hsnCode = day + minute + second;

        char productInitial = dto.getProduct_name().charAt(0);
        char companyInitial = dto.getProduct_Company().charAt(0);
        Random random = new Random();
        int randomNum = 100 + random.nextInt(900);
        String batchNo = "" + productInitial + companyInitial + randomNum;

        dto.setHsn(hsnCode);
        dto.setBatch_no(batchNo);
        dto.setCreatedDate(LocalDate.now());
        dto.setDiscountAmt(dto.getRate()*dto.getQuantity()*(dto.getDiscount()/100));
        dto.setGstAmount(dto.getDiscountAmt()*(dto.getGst()/100));
        dto.setTotalAmount(dto.getRate()*dto.getQuantity()- dto.getDiscountAmt()+dto.getGstAmount());
        log.info("session dto email : {}",sessionDto.getEmail());
        dto.setCreatedBy(sessionDto.getEmail());

        BeanUtils.copyProperties(dto,mediEntity);
        log.info("product dto details = {}",dto);
        log.info("product entity details = {}",mediEntity);
        boolean i = mediRepo.addProduct(mediEntity);
        System.out.println(i);
        return i;
    }

    @Override
    public List<MediProductDto> getAllProductsStocks() {
        List<MediProductEntity> entities= mediRepo.getAllProductsStocks();
        List<MediProductDto> dto = new ArrayList<>();

        for (MediProductEntity entity : entities) {
            MediProductDto mediProductDto = new MediProductDto();
            BeanUtils.copyProperties(entity, mediProductDto);
            dto.add(mediProductDto);
        }
        return dto;
    }

    @Override
    public MediProductEntity getProductById(Integer id) {
        MediProductEntity entity =  mediRepo.getProductById(id);
        log.info("bill entity: {}",entity);
        return entity;
    }

    @Override
    public MediProductDto getDistributorDtoByProductName(String product_name) {
        MediProductDto mediProductDto = new MediProductDto();
        MediProductEntity mediProductEntity=  mediRepo.getDistributorDtoByProductName(product_name);
        BeanUtils.copyProperties(mediProductEntity,mediProductDto);
        return mediProductDto;
    }

    @Override
    public List<MediDto> getAllCustomers() {
        List<MediEntity> mediEntities = mediRepo.getAllCustomers();
        List<MediDto> dto = new ArrayList<>();

        for (MediEntity entity : mediEntities) {
            MediDto mediDto = new MediDto();
            BeanUtils.copyProperties(entity, mediDto);
            dto.add(mediDto);
        }
        return dto;
    }

    @Override
    public int getStockByProduct(String product_name) {
        return mediRepo.getStockByProduct(product_name);
    }
    @Override
    public MediDto getUserByCustomerName(String contact_person) {
        MediDto mediDto = new MediDto();
        MediEntity mediEntity = mediRepo.getUserByCustomerName(contact_person);
        BeanUtils.copyProperties(mediEntity,mediDto);
        return mediDto;
    }
    @Autowired
    private TemplateEngine templateEngine;
    @Override
    public void pdfGenerate(List<MediProductDto> dto, MediDto mediDto, Object finalAmount)
    {log.info("session dto in service is : {}",dto);
        Context context = new Context();
        context.setVariable("user",mediDto);
        context.setVariable("invoiceItems",dto);
        context.setVariable("final",finalAmount);
        context.setVariable("bank","Kotak Bank");
        String htmlData = templateEngine.process("SalesBill",context);
        log.info("Html data : {}",htmlData);
        File file = new File("D:\\template\\"+"SalesBill.pdf");
        Path path = Paths.get(file.getPath());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(file.getPath()));
            HtmlConverter.convertToPdf(htmlData,fileOutputStream);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<MediDto> getPersonsByBn(String bn) {
        List<MediEntity> mediEntities = mediRepo.getPersonsByBn(bn);
        System.out.println("Medi entites in Service"+mediEntities);
        List<MediDto> dto = new ArrayList<>();

        for (MediEntity entity : mediEntities) {
            MediDto mediDto = new MediDto();
            BeanUtils.copyProperties(entity, mediDto);
            dto.add(mediDto);
            System.out.println("Medi dto in Service after copying"+mediDto);
        }
        return dto;
    }
}
