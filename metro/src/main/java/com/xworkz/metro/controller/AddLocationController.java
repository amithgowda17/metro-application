package com.xworkz.metro.controller;

import com.xworkz.metro.dto.AddLocationDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.AddLocationService;
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
public class AddLocationController {

    @Autowired
    MetroService metroService;

    @Autowired
    AddLocationService addLocationService;

    @PostMapping("addLocation")
    public String getMetroLocation(@RequestParam String email, @Valid AddLocationDto addLocationDto, BindingResult bindingResult, Model model){
        RegisterationDto registerationDto = metroService.findByEmailInService(email);
        if(bindingResult.hasErrors()){

            model.addAttribute("details",registerationDto);
            model.addAttribute("errmsg","please add valid details");
            return "userPage";
        }
        addLocationService.addLocation(addLocationDto);
        model.addAttribute("details",registerationDto);
        model.addAttribute("succesmsg","data added successfully");
        return "userPage";

    }
}
