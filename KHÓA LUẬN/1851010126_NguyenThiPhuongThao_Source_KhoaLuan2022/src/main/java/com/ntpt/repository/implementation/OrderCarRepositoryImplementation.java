/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.OrderCar;
import com.ntpt.repository.OrderCarRepository;
import org.hibernate.HibernateException;
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
public class OrderCarRepositoryImplementation implements OrderCarRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public OrderCar addReceipt(OrderCar order) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(order);       
            return order;
        }catch(HibernateException ex){
            session.clear();
            System.err.println("==ADD COMMENT ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public boolean updateOrder(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        OrderCar o = this.getOrderById(id);
        try{
            o.setStatus("Thanh toán Paypal");
            session.save(o);
            return true;
        }catch(Exception ex){
            session.clear();
        }
        
        return false;
        
        
    }

    @Override
    public OrderCar getOrderById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(OrderCar.class, id);
    }
    
    
    
}
