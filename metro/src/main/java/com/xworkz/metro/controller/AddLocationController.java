package com.xworkz.metro.controller;

import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/")
public class AddLocationController {

    @Autowired
    MetroService metroService;

    @GetMapping("addLocation")
    public String getMetroLocation(@RequestParam String email, Model model){
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        model.addAttribute("details",registerationDto);
        return "addLocation";
    }
}
