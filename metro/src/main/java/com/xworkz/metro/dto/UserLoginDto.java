package com.xworkz.metro.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class UserLoginDto {

    @NotEmpty
    @NotBlank
    @NotNull
    private String email;

    @NotBlank
    @NotNull
    @NotEmpty
    private String password;

    private String loginDate;

    private String loginTime;

    private String logoutTime;

}
