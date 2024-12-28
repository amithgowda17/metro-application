package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginDto {

    private Integer LoginId;
    private String firstName;
    private String lastName;
    private String email;
    private String mobileNumber;
    private String loginStart;
    private String loginEnd;

}
