package com.xworkz.metro.service;


import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterationDto;

public interface MetroService {

    String registerInService(RegisterationDto registerationDto);

    RegisterationDto findByEmailInService(String email);

    boolean findByPhInService(String phNo);

    String loginDetails(LoginDto loginDto);

    boolean generateOtpInService(String email,String otp);

    boolean verifyOtp(String email,String otpEntered);

    boolean updatePasswordInService(String email,String password,String confirmpassword);

    public boolean saveEditedProfile(RegisterationDto registerationDto);


}
