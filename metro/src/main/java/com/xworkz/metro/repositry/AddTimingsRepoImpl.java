package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddTimingsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

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

    @Override
    public List<AddTimingsEntity> getAllMetroTimingsDetails() {
      EntityManager entityManager =  entityManagerFactory.createEntityManager();
      try {
         EntityTransaction entityTransaction = entityManager.getTransaction();
         entityTransaction.begin();
         Query query = entityManager.createNamedQuery("ReadAllMetroTimings");
         List<AddTimingsEntity> addTimingsEntities = query.getResultList();
         entityTransaction.commit();
         return addTimingsEntities;
      }catch (Exception e){
          return Collections.emptyList();
      }finally {
          entityManager.close();
      }
    }
}
