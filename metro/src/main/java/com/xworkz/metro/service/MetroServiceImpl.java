package com.xworkz.metro.service;

import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.entity.LoginEntity;
import com.xworkz.metro.entity.RegisterEntity;
import com.xworkz.metro.repositry.MetroRepo;
import com.xworkz.metro.util.EmailSent;
import com.xworkz.metro.util.EncryptionDecryption;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

import java.time.LocalTime;


@Slf4j
@Service
public class MetroServiceImpl implements MetroService {


    private static String UPLOADED_FOLDER = "D://Project//file_upload//";

    @Autowired
    EmailSent emailSent;

    @Autowired
    MetroRepo metroRepo;

    @Autowired
    EncryptionDecryption encryptionDecryption;

    @Override
    public String registerInService(RegisterationDto registerationDto) {

        RegisterEntity registerEntity1 = metroRepo.findByEmail(registerationDto.getEmail());

        RegisterEntity registerEntity2 = metroRepo.findByPhNo(registerationDto.getPhNo());

        if (registerEntity1 != null || registerEntity2 != null) {

            return null;

        } else if (registerationDto.getPassword().equals(registerationDto.getConfirmPassword())) {

            registerationDto.setPassword(encryptionDecryption.encrypt(registerationDto.getPassword()));
            registerationDto.setFileName("dummy.png");
            registerationDto.setFileContentType("image/png");
            RegisterEntity registerEntity = new RegisterEntity();
            BeanUtils.copyProperties(registerationDto, registerEntity);

            boolean isSaved = metroRepo.register(registerEntity);
            if (isSaved == true) {
                return "Registration Successfull";
            }
            return null;

        } else {
            return null;
        }
    }

    @Override
    public RegisterationDto findByEmailInService(String email) {
        RegisterEntity registerEntity = metroRepo.findByEmail(email);

        if (registerEntity != null) {
            RegisterationDto registerationDto = new RegisterationDto();
            BeanUtils.copyProperties(registerEntity, registerationDto);
            return registerationDto;
        }
        return null;
    }

    @Override
    public boolean findByPhInService(String phNo) {
        RegisterEntity registerEntity = metroRepo.findByPhNo(phNo);
        if (registerEntity != null) {
            RegisterationDto registerationDto = new RegisterationDto();
            BeanUtils.copyProperties(registerEntity, registerationDto);
            return true;
        }
        return false;
    }

    @Override
    public String loginDetails(LoginDto loginDto) {

        RegisterationDto registerationDto = findByEmailInService(loginDto.getEmail());

        RegisterEntity registerEntity = new RegisterEntity();

        if (registerationDto.getEmail() != null) {

            log.info("ecrypt password in service login======" + registerationDto.getPassword());

            registerationDto.setPassword(encryptionDecryption.decrypt(registerationDto.getPassword()));

            log.info("decrypt password in service login======" + registerationDto.getPassword());

            if (!(registerationDto.getPassword().equals(loginDto.getPassword()))) {

                registerationDto.setPassword(encryptionDecryption.encrypt(registerationDto.getPassword()));

                if (registerationDto.getNoOfAttempts() == null) {
                    registerationDto.setNoOfAttempts(0);
                }

                registerationDto.setNoOfAttempts(registerationDto.getNoOfAttempts() + 1);

                BeanUtils.copyProperties(registerationDto, registerEntity);

                metroRepo.updateProfile(registerEntity);

                if (registerationDto.getNoOfAttempts() >= 3) {

                    registerationDto.setAccountLocked(true);

                    BeanUtils.copyProperties(registerationDto, registerEntity);

                    metroRepo.updateProfile(registerEntity);
                }
                return "invalid password";
            } else {
                log.info("decrypt password in service login======" + registerationDto.getPassword());
                log.info("logging in===========");

                loginDto.setLoginDate(LocalDate.now().toString());
                loginDto.setLoginTime(LocalTime.now().toString());
                loginDto.setLogoutTime(null);

                loginDto.setPassword(encryptionDecryption.encrypt(loginDto.getPassword()));

                LoginEntity loginEntity = new LoginEntity();

                BeanUtils.copyProperties(loginDto, loginEntity);

                metroRepo.login(loginEntity);

                registerationDto.setNoOfAttempts(0);
                registerationDto.setAccountLocked(false);


                registerationDto.setPassword(encryptionDecryption.encrypt(registerationDto.getPassword()));
                BeanUtils.copyProperties(registerationDto, registerEntity);

                metroRepo.updateProfile(registerEntity);

                return "login successfull";

            }
        } else {
            return null;
        }
    }


    @Override
    public boolean generateOtpInService(String email, String otp) {
        RegisterationDto registerationDto = findByEmailInService(email);
        if (registerationDto != null) {
            String otpSave = emailSent.emailSend(email);
            String encryptOtp = encryptionDecryption.encrypt(otpSave);

            registerationDto.setOtp(encryptOtp);
            log.info("===registerationDto.getOtp()====" + registerationDto.getOtp());
            log.info("encrypted otp============" + encryptOtp);

            RegisterEntity registerEntity = new RegisterEntity();
            BeanUtils.copyProperties(registerationDto, registerEntity);
            metroRepo.updateProfile(registerEntity);
            return true;
        }
        return false;
    }

    @Override
    public boolean verifyOtp(String email, String otpEntered) {
        RegisterationDto registerationDto = findByEmailInService(email);
        if (registerationDto != null) {
            String decryptOtp = encryptionDecryption.decrypt(registerationDto.getOtp());
            registerationDto.setOtp(decryptOtp);
            if (otpEntered.equals(registerationDto.getOtp())) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Override
    public boolean updatePasswordInService(String email, String password, String confirmPassword) {
        RegisterationDto registerationDto = findByEmailInService(email);
        if (registerationDto != null) {
            if (password.equals(confirmPassword)) {

                registerationDto.setNoOfAttempts(0);
                registerationDto.setAccountLocked(false);
                String encryptPassword = encryptionDecryption.encrypt(password);
                registerationDto.setPassword(encryptPassword);

                RegisterEntity registerEntity = new RegisterEntity();

                BeanUtils.copyProperties(registerationDto, registerEntity);

                metroRepo.updateProfile(registerEntity);
                return true;
            }
            return false;
        }
        return false;
    }


    @Override
    public boolean saveEditedProfile(RegisterationDto registerationDto, MultipartFile file) {
        RegisterationDto existingDto = findByEmailInService(registerationDto.getEmail());
        RegisterEntity registerEntity = new RegisterEntity();

        if (file != null && !file.isEmpty() ) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);

                registerationDto.setFileName(file.getOriginalFilename());
                registerationDto.setFileContentType(file.getContentType());
            } catch (IOException ignored) {

            }
        } else {

            registerationDto.setFileName(existingDto.getFileName());
            registerationDto.setFileContentType(existingDto.getFileContentType());

        }
        if(registerationDto!=null) {
            BeanUtils.copyProperties(registerationDto, registerEntity);
            return metroRepo.updateProfile(registerEntity);
        }
        return false;
    }


}