/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.Car;
import com.ntpt.pojos.CategoryCar;
import com.ntpt.pojos.OrderCar;
import com.ntpt.repository.StatsRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class StatsRepositoryImplementation implements StatsRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> carStats() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = builder.createQuery(Object[].class);
        
        Root rootCar = q.from(Car.class);
        Root rootCate = q.from(CategoryCar.class);
        
        q.where(builder.equal(rootCar.get("category"), rootCate.get("id")));
        
        q.multiselect(rootCate.get("id"), rootCate.get("name"), builder.count(rootCar.get("id")));
        
        q.groupBy(rootCate.get("id"));
        
        Query query = session.createQuery(q);
        
        return query.getResultList();
    }
    
     @Override
    public List<Object[]> payStats( Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = builder.createQuery(Object[].class);        
        Root rootO = q.from(OrderCar.class);
        
        Predicate from, to, money, paypal, condition1;

        if(fromDate != null || toDate != null){
            from = (builder.lessThanOrEqualTo(rootO.get("createDate"), fromDate));
            to = (builder.lessThanOrEqualTo(rootO.get("createDate"), toDate));
            condition1 = builder.or(from, to);
            q = q.where(condition1);
        }
        money = builder.like(rootO.get("status").as(String.class), 
                    String.format("%%%s%%", "Thanh toán tiền mặt"));
        paypal = builder.like(rootO.get("status").as(String.class), 
                    String.format("%%%s%%", "Thanh toán Paypal"));
        
        Predicate condition = builder.or(money, paypal);
        q = q.where(condition);
        
        q.select(rootO);
        Query query = session.createQuery(q);
        
        return query.getResultList();
    }

    @Override
    public List<Object[]> saleStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = builder.createQuery(Object[].class);
        
        Root rootCar = q.from(Car.class);
        Root rootO = q.from(OrderCar.class);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootO.get("carId"), rootCar.get("id")));
        
        q.multiselect(rootCar.get("id"), rootCar.get("name"), builder.sum(rootO.get("amount")));
        
        if(kw != null && !kw.isEmpty())
            predicates.add(builder.like(rootCar.get("name"), String.format("%%%s%%", kw)));
        
        if(fromDate != null)
            predicates.add(builder.greaterThanOrEqualTo(rootO.get("createDate"), fromDate));
        
        if(toDate != null){
            predicates.add(builder.lessThanOrEqualTo(rootO.get("createDate"), toDate));
        }
        
        q.where(predicates.toArray(new Predicate[] {}));
        
        q.groupBy(rootCar.get("id"));
        
        Query query = session.createQuery(q);
        
        return query.getResultList();
    }

    @Override
    public List<Object[]> saleMonthStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = builder.createQuery(Object[].class);
        
        Root rootCar = q.from(Car.class);
        Root rootO = q.from(OrderCar.class);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootO.get("carId"), rootCar.get("id")));
        
        q.multiselect(builder.function("MONTH", Integer.class, rootO.get("createDate")),
                builder.function("YEAR", Integer.class, rootO.get("createDate"))
                ,builder.sum(rootO.get("amount")));
        
        if(kw != null && !kw.isEmpty())
            predicates.add(builder.like(rootCar.get("name"), String.format("%%%s%%", kw)));
        
        if(fromDate != null)
            predicates.add(builder.greaterThanOrEqualTo(rootO.get("createDate"), fromDate));
        
        if(toDate != null){
            predicates.add(builder.lessThanOrEqualTo(rootO.get("createDate"), toDate));
        }
        
        q.where(predicates.toArray(new Predicate[] {}));
        
        q.groupBy(builder.function("MONTH", Integer.class, rootO.get("createDate")),
                builder.function("YEAR", Integer.class, rootO.get("createDate")));
        
        Query query = session.createQuery(q);
        
        return query.getResultList();
    }

   

    
}
