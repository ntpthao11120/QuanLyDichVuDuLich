/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.ntpt.pojos.Car;
import com.ntpt.pojos.OrderCar;
import com.ntpt.pojos.User;
import com.ntpt.repository.CarRepository;
import com.ntpt.repository.OrderCarRepository;
import com.ntpt.service.OrderCarService;
import java.sql.Timestamp;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class OrderCarServiceImplementation implements OrderCarService{
    @Autowired
    private OrderCarRepository orderCarRepository;
    @Autowired
    private CarRepository carRepository;

    @Override
    public OrderCar addReceipt(Long dateNum, Date dateRent, Long amount, int carId, User creator) {
        Car car = this.carRepository.getCarById(carId);
        
        OrderCar order = new OrderCar();
        order.setDateNum(dateNum);
        order.setDateRent(dateRent);
        order.setAmount(amount);
        order.setCarId(car);
        order.setUser(creator);
        order.setCreateDate(new Timestamp(System.currentTimeMillis()));
        
        return this.orderCarRepository.addReceipt(order);
    }

    @Override
    public boolean updateOrder(int i) {
        return this.orderCarRepository.updateOrder(i);
    }

    @Override
    public OrderCar getOrderById(int i) {
        return this.orderCarRepository.getOrderById(i);
    }

    @Override
    public OrderCar addReceiptMoney(Long dateNum, Date dateRent, Long amount, int carId, User creator) {
        Car car = this.carRepository.getCarById(carId);
        
        OrderCar order = new OrderCar();
        order.setDateNum(dateNum);
        order.setDateRent(dateRent);
        order.setAmount(amount);
        order.setCarId(car);
        order.setUser(creator);
        order.setCreateDate(new Timestamp(System.currentTimeMillis()));
        order.setStatus("Thanh toán tiền mặt");
        
        return this.orderCarRepository.addReceipt(order);
    }
    
}
