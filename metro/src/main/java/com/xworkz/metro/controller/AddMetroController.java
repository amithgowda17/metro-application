package com.xworkz.metro.controller;


import com.xworkz.metro.dto.AddMetroDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.AddMetroService;
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
public class AddMetroController {

    @Autowired
    MetroService metroService;

    @Autowired
    AddMetroService addMetroService;


    @PostMapping("addMetro")
    public String getAddTrain(@RequestParam String email, @Valid AddMetroDto addMetroDto, BindingResult bindingResult ,Model model){
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        String message =  addMetroService.addMetro(addMetroDto);
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
