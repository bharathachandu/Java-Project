package com.xworkz.mallapp.dao;


import com.xworkz.mallapp.dto.MallDto;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;

@Component
public class MallDaoImpl implements MallDao {

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean addShop(MallDto mallDto) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(mallDto);
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public MallDto getShopById(int id) {
        EntityManager entityManager = factory.createEntityManager();
        return entityManager.find(MallDto.class, id);
    }

    @Override
    public boolean updateShopNameById(String updatedShopName, int id) {
        boolean isUpdated = false;
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        MallDto mallDto = entityManager.find(MallDto.class, id);
        if (mallDto != null) {
            mallDto.setShopName(updatedShopName);
            entityManager.merge(mallDto);
            entityManager.getTransaction().commit();
            isUpdated = true;
        }
        return isUpdated;
    }

    @Override
    public void removeShop(int id) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        MallDto mallDto = entityManager.find(MallDto.class, id);
        if (mallDto != null) {
            entityManager.remove(mallDto);
            entityManager.getTransaction().commit();
        }
    }

    @Override
    public String getOwnerNameById(Integer id) {
        String ownerName = null;
            ownerName = (String) factory.createEntityManager()
                    .createNamedQuery("getOwnerNameById")
                    .setParameter("i", id)
                    .getSingleResult();
        return ownerName;
    }

    @Override
    public Object[] getShopNameAndLocationById(Integer id) {
        return (Object[]) factory.createEntityManager()
                .createNamedQuery("getShopNameAndLocationById")
                .setParameter("i", id)
                .getSingleResult();
    }

    @Override
    public Object[] getRevenueAndSizeByShopName(String shopName) {
        return (Object[]) factory.createEntityManager()
                .createNamedQuery("getRevenueAndSizeByShopName")
                .setParameter("name", shopName)
                .getSingleResult();
    }

    @Override
    public MallDto updateShopNameById(Integer id, String shopName) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createNamedQuery("updateShopNameById");
        query.setParameter("name", shopName);
        query.setParameter("id", id);
        int updatedCount = query.executeUpdate();
        entityManager.getTransaction().commit();
        return entityManager.find(MallDto.class, id);
    }

    @Override
    public MallDto updateRevenueById(Integer id, double revenue) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createNamedQuery("updateRevenueById");
        query.setParameter("rev", revenue);
        query.setParameter("id", id);
        int updatedCount = query.executeUpdate();
        entityManager.getTransaction().commit();
        return entityManager.find(MallDto.class, id);
    }

    @Override
    public boolean updateSizeByName(String name, double size) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createNamedQuery("updateSizeByName");
        query.setParameter("size", size);
        query.setParameter("name", name);
        int updatedCount = query.executeUpdate();
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public boolean removeShopByName(String name) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createNamedQuery("removeShopByName");
        query.setParameter("name", name);
        int updatedCount = query.executeUpdate();
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public List<MallDto> getShops() {
        return factory.createEntityManager().createNamedQuery("getShops").getResultList();
    }

    @Override
    public boolean updateShop(MallDto dto) {
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(dto);
        entityManager.getTransaction().commit();
        return true;
    }
}
