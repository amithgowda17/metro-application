package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.LoginEntity;
import com.xworkz.metro.entity.RegisterEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class MetroRepoImpl implements MetroRepo {


    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public boolean register(RegisterEntity registerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            System.out.println("register entity in repo ======"+registerEntity);
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(registerEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public RegisterEntity findByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            Query query = entityManager.createNamedQuery("findByEmailInRegister");
            query.setParameter("value",email);
            RegisterEntity registerEntity = (RegisterEntity) query.getSingleResult();
            entityTransaction.commit();
            return registerEntity;
        } catch (Exception e) {
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public RegisterEntity findByPhNo(String phNo) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            Query query = entityManager.createNamedQuery("findByPhNoInRegister");
            query.setParameter("valu",phNo);
            RegisterEntity registerEntity = (RegisterEntity) query.getSingleResult();
            entityTransaction.commit();
            return registerEntity;
        } catch (Exception e) {
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean login(LoginEntity loginEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            System.out.println("login entity in repo ======"+loginEntity);
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(loginEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean saveOtpInRepo(String email,String otp) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction=entityManager.getTransaction();
            entityTransaction.begin();
            Query query=entityManager.createNamedQuery("updateOtp");
            query.setParameter("otp",otp);
            query.setParameter("email",email);
            query.executeUpdate();
            entityTransaction.commit();
            return true;
        }catch (Exception e) {
            return false;
        }finally {
            entityManager.close();
        }
    }

    @Override
    public boolean updatePasswordInRepo(String email, String password) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try{
            EntityTransaction entityTransaction=entityManager.getTransaction();
            entityTransaction.begin();
            Query query = entityManager.createNamedQuery("updatePassword");
            query.setParameter("password",password);
            query.setParameter("email",email);
            query.executeUpdate();
            entityTransaction.commit();
            return true;
        }catch (Exception e) {
            return false;
        }finally {
            entityManager.close();
        }
    }

    @Override
    public void userLocked(String email, int noOfAttempts, boolean isAccountLocked) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try{
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            Query query = entityManager.createNamedQuery("passwordWrongAttempt");
            query.setParameter("email",email);
            query.setParameter("noOfAttempts",noOfAttempts);
            query.setParameter("isAccountLocked",isAccountLocked);
            query.executeUpdate();
            entityTransaction.commit();
            System.out.println(isAccountLocked+"==isAccountLocked=");
            System.out.println(noOfAttempts+"========");
            System.out.println("email===="+email);
        }catch (Exception e){

        }finally {
            entityManager.close();
        }
    }

    @Override
    public boolean editProfileSave(RegisterEntity registerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.merge(registerEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            entityManager.close();
        }
    }



}