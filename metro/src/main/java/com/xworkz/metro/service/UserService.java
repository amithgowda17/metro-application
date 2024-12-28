package com.xworkz.metro.service;

import com.xworkz.metro.dto.TicketDto;
import com.xworkz.metro.dto.UserRegisterDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserService {

    boolean onSave(UserRegisterDto userRegisterDto);

    UserRegisterDto lookingForEmail(String email);

    boolean sendingOtpToRepo(String email, String otp);

    boolean verifyEmailAndOtp(String email,String otp);

    boolean saveTicketDetails(Integer id,String ticketNumber,String source,String destination);

    List<TicketDto> findingUserIdInTicket(Integer userId);

    boolean findByPhInService(String mobileNumber);

    boolean saveEditedUserDetails(UserRegisterDto userRegisterDto, MultipartFile file);
}
