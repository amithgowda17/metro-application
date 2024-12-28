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
public class UserRegisterDto {

        private Integer id;
        @NotNull(message = "firstName should not be Null")
        @NotBlank(message = "firstName should not be blank")
        @NotEmpty(message = "firstName should not be empty")
        private String firstName;
        @NotNull(message = "lastName should not be Null")
        @NotBlank(message = "lastName should not be blank")
        @NotEmpty(message = "lastName should not be empty")
        private String lastName;
        @NotBlank(message = "dateOfBirth should not be null")
        private String dateOfBirth;
        @NotNull(message = "email should not be Null")
        @NotBlank(message = "email should not be blank")
        @NotEmpty(message = "email should not be empty")
        private String email;
        @NotNull(message = "mobileNumber should not be Null")
        @NotBlank(message = "mobileNumber should not be blank")
        @NotEmpty(message = "mobileNumber should not be empty")
        private String mobileNumber;
        @NotNull(message = "password should not be Null")
        @NotBlank(message = "password should not be blank")
        @NotEmpty(message = "password should not be empty")
        private String password;
        @NotNull(message = "confirm should not be Null")
        @NotBlank(message = "confirm should not be blank")
        @NotEmpty(message = "confirm should not be empty")
        private String confirmPassword;
        private String gender;
        private String otp;
        private String imageName;
        private String imageType;

}


