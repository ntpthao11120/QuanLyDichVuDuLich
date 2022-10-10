/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.Car;
import com.ntpt.pojos.CategoryCar;
import com.ntpt.pojos.Tour;
import com.ntpt.repository.CarRepository;
import com.ntpt.repository.CategoryCarRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class CarRepositoryImplementation implements CarRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private CategoryCarRepository cateCarRepository;

    
    @Override
    public List<Car> getCars(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Car> query = builder.createQuery(Car.class);
        Root root = query.from(Car.class);
        query = query.select(root);
        
        if(kw != null){
            Predicate p = builder.like(root.get("name").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate price = builder.like(root.get("price").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate condition = builder.or(p, price);
            
            query = query.where(condition);
            
        }
        query = query.orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        
        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public Car getCarById(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        return session.get(Car.class, id);
    }

    @Override
    public boolean addCar(Car car) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            CategoryCar  c = cateCarRepository.getCateById(car.getMaLoai());
            car.setCategory(c);
            session.save(car);
            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==ADD CAR ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean updateCar(Car car, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Car c = this.getCarById(id);
        try{
            if(car.getFile().isEmpty() == false){
                Map r = this.cloudinary.uploader().upload(car.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                car.setImage((String) r.get("secure_url"));
                c.setImage(car.getImage());
            }
            c.setName(car.getName());
            c.setDescription(car.getDescription());
            c.setPrice(car.getPrice());
            CategoryCar cate = cateCarRepository.getCateById(car.getMaLoai());
            car.setCategory(cate);
            c.setCategory(car.getCategory());
            session.save(c);            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==UPDATE CAR ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCar(Car car) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(car);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public long countCar() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("SELECT COUNT(*) FROM Car");
        
        return Long.parseLong(q.getSingleResult().toString()) ;
    }
    
}
