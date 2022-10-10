/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.News;
import com.ntpt.repository.NewsRepository;
import com.ntpt.service.NewsService;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class NewsServiceImplementation implements NewsService{
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<News> getNews(String kw, int page) {
        return this.newsRepository.getNews(kw, page);
    }

    @Override
    public boolean addNews(News news) {
        news.setCreatedDate(new Timestamp(System.currentTimeMillis()));        
        try {
            Map r = this.cloudinary.uploader().upload(news.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            news.setFeatureImg((String) r.get("secure_url"));
            
            return this.newsRepository.addNews(news);
        } catch (IOException ex) {
            System.err.println("==ADD NEWS==" + ex.getMessage());
        }
        
        return false;
    }

    @Override
    public boolean updateNews(News news, int id) {
            return this.newsRepository.updateNews(news, id);      
    }

    @Override
    public boolean delNews(News news) {
        return this.newsRepository.delNews(news);
    }

    @Override
    public News getNewsById(int id) {
        return this.newsRepository.getNewsById(id);
    }

    @Override
    public List<Object[]> getLatestNews(int num) {
        return this.newsRepository.getLatestNews(num);
    }

    @Override
    public long countNews() {
        return this.newsRepository.countNews();
    }
    
}
