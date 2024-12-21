package com.xworkz.metro.controller;

import com.xworkz.metro.dto.PriceDto;
import com.xworkz.metro.dto.RegisterationDto;
import com.xworkz.metro.service.MetroService;
import com.xworkz.metro.service.PriceService;
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

@Controller
@RequestMapping("/")
@Slf4j
public class PriceController {

    @Autowired
    private MetroService metroService;

    @Autowired
    private PriceService priceService;



    @GetMapping("/addPriceList")
    public String addPrice(@RequestParam String email, Model model){
        RegisterationDto registrationDto = metroService.findByEmailInService(email);

        model.addAttribute("dto",registrationDto);
        return "AddPrice";
    }

    @PostMapping("/price")
    public String price(@Valid PriceDto priceDto, @RequestParam String email, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "Message";
        }else {
            boolean isSaved = priceService.savePriceFromUi(priceDto);
            RegisterationDto registrationDto = metroService.findByEmailInService(email);
            log.info(email+"email");
            if(isSaved) {
                model.addAttribute("dto", registrationDto);
                model.addAttribute("success", "Add Price and TrainType successful");
                return "AddPrice";
            }else
                model.addAttribute("unsuccess", "Add Price and TrainType successful");
            return "AddPrice";
        }
    }

    @GetMapping("sourceAndDestination")
    public ResponseEntity<?> getSourceAndDestination(@RequestParam String source ,@RequestParam String destination,Model model){
        log.info("source and destination",source,destination);
        PriceDto priceDto = priceService.findBySourceAndDestination(source, destination);
        System.out.println("pricedto"+priceDto);
        if (priceDto!=null){
            model.addAttribute("pricingDto",priceDto);
            return ResponseEntity.ok(priceDto.getPrice());
        }
        return ResponseEntity.ok("Not Found");
    }

    @GetMapping("/price")
    public ResponseEntity<String> findByPrice(@RequestParam Integer price,Model model) {
        log.info("price {}", price);
        if (price != null) {
            PriceDto priceDto = priceService.findPrice(price);
            log.info("priceDto {}",priceDto);
            if (priceDto != null) {
                model.addAttribute("single",priceDto);
                return ResponseEntity.ok("Price is found");
            } else {
                return ResponseEntity.ok("Price does not exist");
            }
        } else {
            return ResponseEntity.badRequest().body("Price parameter is missing");
        }
    }

    @GetMapping("/findPriceBySourceAndDestination")
    public String findPriceBySourceAndDestination(@RequestParam Integer price,@RequestParam String source,@RequestParam String destination,Model model) {
        PriceDto priceDto = priceService.findPriceBySourceAndDestination(price, source, destination);
        log.info(priceDto+"priceDto");
        if (priceDto != null) {
            model.addAttribute("price", priceDto);
            return "FindEmail";
        }
        return "FindEmail";
    }

    @GetMapping("findById")
    public ResponseEntity<String> findById(@RequestParam Integer priceId,Model model){
        log.info("priceId",priceId);
        PriceDto priceDto = priceService.findById(priceId);
        log.info("kkkkkk {} ",priceDto);
        if (priceDto!=null) {
            log.info("==priceDto== {}", priceDto);
            return ResponseEntity.ok("Found Id");
        }
        return ResponseEntity.ok("Not Found");
    }

}