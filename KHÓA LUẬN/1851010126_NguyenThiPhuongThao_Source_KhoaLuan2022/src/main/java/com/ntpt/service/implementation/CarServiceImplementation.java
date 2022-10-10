/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.Car;
import com.ntpt.repository.CarRepository;
import com.ntpt.service.CarService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class CarServiceImplementation implements CarService{
    @Autowired
    private CarRepository carRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Car> getCars(String kw, int page) {
        return this.carRepository.getCars(kw, page);
    }

    @Override
    public Car getCarById(int id) {
        return this.carRepository.getCarById(id);
    }

    @Override
    public boolean addCar(Car car) {
        try{            
            Map r = this.cloudinary.uploader().upload(car.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            car.setImage((String) r.get("secure_url"));
            
            return this.carRepository.addCar(car);
        }catch(IOException ex){
            System.err.println("==ADD CAR==" + ex.getMessage());
        }        
        return false;
    }

    @Override
    public boolean updateCar(Car car, int id) {
        return this.carRepository.updateCar(car, id);
    }

    @Override
    public boolean deleteCar(Car car) {
        return this.carRepository.deleteCar(car);
    }

    @Override
    public long countCar() {
        return this.carRepository.countCar();
    }
    
}
