package com.xworkz.mediapp.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
@Entity //-is an object which has to be mapped with db table
@Table(name="medi_details")
@NamedQuery(name = "getAllCustomers",query = "SELECT s FROM MediEntity s")
@NamedQuery(name = "getPersonsByBn",query = "SELECT s FROM MediEntity s where s.bussiness_type=:bn")
@NamedQuery(name = "getEntityByEmail",query = "SELECT s FROM MediEntity s where s.email=:email")
@NamedQuery(name = "getEntityByPhone",query = "SELECT s FROM MediEntity s where s.number=:no")
@NamedQuery(name = "updatePasswordByEmail",query = "update MediEntity u set u.password = :pass, u.c_password = :c_pass where u.email = :email")
@ToString
@Getter
@Setter
public class MediEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String company_name;
    private String contact_person;
    private String bussiness_type;
    private String email;
    private String address;
    private Long number;
    private String password;
    private String c_password;
    private String photo;
    private String photoType;
    private Integer loginAlert;
    private String otp;
}
