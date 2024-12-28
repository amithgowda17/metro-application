package com.xworkz.metro.service;

import com.xworkz.metro.dto.*;
import com.xworkz.metro.entity.RegisterEntity;
import com.xworkz.metro.entity.TicketEntity;
import com.xworkz.metro.entity.UserLoginEntity;
import com.xworkz.metro.entity.UserRegisterEntity;
import com.xworkz.metro.repositry.UserLoginRepository;
import com.xworkz.metro.repositry.UserRepo;
import com.xworkz.metro.util.EmailSent;
import com.xworkz.metro.util.EncryptionDecryption;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class UserServiceImpl implements UserService{

    private static String UPLOADED_FOLDER = "D://Project//file_upload//";

    @Autowired
    UserRepo userRepository;

    @Autowired
    UserLoginRepository userLoginRepository;

    @Autowired
    private EmailSent emailSent;

    @Autowired
    private PriceService priceService;

    @Autowired
    private EncryptionDecryption encryptionDecryption;

    @Override
    public boolean onSave(UserRegisterDto userRegisterDto) {
        UserRegisterEntity userRegistrationEntity = new UserRegisterEntity();
        userRegisterDto.setPassword(encryptionDecryption.encrypt(userRegisterDto.getPassword()));
        userRegisterDto.setImageName("dummy.png");
        userRegisterDto.setImageType("image/png");
        BeanUtils.copyProperties(userRegisterDto, userRegistrationEntity);
        userRepository.save(userRegistrationEntity);
        return true;
    }

    @Override
    public UserRegisterDto lookingForEmail(String email) {
        if (email != null) {
            log.info("email in service {}", email);
            UserRegisterDto userRegistrationDto = new UserRegisterDto();
            UserRegisterEntity userRegistrationEntity = userRepository.findingEmailFromDataBase(email);
            log.info("userRegistrationEntity {}", userRegistrationEntity);
            userRegistrationEntity.setPassword(encryptionDecryption.decrypt(userRegistrationEntity.getPassword()));
            if (userRegistrationEntity != null) {
                BeanUtils.copyProperties(userRegistrationEntity, userRegistrationDto);
                log.info("userRegistrationDto {}", userRegistrationDto);
                return userRegistrationDto;
            }
        }
        return null;
    }

    @Override
    public boolean findByPhInService(String mobileNumber) {
       UserRegisterEntity userRegisterEntity =userRepository.findUserByPhoneNumber(mobileNumber);
       if (userRegisterEntity!=null){
           return true;
       }
        return false;
    }



    @Override
    public boolean sendingOtpToRepo(String email, String otp) {
        UserRegisterEntity userRegistrationEntity = userRepository.findingEmailFromDataBase(email);
        if (userRegistrationEntity != null) {
            String saveOtp = emailSent.mailSend(email);
            userRepository.saveOtp(email, saveOtp);
            return true;
        }
        return false;
    }

    @Override
    public boolean verifyEmailAndOtp(String email, String otp) {
        UserRegisterEntity userRegistrationEntity = userRepository.findingEmailFromDataBase(email);
        if (userRegistrationEntity != null) {
            UserRegisterDto userRegistrationDto = new UserRegisterDto();
            BeanUtils.copyProperties(userRegistrationEntity, userRegistrationDto);
            if (userRegistrationEntity.getOtp().equals(otp) && userRegistrationEntity.getEmail().equals(email)) {
                UserLoginDto userLoginDto = new UserLoginDto();
                UserLoginEntity userLoginEntity = new UserLoginEntity();
                userLoginDto.setLoginId(userRegistrationDto.getId());
                userLoginDto.setFirstName(userRegistrationDto.getFirstName());
                userLoginDto.setLastName(userRegistrationDto.getLastName());
                userLoginDto.setEmail(userRegistrationDto.getEmail());
                userLoginDto.setMobileNumber(userRegistrationDto.getMobileNumber());
                userLoginDto.setLoginStart(LocalDateTime.now().toString());
                userLoginDto.setLoginEnd(null);
                BeanUtils.copyProperties(userLoginDto, userLoginEntity);
                userLoginRepository.loginByEmail(userLoginEntity);
                log.info(otp);
                return true;
            }
            return false;
        }
        return false;
    }

    @Override
    public boolean saveEditedUserDetails(UserRegisterDto userRegisterDto, MultipartFile file) {
        UserRegisterDto existingDto = lookingForEmail(userRegisterDto.getEmail());
        UserRegisterEntity registerEntity = new UserRegisterEntity();

        if (file != null && !file.isEmpty() ) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                userRegisterDto.setImageName(file.getOriginalFilename());
                userRegisterDto.setImageType(file.getContentType());
                userRegisterDto.setPassword(encryptionDecryption.encrypt(userRegisterDto.getPassword()));
            } catch (IOException ignored) {

            }
        } else {
            userRegisterDto.setPassword(encryptionDecryption.encrypt(userRegisterDto.getPassword()));
            userRegisterDto.setImageName(existingDto.getImageName());
            userRegisterDto.setImageType(existingDto.getImageType());
        }

        if(userRegisterDto!=null) {
            BeanUtils.copyProperties(userRegisterDto, registerEntity);
            return userRepository.updateUserProfile(registerEntity);
        }

        return false;
    }

    @Override
    public boolean saveTicketDetails(Integer id, String ticketNumber, String source, String destination) {
        PriceDto priceDto = priceService.findBySourceAndDestination(source, destination);
        if (priceDto.getSource().equals(source) && priceDto.getDestination().equals(destination)) {
            TicketDto ticketDto = new TicketDto();
            TicketEntity ticketEntity = new TicketEntity();
            ticketDto.setUserId(id);
            ticketDto.setSource(source);
            ticketDto.setDestination(destination);
            ticketDto.setPrice(priceDto.getPrice());
            ticketDto.setTokenNumber(ticketNumber);
            BeanUtils.copyProperties(ticketDto, ticketEntity);
            userRepository.saveTheDetails(ticketEntity);
            return true;
        }
        return false;
    }

    @Override
    public List<TicketDto> findingUserIdInTicket(Integer userId) {
        if (userId != null) {
            // Fetch the ticket list based on the userId
            List<TicketEntity> ticketEntityList = userRepository.findingUserIdInTicketHistory(userId);

            // If the ticket list is not empty
            if (ticketEntityList != null && !ticketEntityList.isEmpty()) {
                List<TicketDto> ticketDtos = new ArrayList<>();

                // Iterate through each ticket entity and convert to DTO
                for (TicketEntity ticketEntity : ticketEntityList) {
                    TicketDto ticketDto = new TicketDto();
                    BeanUtils.copyProperties(ticketEntity, ticketDto);
                    ticketDtos.add(ticketDto);
                }

                // Log the list of TicketDto objects
                log.info("ticketDtos in service: {}", ticketDtos);

                // Return the full list after processing all ticket entities
                return ticketDtos;
            }
        }

        // Return an empty list instead of null when no tickets are found
        return new ArrayList<>();
    }


}
