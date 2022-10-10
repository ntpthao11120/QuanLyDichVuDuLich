/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.Utils.Utils;
import com.ntpt.pojos.Car;
import com.ntpt.pojos.CategoryCar;
import com.ntpt.pojos.OrderCar;
import com.ntpt.pojos.User;
import com.ntpt.service.CarService;
import com.ntpt.service.CategoryCarService;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ntpth
 */
@Controller
public class CarController {
    @Autowired
    private CarService carService;
    @Autowired
    private CategoryCarService cateCarService;
    
    @GetMapping("/car")
    private String getCar(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        String cateCarId = params.get("cateCarId");
        if(cateCarId == null){
            model.addAttribute("cars", this.carService.getCars(kw, page));
        }else{
            CategoryCar c = this.cateCarService.getCateById(Integer.parseInt(cateCarId));
            model.addAttribute("cars", c.getCars());
        }
        
        
        return "car";
    }
    
    @GetMapping("/car-detail/{carId}")
    private String carDetail(Model model, @PathVariable(value = "carId") int carId){
        model.addAttribute("car", this.carService.getCarById(carId));
        return "car-detail";
    }
    
    @GetMapping("/car-order/{carId}")
    private String carOrder(Model model, @PathVariable(value = "carId") int carId,
            @RequestParam(required = false) Map<String, String> params){
        
        Long dateNum = Long.parseLong(params.getOrDefault("dateNum", "1"));
        model.addAttribute("carOrder", this.carService.getCarById(carId));
        model.addAttribute("stats", Utils.Stats(this.carService.getCarById(carId), dateNum));
        return "car-order";
    }
    
    @GetMapping("/car-manage")
    public String getCars(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        String cateCarId = params.get("cateCarId");
        if(cateCarId == null){
            model.addAttribute("carManage", this.carService.getCars(kw, page));
        }else{
            CategoryCar c = this.cateCarService.getCateById(Integer.parseInt(cateCarId));
            model.addAttribute("carManage", c.getCars());
        }
        model.addAttribute("countCar", this.carService.countCar());
        return "car-manage";
    }
    
    @GetMapping("/car-add")
    public String addCar(Model model){
        model.addAttribute("carDetail", new Car());
        return "car-add";
    }
    
    @GetMapping("/car-add/{carId}")
    public String getCarId( Model model, @PathVariable (value = "carId") int carId){
       model.addAttribute("carDetail", this.carService.getCarById(carId));
       return "car-add";
    }
    
    @PostMapping("/car-add/{carId}")
    public String carDetail(Model model, @ModelAttribute(value = "carDetail") @Valid Car car, BindingResult result,
             HttpSession session, @PathVariable (required = false, value = "") int carId){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if(result.hasErrors()){
                return "car-add";
            }
            if(carId != 0){
                this.carService.updateCar(car, carId);
            }else{
                this.carService.addCar(car);
            }
        }
                    
        return "redirect:/car-manage";
    }
}
