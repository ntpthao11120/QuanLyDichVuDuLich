/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.Utils.Utils;
import com.ntpt.pojos.Car;
import com.ntpt.pojos.OrderCar;
import com.ntpt.pojos.User;
import com.ntpt.service.CarService;
import com.ntpt.service.OrderCarService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ntpth
 */
@RestController
public class ApiOrderCarController {
    @Autowired
    private CarService carService;
    @Autowired
    private OrderCarService orderCarService;
    
    @PutMapping("/api/car-order")
    @ResponseStatus(HttpStatus.OK)
    public Long updateDate(@RequestBody Map<String, String> param){
        int carId = Integer.parseInt(param.get("carId"));
        Long dateNum = Long.parseLong(param.get("dateNum"));
        Car car = this.carService.getCarById(carId);
        OrderCar o =  new OrderCar();
        o.setCarId(car);
        o.setDateNum(dateNum);
        
        return Utils.Stats(car, dateNum);
    }
    
    @PostMapping(path = "/api/addReceipt", produces = {
        MediaType.APPLICATION_JSON_VALUE
    }) 
    public ResponseEntity<OrderCar> addReceipt(@RequestBody Map<String, String> params, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            try{           
                int carId = Integer.parseInt(params.get("carId"));
                Car car = this.carService.getCarById(carId);
                Long dateNum = Long.parseLong(params.get("dateNum"));
                Long amount = Utils.Stats(car, dateNum);
                Date dateRent = new SimpleDateFormat("MM/dd/yyyy").parse(params.get("dateRent"));
                
                OrderCar o = this.orderCarService.addReceipt(dateNum, dateRent, amount, carId, u);

                return new ResponseEntity<>(o, HttpStatus.CREATED);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
                
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/addReceipt/money", produces = {
        MediaType.APPLICATION_JSON_VALUE
    }) 
    public ResponseEntity<OrderCar> addReceiptMoney(@RequestBody Map<String, String> params, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            try{           
                int carId = Integer.parseInt(params.get("carId"));
                Car car = this.carService.getCarById(carId);
                Long dateNum = Long.parseLong(params.get("dateNum"));
                Long amount = Utils.Stats(car, dateNum);
                Date dateRent = new SimpleDateFormat("MM/dd/yyyy").parse(params.get("dateRent"));
                
                OrderCar o = this.orderCarService.addReceiptMoney(dateNum, dateRent, amount, carId, u);

                return new ResponseEntity<>(o, HttpStatus.CREATED);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
                
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
