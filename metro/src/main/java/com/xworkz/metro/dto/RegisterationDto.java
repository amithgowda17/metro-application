package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterationDto {

    private Integer id;

    @NotEmpty
    @NotNull
    @NotBlank
    private String fname;

    @NotEmpty
    @NotNull
    @NotBlank
    private String lname;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String email;

    @Size(min = 10,max = 10)
    private String phNo;


    @NotEmpty
    @NotEmpty
    @NotBlank
    private String dob;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String gender;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String city;

    @NotNull
    private Integer pinCode;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String password;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String confirmPassword;

    private String otp;

    private Integer noOfAttempts;

    private boolean isAccountLocked;


    private String fileName;

    private String fileContentType;



}
