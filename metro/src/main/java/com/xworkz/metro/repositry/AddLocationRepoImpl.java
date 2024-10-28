package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddLocationEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;


@Repository
public class AddLocationRepoImpl implements AddLocationRepo{


    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void saveLocation(AddLocationEntity addLocationEntity) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(addLocationEntity);
            entityTransaction.commit();

        } catch (Exception e) {

        } finally {
            entityManager.close();
        }

    }
}
