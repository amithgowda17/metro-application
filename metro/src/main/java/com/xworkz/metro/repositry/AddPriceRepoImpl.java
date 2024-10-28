package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddPriceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

@Repository
public class AddPriceRepoImpl implements AddPriceRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void addPrice(AddPriceEntity addPriceEntity) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            Object addLocationEntity;
            entityManager.persist(addPriceEntity);
            entityTransaction.commit();

        } catch (Exception e) {

        } finally {
            entityManager.close();
        }


    }
}
