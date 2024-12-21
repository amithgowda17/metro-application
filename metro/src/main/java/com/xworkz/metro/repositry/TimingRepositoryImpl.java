package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TimingEntity;
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
public class TimingRepositoryImpl implements TimingRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public String saveTimingsFromRepo(TimingEntity timingEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(timingEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("=========================");
        }finally {
            entityManager.close();
        }
        return "";
    }

    @Override
    public String TheUpdatedTimings(TimingEntity timingEntity) {
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
        return "";
    }

    @Override
    public TimingEntity findBySourceAndDestination(String source, String destination) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("findBYSourceAndDestination");
            query.setParameter("source",source);
            query.setParameter("destination",destination);
            Object object = query.getSingleResult();
            TimingEntity timingEntity = (TimingEntity) object;
            log.info(timingEntity+"timingEntity========================");
            return timingEntity;
        }catch (Exception e){
            log.info("=================================");
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public List<TimingEntity> readTime() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("readTime");
            List<TimingEntity> resultList =(List<TimingEntity>) query.getResultList();
            log.info("=================================");
            return resultList;
        }catch (Exception e){
            log.info("==========================");
        }
        return null;
    }

    @Override
    public TimingEntity findByTrainType(String trainType) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("time");
            query.setParameter("trainType",trainType);
            Object object = query.getSingleResult();
            TimingEntity timingEntity = (TimingEntity) object;
            return timingEntity;
        }catch (Exception e){
            log.error("================findBYTRAINTYPE"+trainType);
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public List<TimingEntity> findingSourceAndDestinations( String source, String destination) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("findTrainBySourceAndDestination");
            query.setParameter("source",source);
            query.setParameter("destination",destination);
            List<TimingEntity> resultList =(List<TimingEntity>) query.getResultList();
            return resultList;
        }catch (Exception e){
            log.info("====================================");
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public TimingEntity findById(Integer timingId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("timingId");
            query.setParameter("timingId",timingId);
            Object object =query.getSingleResult();
            TimingEntity timingEntity = (TimingEntity) object;
            return timingEntity;
        }catch (Exception e){
            log.info("timingEntity {}",e.getMessage());
        }finally {
            entityManager.close();
        }
        return null;
    }
}
