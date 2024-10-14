package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.LoginEntity;
import com.xworkz.metro.entity.RegisterEntity;


public interface MetroRepo {

    boolean register(RegisterEntity registerEntity);

    RegisterEntity findByEmail(String email);

    RegisterEntity findByPhNo(String phNo);

    boolean login(LoginEntity loginEntity);

    boolean updateProfile(RegisterEntity registerEntity);


}
