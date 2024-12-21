package com.xworkz.metro.controller;


import com.xworkz.metro.dto.LocationDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.LocationService;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;


@Controller
@RequestMapping("/")
@Slf4j
public class LocationController {

    @Autowired //
    LocationService locationService;

    @Autowired
    MetroService metroService;

    @GetMapping("/addLocations")
    public String addLocation(@RequestParam String email,Model model){
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        return "AddLocation";
    }

    @PostMapping("/location")
    public String addingLocationAndTrainType(@Valid LocationDto locationDto, @RequestParam String email, BindingResult bindingResult, Model model){

        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "Message";
        }else{
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            log.info(email+"email");
            model.addAttribute("dto",registrationDto);
            model.addAttribute("success", "Add Location and TrainType successful");
            locationService.onSaveLocationAndType(locationDto);
            return "AddLocation";
        }

    }

    @GetMapping("/trainNumber")
    public  String findLocationTrainType(@RequestParam String trainNumber,Model model){
        LocationDto locationDto = locationService.findByTrainNumber(trainNumber);
        System.out.println(locationDto+"location Dto");
        model.addAttribute("dto",locationDto);
        return "Read";
    }
}