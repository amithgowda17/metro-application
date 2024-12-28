package com.xworkz.metro.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "userLogin")
public class UserLoginEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer LoginId;
    private String firstName;
    private String lastName;
    private String email;
    private String mobileNumber;
    private String loginStart;
    private String loginEnd;

}
