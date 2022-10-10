/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.CategoryNews;
import com.ntpt.pojos.User;
import com.ntpt.service.CategoryNewsService;
import java.security.Principal;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author ntpth
 */
@Controller
public class CategoryNewsController {
    @Autowired
    private CategoryNewsService cateNewsService;
    
    @GetMapping("/news-category")
    public String getCateNews(Model model){
        model.addAttribute("newsCate", this.cateNewsService.getCategoryNews());
        return "news-category";
    }
    
    @GetMapping("/news-category-details")
    public String createCate(Model model){
        model.addAttribute("newsCatedetail", new CategoryNews());
        return "news-category-details";
    }
    
    @PostMapping("/news-category-details")
    public String addCate(Model model, @ModelAttribute(value = "newsCatedetail") @Valid CategoryNews newsCate, BindingResult result,
            Principal principal, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if (result.hasErrors()) 
                return "news-category-details";        
            this.cateNewsService.addCategoryNews(newsCate); 
        }
        return "redirect:/news-category";
    }
    
//    @GetMapping("/news-category-update/{newsCateId}")
//    public String getCateId(Model model, @PathVariable (value = "newsCateId") int newsCateId){
//        model.addAttribute("newsCateupdate", this.cateNewsService.getCategoryNewsById(newsCateId));
//        return "news-category-update";
//    }
//    
//    @PostMapping("/news-category-update/{newsCateId}")
//    public String updateCate(Model model, @ModelAttribute(value = "newsCateupdate") @Valid CategoryNews newsCate, BindingResult result,
//          Principal principal, HttpSession session, 
//        @PathVariable (required = false, value = "") int newsCateId){
//        User u = (User) session.getAttribute("currentUser");
//        if(u != null){
//            if (result.hasErrors()) 
//                return "news-category-update"; 
//            this.cateNewsService.updateCategoryNews(newsCate, newsCateId);
//        }
//        return "redirect:/news-category";
//    }
}
