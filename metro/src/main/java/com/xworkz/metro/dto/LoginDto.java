package com.xworkz.metro.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDto{

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
