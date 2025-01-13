package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.LocationEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

@Repository
@Slf4j
public class LocationRepositoryImpl implements LocationRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void onLocationSave(LocationEntity locationEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(locationEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("exception in repo======="+e.getMessage());
        }finally {
            entityManager.close();
        }

    }

    @Override
    public LocationEntity findByTrainNumber(String trainNumber) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("findByTrainNumber");
            query.setParameter("trainNumber",trainNumber);
            Object  object = query.getSingleResult();
            LocationEntity locationEntity = (LocationEntity) object;
            return locationEntity;
        }catch (Exception e){
            log.info("Print If any exceptions");
            return null;
        }finally {
            entityManager.close();
        }

    }

    @Override
    public List<LocationEntity> readLocation() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("readLocation");
            List<LocationEntity> resultList =(List<LocationEntity>) query.getResultList();
            log.info("result from readLocation" +resultList);
            return resultList;
        }catch (Exception e){
            log.info("info about location details");
            return null;
        }finally {
            entityManager.close();
        }
    }

}
