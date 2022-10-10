/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.News;
import com.ntpt.pojos.User;
import com.ntpt.service.CommentService;
import com.ntpt.service.NewsService;
import com.ntpt.service.UserService;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ntpth
 */
@Controller
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    
    @GetMapping("/news-manage")
    public String getNews(Model model, @RequestParam(required = false, defaultValue = "") Map<String, String> params){
        int page = Integer.parseInt(params.getOrDefault("page", "1")) ;
        model.addAttribute("news", this.newsService.getNews(params.get("kw"), page));
        
        model.addAttribute("countNews", this.newsService.countNews());
        return "news-manage";
    }
    
    @GetMapping("/news/{newsId}")
    public String getNewsView(Model model, @PathVariable (value = "newsId") int newsId){
        model.addAttribute("news", this.newsService.getNewsById(newsId));
        model.addAttribute("comment", this.commentService.getReply(newsId));
        return "news";
    }
    
    @GetMapping("/news-view")
    public String getNewsList(Model model, @RequestParam(required = false, defaultValue = "") Map<String, String> params){
        int page = Integer.parseInt(params.getOrDefault("page", "1")) ;
        model.addAttribute("news", this.newsService.getNews("", page));
        
        model.addAttribute("countNews", this.newsService.countNews());
        return "news-view";
    }
    
    @GetMapping("/news-detail")
    public String create(Model model){
        model.addAttribute("newsdetail", new News());
        return "news-detail";
    }
    
    @GetMapping("/news-agg")
    public String agg(){
        return "redirect:/news-manage";
    }
    
    @GetMapping("/news-update/{newsId}")
    public String getNewsId(Model model, @PathVariable (value = "newsId") int newsId){
        model.addAttribute("newsupdate", this.newsService.getNewsById(newsId));
        return "news-update";
    }
    
    @PostMapping("/news-update/{newsId}")
    public String updateNews(Model model, @ModelAttribute(value = "newsupdate") @Valid News news, BindingResult result,
          Principal principal, HttpSession session, 
        @PathVariable (required = false, value = "") int newsId){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if (result.hasErrors()) 
                return "news-update"; 
            this.newsService.updateNews(news, newsId);
        }
        return "redirect:/news-manage";
    }
    
    @PostMapping("/news-detail")
    public String addNews(Model model, @ModelAttribute(value = "newsdetail") @Valid News news, BindingResult result,
            Principal principal, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if (result.hasErrors()) 
                return "news-detail";        
            String currentUser = principal.getName();
            news.setCreatedBy(currentUser);
            news.setUser(this.userService.getIdByUsername(currentUser));
            this.newsService.addNews(news); 
        }
        return "redirect:/news-manage";
    }
}
