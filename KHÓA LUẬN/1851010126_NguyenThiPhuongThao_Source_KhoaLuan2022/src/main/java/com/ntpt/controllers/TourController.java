/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.Category;
import com.ntpt.pojos.Order;
import com.ntpt.pojos.Tour;
import com.ntpt.repository.TourRepository;
import com.ntpt.service.CategoryService;
import com.ntpt.service.TourService;
import com.ntpt.validator.TourNameValidator;
import com.ntpt.validator.WebAppValidator;
import java.util.Date;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ntpth
 */
@Controller
//@RestController
//@CrossOrigin(origins="http://localhost:3000")
public class TourController {
    @Autowired
    private TourService tourService;
    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private WebAppValidator tourValidator;

    @Autowired
    private LocalValidatorFactoryBean validator;
    @Autowired
    private CategoryService categoryService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(tourValidator);

    }
    @GetMapping("/admin/addtour")
    public String list(Model model){
        model.addAttribute("tour", new Tour());
        return "addtour";
    }
    
    @PostMapping("/admin/addtour")
    public String add(Model model, @ModelAttribute(value = "tour") @Valid Tour tour,
            BindingResult result){
        if(!result.hasErrors()){
            if(this.tourService.addOrUpdate(tour))
                return "redirect:/quanlytour";
            else
                model.addAttribute("errMsg", "Đã có lỗi!!");
        }            
        return "quanlytour";    
    }
    
     @RequestMapping(value = "/quanlytour")
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
        return "quanlytour";
    }
    @RequestMapping("/admin/delete/{tourId}")
    public String delete(Model model,@PathVariable(value = "tourId") int tourId){
            if(this.tourService.deleteTour(tourId))
                return "redirect:/quanlytour";
            else
                model.addAttribute("errMsg", "Đã có lỗi!!");
                    
        return "quanlytour";    
    }
    @GetMapping("/admin/updatetour/{tourId}")
    public String update(Model model,@PathVariable(value = "tourId") int tourId){
        model.addAttribute("tour", this.tourService.getTourById(tourId));
        model.addAttribute("tourid",tourId);//!
        return "updatetour";
    }
    @RequestMapping(path = "/admin/updatetour/{tourId}", method = RequestMethod.POST)
    public String update(Model model, @ModelAttribute(value = "tour") @Valid Tour tour,
            @PathVariable(value = "tourId") int tourId,
            BindingResult result){
        if(!result.hasErrors()){
            if(this.tourService.updateTour(tour, tourId))
                return "redirect:/quanlytour";
            else
                model.addAttribute("errMsg", "Đã có lỗi!!");
        }            
        return "updatetour";    
        //model.addAttribute("id",tour.getId());
        //return "updatetour";
    }
   
}
