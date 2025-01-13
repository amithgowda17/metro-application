package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TimingEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;


@Repository
@Slf4j
public class TimingRepositoryImpl implements TimingRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void saveTimingsFromRepo(TimingEntity timingEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(timingEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("exception in repo======="+e.getMessage());
        }finally {
            entityManager.close();
        }

    }

    @Override
    public void TheUpdatedTimings(TimingEntity timingEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(timingEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("exception in the updating Time entity {}",e.getMessage());
        }finally {
            entityManager.close();
        }
    }

    @Override
    public TimingEntity findById(Integer addTrainId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction=entityManager.getTransaction();
            transaction.begin();
            Query query =entityManager.createNamedQuery("getTimings");
            query.setParameter("addTrainId",addTrainId);
            TimingEntity timingEntity= (TimingEntity) query.getSingleResult();
            transaction.commit();
            return timingEntity;
        }catch (Exception e){
            log.info("err in timing repo======{}",e.getMessage());
            return null;
        }finally {
            entityManager.close();
        }
    }

    @Override
    public TimingEntity findBySourceAndDestination(String source, String destination) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction=entityManager.getTransaction();
            transaction.begin();
            Query query =entityManager.createNamedQuery("getBySourceAndDestination");
            query.setParameter("source",source);
            query.setParameter("destination",destination);
            TimingEntity timingEntity= (TimingEntity) query.getSingleResult();
            transaction.commit();
            return timingEntity;
        }catch (Exception e){
            return null;
        }finally {
            entityManager.close();
        }
    }
}
