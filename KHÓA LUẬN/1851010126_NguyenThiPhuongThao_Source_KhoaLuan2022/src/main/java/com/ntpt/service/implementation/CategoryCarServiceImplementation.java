/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.ntpt.pojos.Category;
import com.ntpt.pojos.CategoryCar;
import com.ntpt.repository.CategoryCarRepository;
import com.ntpt.service.CategoryCarService;
import com.ntpt.service.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class CategoryCarServiceImplementation implements CategoryCarService{
    @Autowired
    private CategoryCarRepository cateRepository;

    @Override
    public List<CategoryCar> getCategoryCar() {
        return this.cateRepository.getCategoryCar();
    }

    @Override
    public CategoryCar getCateById(int id) {
        return this.cateRepository.getCateById(id);
    }


    
}
