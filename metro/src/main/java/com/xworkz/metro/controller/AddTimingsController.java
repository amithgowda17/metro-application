package com.xworkz.metro.controller;


import com.xworkz.metro.dto.AddTimingsDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.AddTimingsService;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/")
public class AddTimingsController {

    @Autowired
    MetroService metroService;

    @Autowired
    AddTimingsService addTimingsService;

    @PostMapping("addTimings")
    public String getMetroTimings(@RequestParam String email, @Valid AddTimingsDto addTimingsDto, BindingResult bindingResult, Model model){
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        String message = addTimingsService.addTimings(addTimingsDto);
        if(bindingResult.hasErrors() || message.equals("data not saved")){

            model.addAttribute("details",registerationDto);
            model.addAttribute("errMsg","please add valid details");
            return "userPage";
        }
        model.addAttribute("details",registerationDto);
        model.addAttribute("successMsg","data added successfully");
        return "userPage";
    }
}
