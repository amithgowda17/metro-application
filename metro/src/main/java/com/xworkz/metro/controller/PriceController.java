package com.xworkz.metro.controller;

import com.xworkz.metro.dto.PriceDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.MetroService;
import com.xworkz.metro.service.PriceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
@Slf4j
public class PriceController {

    @Autowired
    private MetroService metroService;

    @Autowired
    private PriceService priceService;



    @GetMapping("addPriceList")
    public String addPrice(@RequestParam String email, Model model){
        RegisterationDto registrationDto = metroService.findByEmailInService(email);
        model.addAttribute("dto",registrationDto);
        return "addPrice";
    }

    @PostMapping("price/{email}")
    public String price(@Valid PriceDto priceDto, @PathVariable String email, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "Message";
        }else {
            boolean isSaved = priceService.savePriceFromUi(priceDto);
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            log.info(email+"email");
            if(isSaved) {
                redirectAttributes.addFlashAttribute("dto",registrationDto);
                return "redirect:/addPriceList?email=" + registrationDto.getEmail();
            }else
                redirectAttributes.addFlashAttribute("unsuccess", "Add Price and TrainType not saved");
            redirectAttributes.addFlashAttribute("dto",registrationDto);
            return "redirect:/addPriceList?email=" + registrationDto.getEmail();
        }
    }

    @GetMapping("sourceAndDestination")
    public ResponseEntity<?> getSourceAndDestination(@RequestParam String source,
                                                     @RequestParam String destination) {

        if (source == null || source.isEmpty() || destination == null || destination.isEmpty()) {
            log.warn("Invalid source or destination, Source: {}, Destination: {}", source, destination);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Source or destination is missing");
        }

        log.info("Source: {}, Destination: {}", source, destination);

        PriceDto priceDto = priceService.findBySourceAndDestination(source, destination);

        if (priceDto != null && priceDto.getPrice() != null) {
            log.info("Price fetched: {}", priceDto.getPrice());
            return ResponseEntity.ok()
                    .contentType(MediaType.TEXT_PLAIN)
                    .body(priceDto.getPrice().toString());
        }
        log.warn("Price not found for source: {} and destination: {}", source, destination);
        return ResponseEntity.ok()
                .contentType(MediaType.TEXT_PLAIN)
                .body("Not Found");
    }



}