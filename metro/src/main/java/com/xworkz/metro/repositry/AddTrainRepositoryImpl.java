package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddTrainEntity;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

@Repository
@Slf4j
public class AddTrainRepositoryImpl implements AddTrainRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void saveTrainTypeAndNumber(AddTrainEntity addTrainEntity) {
        log.info("add train entity is ====================  " + addTrainEntity);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(addTrainEntity);
            transaction.commit();
        } catch (Exception e) {
            log.info("==============={}",e.getMessage());
        } finally {
            entityManager.close();
        }
    }

    @Override
    public AddTrainEntity findByTrainNumberAndTrainType(String trainNumber, String trainType) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findByTrainNumberAndTrainType");
            query.setParameter("trainNumber", trainNumber);
            query.setParameter("trainType", trainType);
            Object object = query.getSingleResult();
            AddTrainEntity addTrainEntity = (AddTrainEntity) object;
            log.info("addTrainee entity in repo======{}",addTrainEntity);
            return addTrainEntity;
        } catch (Exception e) {
            log.info("exception========"+e.getMessage());
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public List<AddTrainEntity> readAddTrainDetails() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("readTrain");
            List<AddTrainEntity> resultList = (List<AddTrainEntity>) query.getResultList();
            log.info("resultlist {}",resultList);
            return resultList;
        } catch (Exception e) {
            log.info("==============================");
        } finally {
            entityManager.close();
        }
        return null;
    }


    @Override
    public AddTrainEntity findById(Integer addTrainId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
             EntityTransaction transaction=entityManager.getTransaction();
             transaction.begin();
            Query query = entityManager.createNamedQuery("getAllDetailsById");
            query.setParameter("addTrainId",addTrainId);
            AddTrainEntity addTrainEntities =(AddTrainEntity) query.getSingleResult();
            Hibernate.initialize(addTrainEntities.getTimingEntity());
            Hibernate.initialize(addTrainEntities.getPriceEntity());
            Hibernate.initialize(addTrainEntities.getLocations());
            transaction.commit();
            return addTrainEntities;
        }catch (Exception e){
            log.info("err in addrepo==========={}",e.getMessage());
            return null;
        }finally {
            entityManager.close();
        }
    }

    @Override
    public AddTrainEntity findTrainNumber(String trainNumber) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("findNumber");
            query.setParameter("number",trainNumber);
            Object object = query.getSingleResult();
            AddTrainEntity addTrainEntity = (AddTrainEntity) object;
            return addTrainEntity;
        }catch (Exception e){
            log.info("find by train Number is :"+trainNumber);
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public void savingTheUpdateDetails(AddTrainEntity addTrainEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(addTrainEntity);
            transaction.commit();
            log.info("this is addtrain repo========================");
        }catch (Exception e){
            log.info("print exceptions {}",e.getMessage());
        }
        finally {
            entityManager.close();
        }

    }



}
