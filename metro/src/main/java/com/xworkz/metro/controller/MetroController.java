package com.xworkz.metro.controller;

import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterDto;
import com.xworkz.metro.service.MetroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

import java.util.List;


@Controller
@RequestMapping("/")
public class MetroController {



    public MetroController() {
        System.out.println("MetroController object created");
    }

    @Autowired
    MetroService metroService;


    @GetMapping("indexPage")
    public String homePage() {
        return "index";
    }


    @GetMapping("registerPage")
    public String registerPage() {
        return "register";
    }

    @GetMapping("loginPage")
    public String loginPage() {
        return "login";
    }



    @PostMapping("register")
    public String register(@Valid RegisterDto registerDto, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {

            List<ObjectError> bindingResults = bindingResult.getAllErrors();
            return "register";
        }
        String successMsg = metroService.registerInService(registerDto);
        model.addAttribute("msg",successMsg);
        return "register";


    }

    @GetMapping("isEmailExists")
    public ResponseEntity<String> emailExists(@RequestParam String email) {

        if (email != null) {
            RegisterDto registerDto= metroService.findByEmailInService(email);

            if (registerDto!=null) {
                return ResponseEntity.ok("email already exists");
            }
        }

        return ResponseEntity.ok("email_accepted");
    }

    @GetMapping("isPhnoExists")
    public ResponseEntity<String> phoneExists(@RequestParam String phNo) {

        if (phNo != null) {
            boolean byPhInService = metroService.findByPhInService(phNo);
            if (byPhInService) {
                return ResponseEntity.ok("phone number already exists");
            }
        }
        return ResponseEntity.ok("phone number not exists");
    }


    @PostMapping("login")
    public String login(@Valid LoginDto loginDto, BindingResult bindingResult, Model model) {

        RegisterDto registerDto=metroService.findByEmailInService(loginDto.getEmail());

        if (bindingResult.hasErrors()) {
            model.addAttribute("loginerrmsg", "Please enter valid data");
            return "login";
        }else if (registerDto.isAccountLocked()) {
            model.addAttribute("blockedmessage", "Account blocked can't login reset your password");
            return "emailotp";
        }else{
            String message = metroService.loginDetails(loginDto);
            if (message.equals("invalid password")) {
                model.addAttribute("loginerrmsg", message);
                return "login";
            }else{
                model.addAttribute("successmsg",message);
                model.addAttribute("details",registerDto);
                return "userpage";
            }
        }
    }


    @GetMapping("forgotPassword")

    public String forgotPassword(){

        return "emailotp";
    }


    @GetMapping("otp")
    public String generateOtp(@RequestParam String email,String otp, Model model) {
        if (email != null) {
            RegisterDto registerDto=metroService.findByEmailInService(email);
            boolean isSaved=metroService.generateOtpInService(email,otp);
            if(isSaved==true){
                System.out.println("otp saved");
                model.addAttribute("emaildto",registerDto);
            }
            return "emailotp";
        }


        return "emailotp";

    }

    @PostMapping("verifyOtp")
    public String verifyOtp(@RequestParam String email, @RequestParam String optEntered, Model model){
        if (email !=null || optEntered!=null){
            RegisterDto registerDto=metroService.findByEmailInService(email);
            if (registerDto!=null){
                boolean isOtpVerified= metroService.verifyOtp(email,optEntered);
                if(isOtpVerified) {
                    model.addAttribute("dto", registerDto);
                    return "updatePassword";
                }return "emailotp";
            }

        }
        return "emailotp";
    }

    @PostMapping("updatePassword")
    public String updatePassed(@RequestParam String email,String password,String confirmpassword){
        if(email!=null && password!=null && confirmpassword!=null) {
            metroService.updatePasswordInService(email, password, confirmpassword);
            return "login";
        }
        return "login";
    }

    @GetMapping("profileUpdate")
    public String getProfileUpdatePage(@RequestParam String email,Model model){
        RegisterDto registerDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registerDto);
        return "profileupdate";
    }

    @PostMapping("updateDetails")
    public String editRegisterDetails(RegisterDto registerDto,Model model){
        RegisterDto registerDto1=metroService.findByEmailInService(registerDto.getEmail());
        model.addAttribute("details",registerDto1);
        boolean updateMessage = metroService.saveEditedProfile(registerDto);
        if (updateMessage) {
            model.addAttribute("msg", "data updated successfully");
            return "userpage";
        }else{
            model.addAttribute("errmsg","data not updated");
            return "userpage";
        }
    }


}