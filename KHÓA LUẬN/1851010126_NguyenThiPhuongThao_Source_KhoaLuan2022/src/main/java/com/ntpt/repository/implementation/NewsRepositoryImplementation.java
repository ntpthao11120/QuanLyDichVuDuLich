/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.News;
import com.ntpt.repository.NewsRepository;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class NewsRepositoryImplementation implements NewsRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<News> getNews(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<News> query = builder.createQuery(News.class);
        Root root = query.from(News.class);
        query = query.select(root);
        
        if(kw != null){
            Predicate p = builder.like(root.get("title").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = session.createQuery(query); 
        
        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public boolean addNews(News news) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(news);       
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==ADD NEWS ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean updateNews(News news, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        News n = this.getNewsById(id);
        try{
            if(news.getFile().isEmpty() == false){
                Map r = this.cloudinary.uploader().upload(news.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
                news.setFeatureImg((String) r.get("secure_url"));
                n.setFeatureImg(news.getFeatureImg());
            }
            n.setTitle(news.getTitle());
            n.setDescription(news.getDescription());
            n.setModifiedDate(new Timestamp(System.currentTimeMillis()));
            session.save(n);
            return true;
        }catch(Exception ex){
            session.clear();
        }
        
        return false;

    }

    @Override
    public boolean delNews(News news) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(news);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public News getNewsById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(News.class, id);
    }

    @Override
    public List<Object[]> getLatestNews(int num) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(News.class);
        
        query.multiselect(root.get("id"), root.get("title"), root.get("createdDate"));
        query = query.orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        q.setMaxResults(num);
        return q.getResultList();
        
    }

    @Override
    public long countNews() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("SELECT COUNT(*) FROM News");
        
        return Long.parseLong(q.getSingleResult().toString()) ;
    }
    
}
