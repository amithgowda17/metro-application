package com.xworkz.metro.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class UserLoginEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name="login_Time")
    private String loginTime;

    @Column(name="login_Date")
    private String loginDate;

    @Column(name = "logout_Time")
    private String logoutTime;

}
