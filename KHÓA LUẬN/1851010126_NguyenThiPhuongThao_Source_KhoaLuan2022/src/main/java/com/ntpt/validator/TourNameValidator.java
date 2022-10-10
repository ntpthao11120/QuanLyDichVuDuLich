/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.validator;

import com.ntpt.pojos.Tour;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author ntpth
 */
@Component
public class TourNameValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return Tour.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tour t = (Tour) o;
        if(!t.getName().contains("Tour")){
            errors.rejectValue("name", "tour.name.err");
        }
    }
    
}
