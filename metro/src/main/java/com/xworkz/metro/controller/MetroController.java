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
    public String homePage(){
        return "index";
    }


    @GetMapping("registerPage")
    public String registerPage(){
        return "register";
    }

    @GetMapping("loginPage")
    public String loginPage(){
        return "login";
    }

    @PostMapping("register")
    public String register(@Valid RegisterDto registerDto, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {

            List<ObjectError> bindingResults = bindingResult.getAllErrors();
            //System.out.println(bindingResults);
            System.out.println(registerDto);
            //model.addAttribute("message", "Invalid Data Cannot Register");
            return "register";
        }
        String successMsg = metroService.registerInService(registerDto);
      //  model.addAttribute("msg", successMsg);
        return "register";


    }

    @GetMapping("isEmailExists")
    public ResponseEntity<String> emailExists(@RequestParam String email){

        if (email!=null){
            boolean byEmailInService=metroService.findByEmailInService(email);
            if (byEmailInService) {
                return ResponseEntity.ok("email already exists");
            }
        }

        return ResponseEntity.ok("email not exists");
    }

    @GetMapping("isPhnoExists")
    public ResponseEntity<String> phoneExists(@RequestParam String phNo){

        if (phNo!=null){
            boolean byPhInService=metroService.findByPhInService(phNo);
            if (byPhInService) {
                return ResponseEntity.ok("phone number already exists");
            }
        }
        return ResponseEntity.ok("phone number not exists");
    }


    @PostMapping("login")
    public String login(@Valid LoginDto loginDto, BindingResult bindingResult,Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("loginerrmsg", "Please enter valid data");
            return "login";
        }
        String saved = metroService.loginDetails(loginDto);
        model.addAttribute("loginerrmsg",saved);
        return "login";
    }

}
