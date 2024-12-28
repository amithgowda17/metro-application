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
            log.info(isSaved+"issaved");
            if(isSaved){
                redirectAttributes.addFlashAttribute("dto",registerationDto);
                return "redirect:/addTrainType?email=" + registerationDto.getEmail();
            }else{
                model.addAttribute("Unsaved","Not Saved");
                return "addTrain";
            }
        }
    }

    @GetMapping("readTrain")
    public String readAllData(@RequestParam String email, Model model){
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        log.info("registrationDto==========",registrationDto.getEmail());
        log.info(" addTrainDtos   {}  ",addTrainEntities);
        model.addAttribute("addTrainEntities", addTrainEntities);
        return "displayMetroDetails";
    }

    @GetMapping("UpdateTrain")
    public String onEdit(@RequestParam Integer addTrainId,Model model){
        AddTrainDto addTrainDto = addTrainService.getDetails(addTrainId);
        log.info("addTrainDto {}",addTrainDto);

        model.addAttribute("dto",addTrainDto);

        return "updateMetroDetails";
    }

    @PostMapping("updateDetails")
    public String updateDetails(AddTrainDto addTrainDto,@RequestParam String email,@RequestParam String trainType,@RequestParam String trainNumber,@RequestParam String source,@RequestParam String destination,@RequestParam String fromTime,@RequestParam String toTime, @RequestParam Integer price,@RequestParam String dayOfTheWeek ,Model model){
        log.info("add{}",addTrainDto,price);
        log.info("email {}",email);
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        addTrainService.updatingMetroDetails(trainType,trainNumber,source,destination,fromTime,toTime,price,dayOfTheWeek);
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        model.addAttribute("addTrainEntities", addTrainEntities);
        log.info("addTrainDtos{}",addTrainEntities);
        return "displayMetroDetails";
    }

    @GetMapping("searchById")
    public String searchById(@RequestParam(required = false) Integer addTrainId,@RequestParam String email, Model model){
        if (addTrainId==null){
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            model.addAttribute("dto",registrationDto);
            model.addAttribute("find","Enter the Id Number");
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