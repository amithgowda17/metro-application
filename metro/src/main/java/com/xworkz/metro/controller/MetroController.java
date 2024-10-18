package com.xworkz.metro.controller;

import com.xworkz.metro.dto.LoginDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import java.io.*;
import java.nio.file.AccessDeniedException;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class MetroController {

    private static String path = "D://Project//file_upload//";

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

    @GetMapping("getUserPage")
    public String getUserPage(String email, Model model) {
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        model.addAttribute("details", registerationDto);
        return "userPage";
    }

    @PostMapping("register")
    public String register(@Valid RegisterationDto registerationDto, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {

            List<ObjectError> bindingResults = bindingResult.getAllErrors();
            return "register";
        }
        String successMsg = metroService.registerInService(registerationDto);
        model.addAttribute("msg", successMsg);
        return "register";


    }

    @GetMapping("isEmailExists")
    public ResponseEntity<String> emailExists(@RequestParam String email) {

        if (email != null) {
            RegisterationDto registerationDto = metroService.findByEmailInService(email);

            if (registerationDto != null) {
                return ResponseEntity.ok("email already exists");
            }
        }

        return ResponseEntity.ok("email_accepted");
    }

    @GetMapping("isPhNoExists")
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

        RegisterationDto registerationDto = metroService.findByEmailInService(loginDto.getEmail());

        if (bindingResult.hasErrors()) {
            model.addAttribute("loginErrMsg", "Please enter valid data");
            return "login";
        } else if (registerationDto.isAccountLocked()) {
            model.addAttribute("blockedMessage", "Account blocked can't login reset your password");
            return "emailOtp";
        } else {
            String message = metroService.loginDetails(loginDto);
            if (message.equals("invalid password")) {
                model.addAttribute("enteredEmail", loginDto.getEmail());
                model.addAttribute("loginErrMsg", message);
                return "login";
            } else {
                model.addAttribute("details", registerationDto);
                model.addAttribute("successMsg", message);
                log.info("registerDto====" + registerationDto);
                return "userPage";
            }
        }
    }


    @GetMapping("forgotPassword")

    public String forgotPassword() {

        return "emailOtp";
    }


    @GetMapping("otp")
    public String generateOtp(@RequestParam String email, String otp, Model model) {
        if (email != null) {
            RegisterationDto registerationDto = metroService.findByEmailInService(email);
            boolean isSaved = metroService.generateOtpInService(email, otp);
            if (isSaved) {
                model.addAttribute("emailDto", registerationDto);
                model.addAttribute("sentMessage", "opt have been sent");
                return "emailOtp";
            }
            return "emailOtp";
        }


        return "emailOtp";

    }

    @GetMapping("verifyOtp")
    public String verifyOtp(@RequestParam String email, @RequestParam String optEntered, Model model) {
        if (email != null || optEntered != null) {
            RegisterationDto registerationDto = metroService.findByEmailInService(email);
            if (registerationDto != null) {
                boolean isOtpVerified = metroService.verifyOtp(email, optEntered);
                if (isOtpVerified) {
                    model.addAttribute("dto", registerationDto);
                    return "updatePassword";
                }
                model.addAttribute("optVerification", "invalid otp");
                model.addAttribute("emailDto", registerationDto);
                return "emailOtp";
            }
        }
        return "emailOtp";
    }

    @PostMapping("updatePassword")
    public String updatePassed(@RequestParam String email, String password, String confirmPassword) {
        if (email != null && password != null && confirmPassword != null) {
            boolean isPasswordUpdated = metroService.updatePasswordInService(email, password, confirmPassword);
            if (isPasswordUpdated) {
                return "login";
            }
        }
        return "login";
    }

    @GetMapping("profileUpdate")
    public String getProfileUpdatePage(@RequestParam String email, Model model) {
        RegisterationDto registerationDto = metroService.findByEmailInService(email);

        model.addAttribute("dto", registerationDto);
        log.info("password in controller=======" + registerationDto.getPassword());

        return "profileUpdate";
    }

    @PostMapping("updateDetails")
    public String editRegisterDetails(@RequestParam("file") MultipartFile file, RegisterationDto registerationDto1, Model model) {
        boolean updateMessage = metroService.saveEditedProfile(registerationDto1, file);
        RegisterationDto registerationDto = metroService.findByEmailInService(registerationDto1.getEmail());

        if (updateMessage) {
            model.addAttribute("msg", "data updated successfully");
            model.addAttribute("details", registerationDto);
            return "userPage";
        } else {
            model.addAttribute("details", registerationDto);
            model.addAttribute("errMsg", "data not updated");
            return "userPage";
        }
    }

    @GetMapping("getImage/{fileName}")
    public void viewImage(@PathVariable String fileName, Model model, HttpServletResponse httpServletResponse) {

        File file1 = new File(path + fileName);

        try {
            FileInputStream fileInputStream = new FileInputStream(file1);
            InputStream inputStream = new BufferedInputStream(fileInputStream);
            ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
            IOUtils.copy(inputStream, servletOutputStream);
            model.addAttribute("image",servletOutputStream);
            httpServletResponse.flushBuffer();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


}