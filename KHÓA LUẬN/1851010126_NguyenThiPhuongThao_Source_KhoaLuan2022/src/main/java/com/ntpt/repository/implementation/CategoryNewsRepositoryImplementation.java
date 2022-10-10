/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.CategoryNews;
import com.ntpt.repository.CategoryNewsRepository;
import java.util.List;
import javax.persistence.Query;
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
public class CategoryNewsRepositoryImplementation implements CategoryNewsRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private CategoryNewsRepository cateNewsRepository;

    @Override
    public List<CategoryNews> getCategoryNews() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From CategoryNews");
        
        return q.getResultList();
    }

    @Override
    public CategoryNews getCategoryNewsById(int id) {
        Session s = sessionFactory.getObject().getCurrentSession();
        return s.get(CategoryNews.class, id);
    }

    @Override
    public boolean addCategoryNews(CategoryNews cateNews) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(cateNews);           
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==ADD Category News ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean updateCategoryNews(CategoryNews cateNews, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CategoryNews c = this.getCategoryNewsById(id);
        try{
            c.setName(cateNews.getName());
            c.setUrl(cateNews.getUrl());
            session.save(c);            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==UPDATE CATEGORY NEWS ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCategoryNews(CategoryNews cateNews) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(cateNews);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }
    
}
