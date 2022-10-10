/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import com.ntpt.pojos.News;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface NewsService {
    List<News> getNews(String kw, int page);
    boolean addNews(News news);
    boolean updateNews(News news, int id);
    boolean delNews(News news);
    News getNewsById(int id);
    List<Object[]> getLatestNews(int num);
    long countNews();
}
