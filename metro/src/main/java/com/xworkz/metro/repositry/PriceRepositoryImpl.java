package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.PriceEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;


@Repository
@Slf4j
public class PriceRepositoryImpl implements PriceRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void savePriceToDataBase(PriceEntity priceEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(priceEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("err msg in price repo{}",e.getMessage());
        }finally {
            entityManager.close();
        }

    }

    @Override
    public PriceEntity findBySourceAndDestination(String source, String destination) {
        log.info("source and desti{}",source,destination);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("findBySourceAndDestination");
            query.setParameter("source",source);
            query.setParameter("destination",destination);
            log.info("source{}",source);
            log.info("destination {}",destination);
            Object object  =   query.getSingleResult();
            log.info("object{}",object);
            PriceEntity priceEntity = (PriceEntity) object;
            log.info("priceEntity {}",priceEntity);
            log.info("return price Entity");
            return priceEntity;
        }catch (Exception e){
            log.info("========================"+e.getMessage());
        }finally {
            entityManager.close();
        }
        return null;
    }


    @Override
    public PriceEntity findById(Integer addTrainId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            EntityTransaction transaction=entityManager.getTransaction();
            transaction.begin();
            Query query =entityManager.createNamedQuery("priceId");
            query.setParameter("addTrainId",addTrainId);
            Object object = query.getSingleResult();
            PriceEntity priceEntity = (PriceEntity) object;
            transaction.commit();
            return priceEntity;
        }catch (Exception e){
            log.error("err in price repo===={}",e.getMessage());
        }finally {
            entityManager.close();
        }
        return null;
    }

}
