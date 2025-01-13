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
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.validation.Valid;



@Controller
@RequestMapping("/")
@Slf4j
public class LocationController {


    @Autowired
    LocationService locationService;

    @Autowired
    MetroService metroService;

    @GetMapping("addLocations")
    public String addLocation(@RequestParam String email, Model model) {
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto", registrationDto);
        return "addLocation";
    }

    @PostMapping("location/{email}")
    public String addingLocationAndTrainType(@PathVariable String email, @Valid LocationDto locationDto, Model model, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", "enter a valid details");
            return "addLocation";
        }
        locationService.onSaveLocationAndType(locationDto);
        redirectAttributes.addFlashAttribute("dto",registrationDto);
        return "redirect:/addLocations?email=" + registrationDto.getEmail();
    }


}