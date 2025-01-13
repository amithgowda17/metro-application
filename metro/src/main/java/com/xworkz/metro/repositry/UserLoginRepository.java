package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.UserLoginEntity;

public interface UserLoginRepository {

    void loginByEmail(UserLoginEntity userLoginEntity);

}
