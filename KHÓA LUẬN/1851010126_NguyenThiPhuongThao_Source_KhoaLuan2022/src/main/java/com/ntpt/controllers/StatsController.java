/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.service.StatsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ntpth
 */
@Controller
@RequestMapping("/stats")
public class StatsController {
    @Autowired
    private StatsService statsService;
    
    @GetMapping("/car-stats")
    public String carStats(Model model){
        model.addAttribute("carStats", this.statsService.carStats());
        return "car-stats";
    }
    
    @GetMapping("/car-sale-stats")
    public String saleCarStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null, toDate = null;
        try{
            String form = params.getOrDefault("fromDate", null);
            if(form != null)
                fromDate = f.parse(form);
        
            String to = params.getOrDefault("toDate", null);
            if(to != null)
                toDate = f.parse(to);
        }catch(ParseException ex){
            ex.printStackTrace();
        }
        
        
        model.addAttribute("saleStats", this.statsService.saleStats(kw, fromDate, toDate));
        return "car-sale-stats";
    }
    
    @GetMapping("/car-month-stats")
    public String saleCarMonthStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null, toDate = null;
        try{
            String form = params.getOrDefault("fromDate", null);
            if(form != null)
                fromDate = f.parse(form);
        
            String to = params.getOrDefault("toDate", null);
            if(to != null)
                toDate = f.parse(to);
        }catch(ParseException ex){
            ex.printStackTrace();
        }
        
        
        model.addAttribute("saleMonthStats", this.statsService.saleMonthStats(kw, fromDate, toDate));
        return "car-month-stats";
    }
    
    @GetMapping("/pay-stats")
    public String payStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null, toDate = null;
        try{
            String form = params.getOrDefault("fromDate", null);
            if(form != null)
                fromDate = f.parse(form);
        
            String to = params.getOrDefault("toDate", null);
            if(to != null)
                toDate = f.parse(to);
        }catch(ParseException ex){
            ex.printStackTrace();
        }
        
        
        model.addAttribute("payStats", this.statsService.payStats(fromDate, toDate));
        return "pay-stats";
    }
}
