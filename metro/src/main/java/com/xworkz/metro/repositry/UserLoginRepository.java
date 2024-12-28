package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.UserLoginEntity;

public interface UserLoginRepository {

    String loginByEmail(UserLoginEntity userLoginEntity);

}
