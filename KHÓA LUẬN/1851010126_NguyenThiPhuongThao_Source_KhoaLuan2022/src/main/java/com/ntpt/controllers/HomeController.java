/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.Category;
import com.ntpt.pojos.Order;
import com.ntpt.pojos.Tour;
import com.ntpt.pojos.User;
import com.ntpt.repository.TourRepository;
import com.ntpt.service.CategoryCarService;
import com.ntpt.service.CategoryService;
import com.ntpt.service.NewsService;
import com.ntpt.service.TourService;
import com.ntpt.service.UserService;
import java.security.Principal;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ntpth
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private TourService tourService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private CategoryCarService categoryCarService;

     @RequestMapping(value = "/")
    public String index(Model model,
            @RequestParam(required = false, defaultValue = "") Map<String, String> params) { 
        int page = Integer.parseInt(params.getOrDefault("page", "1")) ;
        String cateId = params.get("CateId");
        if(cateId == null){
            model.addAttribute("tours", this.tourService.getTours(params.get("kw"), page));//đưa xuống đưa lên
        }
        else{
            Category c = this.categoryService.getCategoryById(Integer.parseInt(cateId));
            model.addAttribute("tours", c.getTours());
        }
        model.addAttribute("counter", this.tourService.countTour());// đưa lên
        model.addAttribute("hotTours1", this.tourService.getHotTours1(3));
        model.addAttribute("hotTours2", this.tourService.getHotTours2(2));
        return "index";
    }
    
    @RequestMapping(value = "/hottour")
    public String hottour(Model model) { 
        model.addAttribute("hottours", this.tourService.getHotTours1(6));
        return "hottour";
    }
    
    @RequestMapping(value = "/chat")
    public String cart(Model model){
        return "chat";
    }
    
    @ModelAttribute
    public void commonAttr(Model model, HttpSession session){
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("latestNews", this.newsService.getLatestNews(5));
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("cateCar", this.categoryCarService.getCategoryCar());
    }
    
    @RequestMapping("/tour/{tourId}")
    public String tourDetail(Model model,@PathVariable(value = "tourId") int tourId){
        model.addAttribute("tour", this.tourService.getTourById(tourId));
        model.addAttribute("order", new Order());
        model.addAttribute("hotTours1", this.tourService.getHotTours1(3));
        model.addAttribute("hotTours2", this.tourService.getHotTours2(2));
        return "tourdetail";
    }  
     @RequestMapping(path ="/dattour/{tourId}", method = RequestMethod.POST)
    public String DatTour(Model model, @ModelAttribute(value = "order") @Valid Order order,
            BindingResult result, @PathVariable(value = "tourId") int tourId , HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if(!result.hasErrors()){
             if(this.tourService.order(order, tourId, u))
                return "redirect:/";
            else
                model.addAttribute("errMsg", "Bạn hãy nhập thông tin theo yêu cầu nhé");
            } 
        }
                   
        return "redirect:/tour/{tourId}";
    }  
}
