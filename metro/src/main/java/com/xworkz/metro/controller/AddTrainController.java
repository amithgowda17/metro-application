package com.xworkz.metro.controller;

import com.xworkz.metro.dto.*;
import com.xworkz.metro.service.AddTrainService;
import com.xworkz.metro.service.MetroService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/")
@Slf4j
public class AddTrainController {


    @Autowired
    MetroService metroService;

    @Autowired
    AddTrainService addTrainService;

    @GetMapping("/addTrainType")
    public String addTrain(@RequestParam String email, AddTrainDto addTrainDto, Model model) {
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto", registrationDto);
        return "AddTrain";
    }


    @PostMapping("/addTrain")
    public String train(@Valid AddTrainDto addTrainDto, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getAllErrors());
            return "Message";
        } else {
            boolean isSaved = addTrainService.saveTrainTypeAndTrainNumber(addTrainDto);
            log.info(isSaved+"issaved");
            if(isSaved){
                model.addAttribute("success", "Saved successful");
                return "AddTrain";
            }else{
                model.addAttribute("Unsaved","Not Saved");
                return "AddTrain";
            }
        }
    }


    @GetMapping("/trainType")
    public String findByTrainType(@RequestParam String trainType,Model model){
        AddTrainDto addTrainDto = addTrainService.getTrainTypeService(trainType);
        model.addAttribute("trainType",addTrainDto);
        log.info("===================addTrainDto==========================="+addTrainDto);
        return "ReadData";
    }

  /*  @GetMapping("/getAllDetails{addTrainId}")
    public ResponseEntity<AddTrainEntity> findById(@RequestParam Integer addTrainId){
        Optional<AddTrainEntity> optional = addTrainService.findById(addTrainId);
        if(optional.isPresent()){
            return ResponseEntity.ok(optional.get());
        }
        return ResponseEntity.noContent().build();
    }*/

    @GetMapping("/getAllDetails")
    public String getData(@RequestParam Integer addTrainId,Model model){
        AddTrainDto addTrainDto = addTrainService.getDetails(addTrainId);
        log.info("addTrainEntity");
        model.addAttribute("trainees",addTrainDto);
        model.addAttribute("addTrainEntity", addTrainDto);  // Name it properly here.
        return "ReadData";
    }

    @GetMapping("/use")
    public String getInfo(@RequestParam String trainNumber,Model model){
        AddTrainDto byTrainNumber = addTrainService.findByTrainNumber(trainNumber);
        log.info("byTrainNumber");
        model.addAttribute("addTrainId", byTrainNumber);
        return "ReadData";
    }


    @GetMapping("/number")
    public String getTrainNumber(@RequestParam String trainNumber,Model model){
        AddTrainDto byTrainNumber = addTrainService.findByTrainNumber(trainNumber);
        model.addAttribute("trainNumber",byTrainNumber);
        return "AddTrain";
    }

    @GetMapping("/readTrain")
    public String readAllData(@RequestParam String email, Model model){
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        log.info(" addTrainDtos   {}  ",addTrainEntities);
        model.addAttribute("addTrainEntities", addTrainEntities);
        return "ReadData";
    }

    @GetMapping("/UpdateTrainee")
    public String onEdit(@RequestParam Integer addTrainId,Model model){
        AddTrainDto addTrainDto = addTrainService.getDetails(addTrainId);
        log.info("addTrainDto {}",addTrainDto);
        List<TimingDto> timingDto = addTrainDto.getTimingEntity();
        List<PriceDto> priceDto = addTrainDto.getPriceEntity();
        List<LocationDto> locationDto = addTrainDto.getLocations();
        log.info("timingDto {}",timingDto);
        log.info("priceDto {}",priceDto);
        log.info("locationDto {}",locationDto);
        model.addAttribute("dto",addTrainDto);
        model.addAttribute("lto",locationDto);
        return "UpdateMetroDetails";
    }

    @PostMapping("/updateDetails")
    public String updateDetails(AddTrainDto addTrainDto,@RequestParam String email,@RequestParam String trainType,@RequestParam String trainNumber,@RequestParam String source,@RequestParam String destination,@RequestParam String fromTime,@RequestParam String toTime, @RequestParam Integer price,@RequestParam String dayOfTheWeek ,Model model){
        log.info("add{}",addTrainDto,price);
        log.info("email {}",email);
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        addTrainService.updatingMetroDetails(trainType,trainNumber,source,destination,fromTime,toTime,price,dayOfTheWeek);
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        model.addAttribute("addTrainEntities", addTrainEntities);
        log.info("addTrainDtos{}",addTrainEntities);
        return "ReadData";
    }

    @GetMapping("searchById")
    public String searchById(@RequestParam(required = false) Integer addTrainId,@RequestParam String email, Model model){
        if (addTrainId==null){
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            model.addAttribute("dto",registrationDto);
            model.addAttribute("find","Enter the Id Number");
            return "ReadData";
        }
        AddTrainDto addTrainEntities = addTrainService.getDetails(addTrainId);
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        log.info("addTrainDto========{}",addTrainEntities);
        model.addAttribute("addTrainEntity", addTrainEntities);
        log.info("addTrainDtos{}",addTrainEntities);
        return "ReadData";
    }

}