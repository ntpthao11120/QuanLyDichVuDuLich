/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.User;
import com.ntpt.repository.UserRepository;
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
public class UserRepositoryImplementation implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public boolean addUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(user);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }
    
    @Override
    public boolean updateUser(User user, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        User u = this.getUserById(id);
        try{
            if(user.getFileUser().isEmpty() == false){
                Map r = this.cloudinary.uploader().upload(user.getFileUser().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setImage((String) r.get("secure_url"));
                u.setImage(user.getImage());
            }
            u.setFirstName(user.getFirstName());
            u.setLastName(user.getLastName());
            u.setPhone(user.getPhone());
            u.setEmail(user.getEmail());
            u.setAddress(user.getAddress());
            u.setUsername(user.getUsername());
            u.setPassword(user.getPassword());
            session.save(u);
            return true;
        }catch(Exception ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        
        if(!username.isEmpty()){
            Predicate user = builder.like(root.get("username").as(String.class), 
                    String.format("%%%s%%", username));
            
            query = query.where(user);
        }
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<User> getUserRole(String userRole, String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        
        if(!userRole.isEmpty() ||(kw != null && !kw.isEmpty()) ){
            Predicate firstName = builder.like(root.get("firstName").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate lastName = builder.like(root.get("lastName").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate phone = builder.like(root.get("phone").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate email = builder.like(root.get("email").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate user = builder.like(root.get("username").as(String.class), 
                    String.format("%%%s%%", kw));
            Predicate p = builder.equal(root.get("userRole").as(String.class), userRole.trim());
            
            Predicate condition = builder.and(p, builder.or(firstName, lastName, phone, email, user));
            
            query = query.where(condition);
        }        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(User.class, id);
    }
    
    

    @Override
    public boolean deleteUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(user);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public User getIdByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        
        if(!username.isEmpty()){
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }
        
        Query q = session.createQuery(query);
        return (User) q.getSingleResult();
    }
    
}
