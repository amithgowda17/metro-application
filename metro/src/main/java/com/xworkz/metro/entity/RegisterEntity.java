package com.xworkz.metro.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.lang.Integer;
import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "register_details")

@NamedQuery(name = "findByEmailInRegister", query = "select entity from RegisterEntity entity where entity.email=:value")
@NamedQuery(name = "findByPhNoInRegister", query = "select entity from RegisterEntity entity where entity.phNo=:valu")
@NamedQuery(name = "updateOtp", query = "update RegisterEntity entit set entit.otp = :otp where entit.email = :email")
@NamedQuery(name = "updatePassword", query = "update RegisterEntity entit set entit.password = :password where entit.email = :email")
@NamedQuery(name = "passwordWrongAttempt" , query = "update RegisterEntity reg set reg.noOfAttempts =:noOfAttempts , reg.isAccountLocked =:isAccountLocked where reg.email = :email")


public class RegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "fname")
    private String fname;

    @Column(name = "lname")
    private String lname;

    @Column(name = "email")
    private String email;

    @Column(name = "phNo")
    private String phNo;

    @Column(name = "Date_of_birth")
    private String dob;

    @Column(name = "gender")
    private String gender;

    @Column(name = "city")
    private String city;

    @Column(name = "pincode")
    private Integer pincode;

    @Column(name = "password")
    private String password;

    @Column(name = "otp")
    private String otp;

    @Column(name = "noOfAttempts")
    private int noOfAttempts;

    @Column(name = "isAccountLocked")
    private boolean isAccountLocked;

}
