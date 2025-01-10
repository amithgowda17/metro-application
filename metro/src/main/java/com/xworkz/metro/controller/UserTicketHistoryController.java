package com.xworkz.metro.controller;

import com.xworkz.metro.dto.TicketDto;
import com.xworkz.metro.dto.UserRegisterDto;
import com.xworkz.metro.service.UserService;
import com.xworkz.metro.util.EmailSent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
@Slf4j
public class UserTicketHistoryController {

    @Autowired
    private EmailSent emailSent;

    @Autowired
    private UserService userService;

    @GetMapping("/abc")
    public String getDet(@RequestParam Integer userId,@RequestParam String email, Model model){
        List<TicketDto> ticketDtos = userService.findingUserIdInTicket(userId);
        log.info("ticket Dto {}",ticketDtos);
        UserRegisterDto userRegisterDto=userService.lookingForEmail(email);
        model.addAttribute("details",userRegisterDto);
        model.addAttribute("ticketDto",ticketDtos);
        return "userTicketHistory";
    }

}
