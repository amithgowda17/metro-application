package com.xworkz.metro.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.validation.constraints.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDto {


    @NotEmpty
    @NotEmpty
    @NotBlank
    private String fname;

    @NotEmpty
    @NotEmpty
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
    private Integer pincode;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String password;

    @NotEmpty
    @NotEmpty
    @NotBlank
    private String confirmpassword;

    private String otp;
}
