/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.Comment;
import com.ntpt.repository.CommentRepository;
import com.ntpt.repository.NewsRepository;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class CommentRepositoryImplementation implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private NewsRepository newsRepository;
    
    @Override
    public Comment addComment(Comment c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(c);       
            return c;
        }catch(HibernateException ex){
            session.clear();
            System.err.println("==ADD COMMENT ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public Comment getCommentById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Comment.class, id);
    }

    @Override
    public List<Comment> getReply(int newsId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root).where(builder.and(builder.isNull(root.get("parent")), builder.equal(root.get("news"), this.newsRepository.getNewsById(newsId))));
        
        Query q = session.createQuery(query);        
        return q.getResultList();
    }

    @Override
    public boolean delComment(Comment c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(c);            
            return true;
        }catch(HibernateException ex) {
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public Comment updateComment(String content, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Comment cmt = this.getCommentById(id);
        try{
            cmt.setContent(content);
            cmt.setModifiedDate(new Timestamp(System.currentTimeMillis()));
            session.save(cmt);            
            return cmt;
        }catch(Exception ex){
            session.clear();
            System.err.println(ex.getMessage());
        }
        
        return null;
    }
    
}
