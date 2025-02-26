package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TicketEntity;
import com.xworkz.metro.entity.UserRegisterEntity;
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
public class UserRepoImpl implements UserRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void save(UserRegisterEntity userRegisterEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(userRegisterEntity);
            transaction.commit();
        } catch (Exception e) {
            log.info("exception in repo======="+e.getMessage());
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegisterEntity findingEmailFromDataBase(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction=entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("emailFindByMe");
            query.setParameter("email", email);
            Object object = query.getSingleResult();
            UserRegisterEntity userRegisterEntity = (UserRegisterEntity) object;
            log.info("userRegistrationEntity from email {}",userRegisterEntity);
            transaction.commit();
            return userRegisterEntity;
        } catch (Exception e) {
            log.info("Some Problem fetching with database ");
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegisterEntity findUserByPhoneNumber(String mobileNumber) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findUserByMobileNumber");
            query.setParameter("mobileNumber", mobileNumber);
            Object object = query.getSingleResult();
            UserRegisterEntity userRegisterEntity = (UserRegisterEntity) object;
            log.info("userRegistrationEntity from phNo {}",userRegisterEntity);
            return userRegisterEntity;
        } catch (Exception e) {
            log.info("Some Problem fetching with database");
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean updateUserProfile(UserRegisterEntity registerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityManagerTransaction = entityManager.getTransaction();
            entityManagerTransaction.begin();
            entityManager.merge(registerEntity);
            entityManagerTransaction.commit();
            return true;
        }catch (Exception e){
            return false;
        }finally {
           entityManager.close();
        }
    }


    @Override
    public boolean saveOtp(String email, String otp) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("oneTimeOtp");
            query.setParameter("otp", otp);
            query.setParameter("email", email);
            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println("print if theres an error");
        } finally {
            entityManager.close();
        }
        return true;
    }

    @Override
    public void saveTheDetails(TicketEntity ticketEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(ticketEntity);
            transaction.commit();
        } catch (Exception e) {
            log.info("exception in repo=======" + e.getMessage());
        } finally {
            entityManager.close();
        }
    }


    @Override
    public List<TicketEntity> findingUserIdInTicketHistory(Integer userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findUserIdTicketHistory");
            query.setParameter("userId",userId);
            List<TicketEntity> ticketEntity =(List<TicketEntity>)  query.getResultList()  ;
            log.info("ticketEntity {}",ticketEntity);
            return ticketEntity;
        } catch (Exception e) {
            log.info("message {}", e.getMessage());
        } finally {
            entityManager.close();
        }
        return null;
    }


}
