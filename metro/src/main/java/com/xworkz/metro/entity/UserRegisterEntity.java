package com.xworkz.metro.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class UserRegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "f_Name")
    private String fname;

    @Column(name = "l_Name")
    private String lname;

    @Column(name = "email")
    private String email;

    @Column(name = "ph_No")
    private String phNo;

    @Column(name = "Date_of_birth")
    private String dob;

    @Column(name = "gender")
    private String gender;

    @Column(name = "city")
    private String city;

    @Column(name = "pinCode")
    private Integer pinCode;

    @Column(name = "password")
    private String password;

    @Column(name = "otp")
    private String otp;

    @Column(name = "no_Of_Attempts")
    private Integer noOfAttempts;

    @Column(name = "is_Account_Locked")
    private boolean isAccountLocked;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_Content_Type")
    private String fileContentType;


}
