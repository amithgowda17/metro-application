package com.xworkz.metro.util;

import com.xworkz.metro.service.MetroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class EmailSent {

    @Autowired
    private  JavaMailSender emailSender;

    @Autowired
    private MetroService metroService;

    @Autowired
    private EncryptionDecryption encryptionDecryption;

    private String otpGeneretor(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public String emailSend(String email){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("amith.s.xworkz@gmail.com");
        message.setTo(email);
        message.setSubject("Password Reset");
        String generatedOtp=otpGeneretor();
        message.setText("Your one time password(OTP) to reset password is : "+ generatedOtp);
        emailSender.send(message);
        return generatedOtp;
    }



}
