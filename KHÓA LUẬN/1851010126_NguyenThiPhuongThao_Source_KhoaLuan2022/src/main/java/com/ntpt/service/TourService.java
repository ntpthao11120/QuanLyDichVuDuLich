/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import com.ntpt.pojos.Order;
import com.ntpt.pojos.Tour;
import com.ntpt.pojos.User;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface TourService {
    List<Tour> getTours(String kw, int page);
    long countTour();
    boolean addOrUpdate(Tour tour);Tour getTourById(int tourId);
    boolean deleteTour(int tourId);
    boolean updateTour(Tour tour, int tourid);
    List<Object[]> getHotTours1(int num);
    List<Object[]> getHotTours2(int num);
    boolean order(Order order, int tourid, User creator);
}
