package com.xworkz.metro.controller;

import com.xworkz.metro.dto.*;
import com.xworkz.metro.service.AddTrainService;
import com.xworkz.metro.service.MetroService;
import com.xworkz.metro.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/")
@Slf4j
public class AddTrainController {


    @Autowired
    MetroService metroService;

    @Autowired
    private UserService userService;

    @Autowired
    AddTrainService addTrainService;



    @GetMapping("addTrainType")
    public String addTrain(@RequestParam String email, Model model) {
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto", registrationDto);
        return "addTrain";
    }


    @PostMapping("addTrain/{email}")
    public String train(@PathVariable String email, @Valid AddTrainDto addTrainDto, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getAllErrors());
            return "Message";
        } else {
            RegisterationDto registerationDto=metroService.findByEmailInService(email);
            boolean isSaved = addTrainService.saveTrainTypeAndTrainNumber(addTrainDto);
            if(isSaved){
                redirectAttributes.addFlashAttribute("dto",registerationDto);
                return "redirect:/addTrainType?email=" + registerationDto.getEmail();
            }else{
                redirectAttributes.addFlashAttribute("Unsaved","Not Saved");
                redirectAttributes.addFlashAttribute("dto",registerationDto);
                return "redirect:/addTrainType?email=" + registerationDto.getEmail();
            }
        }
    }

    @GetMapping("readTrain")
    public String readAllData(@RequestParam String email, Model model){
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        log.info(" addTrainDtos   {}  ",addTrainEntities);
        model.addAttribute("addTrainEntities", addTrainEntities);
        return "displayMetroDetails";
    }

    @GetMapping("UpdateTrain")
    public String onEdit(@RequestParam Integer addTrainId,@RequestParam String email, Model model){
        AddTrainDto addTrainDto = addTrainService.getDetails(addTrainId);
        log.info("addTrainDto {}",addTrainDto);
        RegisterationDto registerationDto=metroService.findByEmailInService(email);
        model.addAttribute("dto",registerationDto);
        model.addAttribute("addTrainDto",addTrainDto);
        return "updateMetroDetails";
    }

    @PostMapping("updateDetails")
    public String updateDetails(AddTrainDto addTrainDto,@RequestParam Integer addTrainId,@RequestParam String email,@RequestParam String trainType,@RequestParam String trainNumber,@RequestParam String source,@RequestParam String destination,@RequestParam String fromTime,@RequestParam String toTime, @RequestParam Integer price,@RequestParam String dayOfTheWeek ,Model model){
        log.info("====this controller  add traindto=================add{}",addTrainDto);
        log.info("this=============email {}",email);
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        addTrainService.updatingMetroDetails(addTrainId,trainType,trainNumber,source,destination,fromTime,toTime,price,dayOfTheWeek);
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        model.addAttribute("addTrainEntities", addTrainEntities);
        return "displayMetroDetails";
    }

    @GetMapping("searchById")
    public String searchById(@RequestParam Integer addTrainId,@RequestParam String email, Model model){
        if (addTrainId==null){
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            model.addAttribute("dto",registrationDto);
            return "displayMetroDetails";
        }
        AddTrainDto addTrainEntities = addTrainService.getDetails(addTrainId);
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        log.info("addTrainDto========{}",addTrainEntities);
        model.addAttribute("addTrainEntity", addTrainEntities);
        log.info("addTrainDtos{}",addTrainEntities);
        return "displayMetroDetails";
    }

}