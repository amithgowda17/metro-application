package com.xworkz.metro.service;


import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterDto;

import javax.validation.Valid;

public interface MetroService {

    String registerInService(RegisterDto registerDto);

    boolean findByEmailInService(String email);

    boolean findByPhInService(String phNo);

    String loginDetails(LoginDto loginDto);

}
