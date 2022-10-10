/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository;

import com.ntpt.pojos.Car;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface CarRepository {
    List<Car> getCars(String kw, int page);
    Car getCarById(int id);
    boolean addCar(Car car);
    boolean updateCar(Car car, int id);
    boolean deleteCar(Car car);
    long countCar();
}
