package com.xworkz.metro.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import java.util.Random;

@Service
public class EmailSent {

    @Autowired
    private  JavaMailSender emailSender;


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

    public String mailSend(String email){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("amith.s.xworkz@gmail.com");
        message.setTo(email);
        message.setSubject("Login Otp");
        String generatedOtp=otpGeneretor();
        message.setText("Your one time password(OTP) is : "+ generatedOtp);
        emailSender.send(message);
        return generatedOtp;
    }

    public String mimeMessage(String email) {

        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,"UTF-8");
            helper.setFrom("amith.s.xworkz@gmail.com");
            helper.addTo(email);
            helper.setSubject("Metro Registration");
            String content = "<html>" +
                    "<body>" +
                    "<p>Your registration was completed successfully!</p>" +
                    "</body>" +
                    "</html>";

            helper.setText(content,true);
        };
        emailSender.send(preparator);

        return "Mail sent successfully";

    }



    public String ticketMessage(String email,String ticketNumber) {

        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,"UTF-8");
            helper.setFrom("amith.s.xworkz@gmail.com");
            helper.addTo(email,ticketNumber);
            helper.setSubject("Metro Ticket");
            String content = ("<html>" +
                    "<body>" +
                    "<h2>Ticket Booked Successfully<h2>" +
                    "<br>" +
                    "Here is your ticket number for your reference :"+ticketNumber+
                    "</body>" +
                    "</html>");
            helper.setText(content,true);
        };
        emailSender.send(preparator);

        return "Mail sent successfully";

    }

}
