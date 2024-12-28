package com.xworkz.metro.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "userRegister")
@NamedQuery(name = "emailFindByMe",
        query = "SELECT entity FROM UserRegisterEntity entity WHERE entity.email=:email")
@NamedQuery(name = "oneTimeOtp", query = "UPDATE UserRegisterEntity l SET l.otp = :otp WHERE l.email = :email")
@NamedQuery(name = "findUserByMobileNumber",
        query = "SELECT e FROM UserRegisterEntity e WHERE e.mobileNumber=:mobileNumber")
public class UserRegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String email;
    private String mobileNumber;
    private String password;
    private String gender;
    private String otp;
    private String imageName;
    private String imageType;


}
