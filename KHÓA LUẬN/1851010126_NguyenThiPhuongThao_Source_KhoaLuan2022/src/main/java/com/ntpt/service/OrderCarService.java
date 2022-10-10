/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import com.ntpt.pojos.OrderCar;
import com.ntpt.pojos.User;
import java.util.Date;

/**
 *
 * @author ntpth
 */
public interface OrderCarService {
    OrderCar addReceiptMoney(Long dateNum, Date dateRent, Long amount, int carId, User creator);
    OrderCar addReceipt(Long dateNum, Date dateRent, Long amount, int carId, User creator);
    boolean updateOrder(int id);
    OrderCar getOrderById(int id);
}
