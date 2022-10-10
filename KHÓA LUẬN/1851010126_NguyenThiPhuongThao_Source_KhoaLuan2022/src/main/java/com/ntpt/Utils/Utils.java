/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.Utils;

import com.ntpt.pojos.Car;
import com.ntpt.pojos.OrderCar;
import com.ntpt.service.CarService;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author ntpth
 */
public class Utils {
    public static Long Stats(Car carId, Long dateNum){
        Long sum = 0l;
        
        OrderCar o = new OrderCar();
        o.setCarId(carId);
        sum += o.getCarId().getPrice() * dateNum;
        
        return sum;
    }
}
