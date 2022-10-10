///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ntpt.service.implementation;
//
//import com.ntpt.pojos.News;
//import com.ntpt.repository.ScraperRepository;
//import com.ntpt.service.ScraperService;
//import java.util.List;
//import javax.persistence.EntityManager;
//import javax.transaction.Transactional;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Service;
//
///**
// *
// * @author ntpth
// */
//@Service
//@Transactional
//public class ScraperServiceImplementation implements ScraperService{
//    private final EntityManager entityManager;
//    private final ScraperRepository scraperRepository;
//
//    /**
//     * Instantiates a new Entity service.
//     *
//     * @param entityManager the entity manager
//     */
//    public ScraperServiceImplementation(final EntityManager entityManager, final ScraperRepository scraperRepository) {
//        this.entityManager = entityManager;
//        this.scraperRepository = scraperRepository;
//    }
//    
//    @Override
//    public void persistNewsData(List<News> listNews) {
//        listNews.forEach(entityManager::merge);
//    }
//
//    @Override
//    public List<News> getNewsData() {
//       return scraperRepository.getNews();
//    }
//    
//}
