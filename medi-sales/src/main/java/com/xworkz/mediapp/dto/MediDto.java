package com.xworkz.mediapp.dto;
import lombok.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class MediDto {
    private Integer id;

    @NotNull(message = "Company name shouldn't be null")
    @Size(min = 2, max = 50, message = "Should be min 2 char and max 10")
    private String company_name;

    @NotNull(message = "Contact Person shouldn't be null")
    @Size(min = 2, max = 25, message = "Should be min 2 char and max 25")
    private String contact_person;

    @NotNull(message = "Business type shouldn't be null")
    @Size(min = 2, max = 100, message = "Business type should be between 5 and 50 characters")
    private String bussiness_type;

    @NotNull(message = "Email shouldn't be null")
    @Size(max = 450, message = "email should be between 5 and 50 characters")
    private String email;

    @NotNull(message = "Address shouldn't be null")
    @Size(min = 2, max = 50, message = "Place should be between 2 and 50 characters")
    private String address;


    @NotNull(message = "Phone number shouldn't be null")
    private Long number;

    @NotNull(message = "Password shouldn't be null")
    @Size(min = 8, max = 20, message = "Password should be between 8 and 20 characters")
    private String password;

    @NotNull(message = "Confirm password shouldn't be null")
    @Size(min = 8, max = 20, message = "Confirm password should be between 8 and 20 characters")
    private String c_password;

    private String photo;
    private String photoType;
    private Integer loginAlert=0;
    private String otp;
}
