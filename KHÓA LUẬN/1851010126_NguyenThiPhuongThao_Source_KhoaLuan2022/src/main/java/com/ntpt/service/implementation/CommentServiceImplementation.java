/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.ntpt.pojos.Comment;
import com.ntpt.pojos.News;
import com.ntpt.pojos.User;
import com.ntpt.repository.CommentRepository;
import com.ntpt.repository.NewsRepository;
import com.ntpt.repository.UserRepository;
import com.ntpt.service.CommentService;
import java.sql.Timestamp;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class CommentServiceImplementation implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private NewsRepository newsRepository;

    @Override
    public Comment addComment(String content, int newsId, User creator) {
        News n = this.newsRepository.getNewsById(newsId);
        
        Comment c = new Comment();
        c.setContent(content);
        c.setNews(n);
        c.setUserId(creator);
        c.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        
        return this.commentRepository.addComment(c);
    }

    @Override
    public Comment addReply(String content, int newsId, User creator, int parentId) {
        News n = this.newsRepository.getNewsById(newsId);
        Comment p = this.commentRepository.getCommentById(parentId);
        
        Comment c = new Comment();
        c.setContent(content);
        c.setNews(n);
        c.setUserId(creator);
        c.setParent(p);
        c.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        
        return this.commentRepository.addComment(c);
    }

    @Override
    public Comment getCommentById(int i) {
        return this.commentRepository.getCommentById(i);
    }

    @Override
    public List<Comment> getReply(int newsId) {
        return this.commentRepository.getReply(newsId);
    }

    @Override
    public boolean delComment(Comment cmnt) {
        return this.commentRepository.delComment(cmnt);
    }

    @Override
    public Comment updateComment(String content, int id) {
        return this.commentRepository.updateComment(content, id);
    }

    
}
