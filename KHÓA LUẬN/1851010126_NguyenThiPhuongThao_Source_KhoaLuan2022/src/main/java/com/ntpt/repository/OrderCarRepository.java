/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository;

import com.ntpt.pojos.OrderCar;

/**
 *
 * @author ntpth
 */
public interface OrderCarRepository {
    OrderCar addReceipt(OrderCar order);
    boolean updateOrder(int id);
    OrderCar getOrderById(int id);
}
