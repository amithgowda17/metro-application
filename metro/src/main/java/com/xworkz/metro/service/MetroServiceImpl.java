package com.xworkz.metro.service;

import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterDto;
import com.xworkz.metro.entity.LoginEntity;
import com.xworkz.metro.entity.RegisterEntity;
import com.xworkz.metro.repositry.MetroRepo;
import com.xworkz.metro.util.EncryptionDecryption;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.time.LocalDate;

import java.time.LocalTime;

@Slf4j
@Service
public class MetroServiceImpl implements MetroService {

    @Autowired
    EmailSent emailSent;

    @Autowired
    MetroRepo metroRepo;

    @Autowired
    EncryptionDecryption encryptionDecryption;

    @Override
    public String registerInService(RegisterDto registerDto) {
        System.out.println("====dto===" + registerDto);

        RegisterEntity registerEntity1 = metroRepo.findByEmail(registerDto.getEmail());

        RegisterEntity registerEntity2 = metroRepo.findByPhNo(registerDto.getPhNo());

        if (registerEntity1 != null || registerEntity2 != null) {

            return "Email or phone number already exists";

        } else if (registerDto.getPassword().equals(registerDto.getConfirmpassword())) {

            registerDto.setPassword(encryptionDecryption.encrypt(registerDto.getPassword()));

            RegisterEntity registerEntity = new RegisterEntity();

            BeanUtils.copyProperties(registerDto, registerEntity);
            System.out.println("=====" + registerEntity);
            boolean isSaved = metroRepo.register(registerEntity);
            if (isSaved == true) {
                return "Data Saved Successfully";
            }
            return "Data Not Saved";

        } else {
            return "Invalid data";
        }
    }

    @Override
    public boolean findByEmailInService(String email) {
        RegisterEntity registerEntity = metroRepo.findByEmail(email);
        if (registerEntity != null) {
            RegisterDto registerDto = new RegisterDto();
            BeanUtils.copyProperties(registerEntity, registerDto);
            return true;
        }
        return false;
    }

    @Override
    public boolean findByPhInService(String phNo) {
        RegisterEntity registerEntity = metroRepo.findByPhNo(phNo);
        if (registerEntity != null) {
            RegisterDto registerDto = new RegisterDto();
            BeanUtils.copyProperties(registerEntity, registerDto);
            return true;
        }
        return false;
    }


    @Override
    public String loginDetails(LoginDto loginDto) {

        RegisterEntity registerEntity = metroRepo.findByEmail(loginDto.getEmail());


        if (registerEntity != null) {

            System.out.println("==encrypted password from repo==" + registerEntity.getPassword());

            String decrypt = encryptionDecryption.decrypt(registerEntity.getPassword());

            registerEntity.setPassword(decrypt);

           log.info("decrypt in service login======" +decrypt);

            if ((registerEntity.getEmail()).equals(loginDto.getEmail()) && (registerEntity.getPassword()).equals(loginDto.getPassword())) {

                loginDto.setLoginDate(LocalDate.now().toString());
                loginDto.setLoginTime(LocalTime.now().toString());
                loginDto.setLogoutTime(null);

                loginDto.setPassword(encryptionDecryption.encrypt(loginDto.getPassword()));

                LoginEntity loginEntity = new LoginEntity();

                BeanUtils.copyProperties(loginDto, loginEntity);
                metroRepo.login(loginEntity);
                return "login successfull";

            } else {
                return "invalid username or password";
            }
        } else {
            return "user doesn't exists";
        }
    }

    @Override
    public boolean generateOtpInService(String email) {
        RegisterEntity registerEntity=metroRepo.findByEmail(email);
        if(registerEntity!=null){
            emailSent.emailSend(email);
            return true;
        }
        return false;
    }


}
