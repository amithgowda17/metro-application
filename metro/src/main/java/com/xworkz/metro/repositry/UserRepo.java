package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TicketEntity;
import com.xworkz.metro.entity.UserRegisterEntity;

import java.util.List;

public interface UserRepo {

    void save(UserRegisterEntity userRegisterEntity);

    UserRegisterEntity findingEmailFromDataBase(String email);

    boolean saveOtp (String email,String otp);

    void saveTheDetails(TicketEntity ticketEntity);

    List<TicketEntity> findingUserIdInTicketHistory(Integer userId);

    UserRegisterEntity findUserByPhoneNumber(String mobileNumber);

    boolean updateUserProfile(UserRegisterEntity registerEntity);
}
