package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddTimingsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

@Repository
public class AddTimingsRepoImpl implements AddTimingsRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public boolean addTimings(AddTimingsEntity addTimingsEntity) {


        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(addTimingsEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            entityManager.close();
        }


    }
}
