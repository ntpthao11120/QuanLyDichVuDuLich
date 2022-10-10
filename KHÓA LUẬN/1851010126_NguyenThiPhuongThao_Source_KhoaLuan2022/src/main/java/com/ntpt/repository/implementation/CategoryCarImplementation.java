/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.CategoryCar;
import com.ntpt.repository.CategoryCarRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ntpth
 */
@Repository
@Transactional
public class CategoryCarImplementation implements CategoryCarRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<CategoryCar> getCategoryCar() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From CategoryCar");
        
        return q.getResultList();
    }

    @Override
    public CategoryCar getCateById(int id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        return s.get(CategoryCar.class, id);
    }
    
}
