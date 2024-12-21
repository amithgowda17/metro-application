package com.xworkz.metro.controller;

import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.dto.TimingDto;
import com.xworkz.metro.service.MetroService;
import com.xworkz.metro.service.TimingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
@Slf4j
public class TimingsController {
    @Autowired
    MetroService metroService;

    @Autowired
    TimingService timingService;

    @GetMapping("/addTimings")
    public String addTimings(@RequestParam String email, Model model){
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        return "AddTimings";
    }


    @PostMapping("/timings")
    public String timings(@Valid TimingDto timingDto, @RequestParam String email, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "Message";
        }else{
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            log.info(email+"email");
            model.addAttribute("dto",registrationDto);
            model.addAttribute("success","Add Location and TrainType successful");
            timingService.saveTimings(timingDto);
            return "AddTimings";

        }
    }

    @GetMapping("/train")
    public String findByTrainType(@RequestParam String trainType,Model model){
        TimingDto timingto = timingService.findByTrainType(trainType);
        System.out.println(timingto+"timingDto");
        model.addAttribute("time",timingto);
        return "Read";
    }

    @GetMapping("/hello")
    public String onRead(Model model) {
        List<TimingDto> timingDtos = timingService.readTime();
        System.out.println(timingDtos);
        model.addAttribute("trainees", timingDtos);
        return "Read";
    }

    @GetMapping("/gettingDetails")
    public String getSourceAndDestination(@RequestParam String source,@RequestParam String destination){

        return "";
    }

    @GetMapping("findingTimingId")
    public ResponseEntity<?> findById(@RequestParam Integer timingId , Model model){
        log.info("timingId",timingId);
        TimingDto timingDto  = timingService.findById(timingId);
        log.info("timingDto {} ",timingDto);
        if (timingDto!=null) {
            log.info("==timingDto== {}", timingDto);
            return ResponseEntity.ok("Found Id");
        }
        return ResponseEntity.ok("Not Found");
    }



}
