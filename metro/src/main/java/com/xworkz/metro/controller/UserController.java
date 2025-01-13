package com.xworkz.metro.controller;

import com.xworkz.metro.dto.*;
import com.xworkz.metro.repositry.PriceRepository;
import com.xworkz.metro.service.AddTrainService;
import com.xworkz.metro.service.PriceService;
import com.xworkz.metro.service.TimingService;
import com.xworkz.metro.service.UserService;
import com.xworkz.metro.util.EmailSent;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;


@Controller
@RequestMapping("/")
@Slf4j
public class UserController {

    private static final String path = "D://Project//file_upload//";

    @Autowired
    private UserService userService;

    @Autowired
    private TimingService timingService;

    @Autowired
    private AddTrainService addTrainService;

    @Autowired
    private PriceService priceService;

    @Autowired
    private PriceRepository priceRepository;

    @Autowired
    private EmailSent emailSent;

    @GetMapping("/userRegister")
    public String userRegister(){
        return "userRegistration";
    }

    @GetMapping("userLogin")
    public String getUserLoginPage(){
        return "userLogin";
    }


    @GetMapping("userCanLoginHere")
    public String userCanLoginHere(){

        return "userLogin";
    }

    @GetMapping("back")
    public String userPage(@RequestParam String email,Model model){
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        List<String> uniqueSources = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getSource).distinct().collect(Collectors.toList());
        List<String> uniqueDestinations = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getDestination).distinct().collect(Collectors.toList());
        UserRegisterDto userRegisterDto = userService.lookingForEmail(email);
        model.addAttribute("uniqueSources", uniqueSources);
        model.addAttribute("uniqueDestinations", uniqueDestinations);
        model.addAttribute("details",userRegisterDto);
        return "userSuccessPage";
    }

    @PostMapping("/userRegistration")
    public String userRegistration(@Valid UserRegisterDto userRegisterDto, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "userRegistration";
        } else if (userRegisterDto != null) {
            boolean isSaved = userService.onSave(userRegisterDto);
            if(isSaved){
                emailSent.mimeMessage(userRegisterDto.getEmail());
                model.addAttribute("dto",userRegisterDto);
                model.addAttribute("success","your Registration is Completed,ThankYou");
                return "userLogin";
            }
            return "userRegistration";
        }
        return "index";
    }


    @GetMapping("findEmail")
    public ResponseEntity<String> findingUserEmail(@RequestParam String email){
        log.info("email {}",email);
        if(email != null) {
            UserRegisterDto userRegistrationDto = userService.lookingForEmail(email);
            log.info("user Registration Dto {}", userRegistrationDto);
            if (userRegistrationDto != null) {
                return ResponseEntity.ok("email already exists");
            }
        }
        return ResponseEntity.ok("email_accepted");
    }

    @GetMapping("phoneNumberExists")
    public ResponseEntity<String> phoneExists(@RequestParam String mobileNumber) {

        if (mobileNumber != null) {
            boolean byPhInService = userService.findByPhInService(mobileNumber);
            if (byPhInService) {
                return ResponseEntity.ok("phone number already exists");
            }
        }
        return ResponseEntity.ok("phone number not exists");
    }

    @GetMapping("/User")
    public String savingOtp(@RequestParam String email,String otp,Model model){
        UserRegisterDto userRegistrationDto = userService.lookingForEmail(email);
        if (userRegistrationDto != null) {
            model.addAttribute("email", userRegistrationDto);
            userService.sendingOtpToRepo(email,otp);
            model.addAttribute("message","Otp have been sent");
            return "userLogin";
        }
        return "userLogin";
    }

    @GetMapping("/loginHere")
    public String gettingOtpFromRepo(@RequestParam String otp,@RequestParam String email,@RequestParam Integer id, Model model){
       UserRegisterDto userRegistrationDto = userService.lookingForEmail(email);
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        List<String> uniqueSources = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getSource).distinct().collect(Collectors.toList());
        List<String> uniqueDestinations = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getDestination).distinct().collect(Collectors.toList());
        model.addAttribute("uniqueSources", uniqueSources);
        model.addAttribute("uniqueDestinations", uniqueDestinations);
        if (userRegistrationDto != null){
            log.info(userRegistrationDto.getOtp());
            log.info(userRegistrationDto.getEmail());
            boolean isOtpVerified= userService.verifyEmailAndOtp(email, otp);
            if (isOtpVerified){
                model.addAttribute("details", userRegistrationDto);
                return "userSuccessPage";
            }
            model.addAttribute("emailError","invalid Otp");
            model.addAttribute("email",userRegistrationDto);
            return "userLogin";
        }
        return "userLogin";
    }



    @PostMapping("updateUserDetails")
    public String editRegisterDetails(@RequestParam("file") MultipartFile file, UserRegisterDto userRegisterDto, Model model) {
        boolean updateMessage = userService.saveEditedUserDetails(userRegisterDto, file);
        UserRegisterDto registerationDto = userService.lookingForEmail(userRegisterDto.getEmail());
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        List<String> uniqueSources = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getSource).distinct().collect(Collectors.toList());
        List<String> uniqueDestinations = addTrainEntities.stream().flatMap(addTrainEntity -> addTrainEntity.getTimingEntity().stream()).map(TimingDto::getDestination).distinct().collect(Collectors.toList());
        model.addAttribute("uniqueSources", uniqueSources);
        model.addAttribute("uniqueDestinations", uniqueDestinations);
        if (updateMessage) {
            model.addAttribute("details", registerationDto);
            return "userSuccessPage";
        } else {
            model.addAttribute("details", registerationDto);
            return "userSuccessPage";
        }
    }

    @GetMapping("readImage/{imageName}")
    public void viewImage(@PathVariable String imageName, Model model, HttpServletResponse httpServletResponse) {

        File file = new File(path + imageName);

        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            InputStream inputStream = new BufferedInputStream(fileInputStream);
            ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
            IOUtils.copy(inputStream, servletOutputStream);
            model.addAttribute("image", servletOutputStream);
            httpServletResponse.flushBuffer();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    private  String generatingTicketNumber()
    {
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000;
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss,EEE");
        String currentDateTime = sdf.format(new Date());
        return "BMRCL" + randomNumber + currentDateTime;
    }

    @GetMapping("ticketForm")
    public  String getTicketForm(@RequestParam String source,@RequestParam String destination,@RequestParam String email,@RequestParam Integer id,Model model){
        log.info("source {}",source);
        log.info("destination {}",destination);
        log.info("id {}",id);
        String ticketNumber = generatingTicketNumber();
        PriceDto priceDto = priceService.findBySourceAndDestination(source, destination);
        boolean isSaved = userService.saveTicketDetails(id, ticketNumber, source, destination);
        UserRegisterDto userRegisterDto=userService.lookingForEmail(email);
        if (isSaved){
            emailSent.ticketMessage(email,ticketNumber);
            model.addAttribute("details",userRegisterDto);
            model.addAttribute("booked","ThankYou Your Ticket Booked Successfully");
            return "userSuccessPage";
        }
        log.info("by {}",priceDto);
        model.addAttribute("details",userRegisterDto);
        return "userSuccessPage";
    }


    @GetMapping("/smartCards")
    public  String getSmartCardDetails(@RequestParam String email,Model model){
        UserRegisterDto registerationDto = userService.lookingForEmail(email);
        model.addAttribute("details", registerationDto);
        return "smartCard";
    }

    @GetMapping("/info")
    public  String getInfo(@RequestParam String email,Model model){
        UserRegisterDto registerationDto = userService.lookingForEmail(email);
        model.addAttribute("details", registerationDto);
        return "information";
    }

    @GetMapping("/success")
    public  String showSuccessPage(){
        return "userSucessPage";
    }

    @GetMapping("metroTimings")
    public String getTimings(@RequestParam("email") String email, Model model){
        List<AddTrainDto> addTrainEntities = addTrainService.readAddTrainData();
        log.info(" addTrainDtos   {}  ",addTrainEntities);
        UserRegisterDto userRegisterDto =userService.lookingForEmail(email);
        model.addAttribute("details",userRegisterDto);
        model.addAttribute("addTrainEntities", addTrainEntities);
        return "metroTimings";
    }

    @GetMapping("userProfileUpdate")
    public String getUserProfilePage(@RequestParam String email,Model model){
        UserRegisterDto userRegisterDto = userService.lookingForEmail(email);
        log.info("==================userdto========= {}",userRegisterDto);
        model.addAttribute("dto",userRegisterDto);
        return "userProfile";
    }

}
