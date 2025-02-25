package com.xworkz.mediapp.repository;

import com.xworkz.mediapp.dto.MediProductDto;
import com.xworkz.mediapp.entity.MediEntity;
import com.xworkz.mediapp.entity.MediProductEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.Collections;
import java.util.List;

@Slf4j
@Repository
public class MediRepoImpl implements MediRepo{
    @Autowired
    private EntityManagerFactory factory;

    @Override
    public boolean addUser(MediEntity mediEntity) {
        EntityManager entityManager = factory.createEntityManager();
        System.out.println(mediEntity);
        Long count = (Long) entityManager.createQuery("SELECT COUNT(u) FROM MediEntity u WHERE u.email = :email").setParameter("email", mediEntity.getEmail()).getSingleResult();
        if (count > 0) {
            System.out.println("Email is already registered.");
            return false; // Email already exists, return false
        }
        entityManager.getTransaction().begin();
        entityManager.persist(mediEntity);
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public MediEntity getEntityByEmail(String email) {
        try {
            return (MediEntity) factory.createEntityManager().createNamedQuery("getEntityByEmail").setParameter("email", email).getSingleResult();
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return null;
    }

    @Override
    public boolean updateUserEntity(MediEntity mediEntity) {
        try {
            EntityManager entityManager = factory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.merge(mediEntity);
            entityManager.getTransaction().commit();
            entityManager.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public MediEntity getEntityByPhone(Long no) {
        try {
            return (MediEntity) factory.createEntityManager().createNamedQuery("getEntityByPhone").setParameter("no", no).getSingleResult();

        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return null;
    }

    @Override
    public boolean updatePasswordByEmail(String email, String password, String c_Password) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        int i =entityManager.createNamedQuery("updatePasswordByEmail").setParameter("pass",password).setParameter("c_pass",c_Password).setParameter("email",email).executeUpdate();
        entityManager.getTransaction().commit();
        return i > 0;
    }

    @Override
    public boolean addProduct(MediProductEntity mediEntity) {
        EntityManager entityManager = factory.createEntityManager();
        System.out.println(mediEntity);
        /*Long count = (Long) entityManager.createQuery("SELECT COUNT(u) FROM MediProductEntity u WHERE u.email = :email").setParameter("email", mediEntity.getEmail()).getSingleResult();
        if (count > 0) {
            System.out.println("Email is already registered.");
            return false; // Email already exists, return false
        }*/
        entityManager.getTransaction().begin();
        entityManager.persist(mediEntity);
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public List<MediProductEntity> getAllProductsStocks() {

        return factory.createEntityManager().createNamedQuery("getAllProductsStocks").getResultList();
    }

    @Override
    public MediProductEntity getProductById(Integer id) {
        try {

            return (MediProductEntity) factory.createEntityManager()
                    .createNamedQuery("getProductById").setParameter("id", id).getSingleResult();

        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return null;
    }

    @Override
    public MediProductEntity getDistributorDtoByProductName(String product_name) {
        return (MediProductEntity)factory.createEntityManager().
                createQuery("select d from MediProductEntity d where d.product_name = : product_name").
                 setParameter("product_name",product_name).getSingleResult();
    }

    @Override
    public List<MediEntity> getAllCustomers() {
        return factory.createEntityManager().createNamedQuery("getAllCustomers").getResultList();
    }

    @Override
    public int getStockByProduct(String product_name) {
        return (Integer) factory.createEntityManager().
                createQuery("SELECT d.quantity FROM MediProductEntity d WHERE d.product_name = :productName").
                setParameter("productName",product_name).getSingleResult();
    }

    @Override
    public MediEntity getUserByCustomerName(String contact_person) {
        return (MediEntity) factory.createEntityManager().
                createQuery("select u FROM MediEntity u WHERE u.contact_person = :contactPerson").
                setParameter("contactPerson",contact_person).getSingleResult();
    }

    @Override
    public List<MediEntity> getPersonsByBn(String bn) {
        System.out.println("Repo started");
        return factory.createEntityManager().createNamedQuery("getPersonsByBn").setParameter("bn",bn).getResultList();
    }
}
