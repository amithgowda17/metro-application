package com.xworkz.metro.controller;

import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.dto.TimingDto;
import com.xworkz.metro.service.MetroService;
import com.xworkz.metro.service.TimingService;
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
public class TimingsController {
    @Autowired
    private MetroService metroService;

    @Autowired
    private TimingService timingService;

    @GetMapping("/addTimings")
    public String addTimings(@RequestParam String email, Model model){
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        return "addTimings";
    }


    @PostMapping("timings/{email}")
    public String timings(@Valid TimingDto timingDto, @PathVariable String email, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "Message";
        }else{
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            timingService.saveTimings(timingDto);
            log.info(email+"email");
            redirectAttributes.addFlashAttribute("dto",registrationDto);
            return "redirect:/addTimings?email="+registrationDto.getEmail();

        }
    }

}
