package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.UserLoginEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

@Repository
@Slf4j
public class UserLoginRepositoryImpl implements UserLoginRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void loginByEmail(UserLoginEntity userLoginEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            entityTransaction.begin();
            entityManager.merge(userLoginEntity);
            entityTransaction.commit();
        }catch (Exception e){
            log.info("exception in repo======="+e.getMessage());
        }finally {

            entityManager.close();
        }
    }
}
