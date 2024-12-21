package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.PriceEntity;
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
public class PriceRepositoryImpl implements PriceRepository{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public String savePriceToDataBase(PriceEntity priceEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try{
            transaction.begin();
            entityManager.merge(priceEntity);
            transaction.commit();
        }catch (Exception e){
            log.info("============================");
        }finally {
            entityManager.close();
        }
        return "";
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
    public List<PriceEntity> readPrice() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query = entityManager.createNamedQuery("readPrice");
            List<PriceEntity> resultList =(List<PriceEntity>) query.getResultList();
            return resultList;
        }catch(Exception e){
            log.info("========================");
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public PriceEntity findById(Integer priceId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query =entityManager.createNamedQuery("priceId");
            query.setParameter("priceId",priceId);
            Object object = query.getSingleResult();
            PriceEntity priceEntity = (PriceEntity) object;
            return priceEntity;
        }catch (Exception e){
            log.error("================");
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public PriceEntity findByTrainType(String trainType) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            Query query =entityManager.createNamedQuery("trainType");
            query.setParameter("trainType",trainType);
            Object object = query.getSingleResult();
            PriceEntity priceEntity = (PriceEntity) object;
            return priceEntity;
        }catch (Exception e){
            log.error("================findBYTRAINTYPE");
        }finally {
            entityManager.close();
        }
        return null;

    }

    @Override
    public PriceEntity findByPrice(Integer price) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findPrice");
            query.setParameter("price",price);
            Object object =query.getSingleResult();
            PriceEntity priceEntity = (PriceEntity) object;
            return priceEntity;
        }catch (Exception e){
            log.info("==price==");
        }finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public PriceEntity findPriceBySourceAndDestination(Integer price, String source, String destination) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findPriceBySourceAndDestination");
            query.setParameter("price",price);
            query.setParameter("source",source);
            query.setParameter("destination",destination);
            Object object = query.getSingleResult();
            PriceEntity priceEntity = (PriceEntity) object;
            return priceEntity;
        }catch (Exception e){
            log.info("====================");
        }finally {
            entityManager.close();
        }
        return null;
    }
}
