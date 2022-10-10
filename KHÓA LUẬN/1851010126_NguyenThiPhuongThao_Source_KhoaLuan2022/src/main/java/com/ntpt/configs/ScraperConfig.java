///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ntpt.configs;
//
//import com.ntpt.pojos.News;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//import org.springframework.stereotype.Component;
//
//
//
///**
// *
// * @author ntpth
// */
//@Component
//public class ScraperConfig {
//    public List<News> getNewsData() throws IOException{
//        final List<News> newsList = new ArrayList<>();
//        final Document doc = Jsoup.connect("https://vnexpress.net/du-lich/diem-den").get();
//        final Elements rows = doc.select("#automation_TV0 > div.width_common.list-news-subfolder.has-border-right");
//        for(final Element row : rows){
//            final Iterator<Element> title = row.select("article").iterator();
//            if(title.hasNext()){
//                final News news = new News();
//                final Elements t = row.select("h2 > a");
//                news.setTitle(t.text());
//                newsList.add(news);
//            }           
//        }
//        return newsList;
//    }
//}
