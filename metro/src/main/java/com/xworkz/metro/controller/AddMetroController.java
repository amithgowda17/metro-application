package com.xworkz.metro.controller;


import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/")
public class AddMetroController {

    @Autowired
    MetroService metroService;


    @PostMapping("addMetro")
    public String getAddTrain(@RequestParam String email, Model model){
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        model.addAttribute("details",registerationDto);
        return "userPage";
    }
}
