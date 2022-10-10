/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.Order;
import com.ntpt.pojos.Tour;
import com.ntpt.pojos.User;
import com.ntpt.repository.TourRepository;
import com.ntpt.service.TourService;
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
public class TourServiceImplementation implements TourService {
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private TourRepository tourRepository;

    @Override
    public List<Tour> getTours(String kw, int page) {
        return this.tourRepository.getTours(kw, page);
    }

    @Override
    public boolean addOrUpdate(Tour tour) {
        try {
            Map r = this.cloudinary.uploader().upload(tour.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage((String) r.get("secure_url"));
            Map r1 = this.cloudinary.uploader().upload(tour.getFile1().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage1((String) r1.get("secure_url"));
            Map r2 = this.cloudinary.uploader().upload(tour.getFile2().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage2((String) r2.get("secure_url"));
            Map r3 = this.cloudinary.uploader().upload(tour.getFile3().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage3((String) r3.get("secure_url"));
            Map r4 = this.cloudinary.uploader().upload(tour.getFile4().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage4((String) r4.get("secure_url"));
            Map r5 = this.cloudinary.uploader().upload(tour.getFile5().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            tour.setImage5((String) r5.get("secure_url"));
            return this.tourRepository.addOrUpdate(tour);
        } catch (IOException ex) {
            System.err.println("==ADD TOUR==" + ex.getMessage());
        }
        
        return false;
    }

    @Override
    public long countTour() {
        return this.tourRepository.countTour();
    }
@Override
    public Tour getTourById(int tourId) {
        return this.tourRepository.getTourById(tourId);
    }

    @Override
    public boolean deleteTour(int tourId) {
        return this.tourRepository.deleteTour(tourId);
    }

    @Override
    public boolean updateTour(Tour tour, int tourid) {       
        return this.tourRepository.updateTour(tour, tourid);
    }

    @Override
    public boolean order(Order order, int tourid, User creator) {
     return this.tourRepository.order(order, tourid, creator);
    }

    @Override
    public List<Object[]> getHotTours1(int num) {
        return this.tourRepository.getHotTours1(num);
    }
    @Override
    public List<Object[]> getHotTours2(int num) {
        return this.tourRepository.getHotTours2(num);
    }

}
