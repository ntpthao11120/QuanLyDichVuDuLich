/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.ntpt.repository.StatsRepository;
import com.ntpt.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class StatsServiceImplementation implements StatsService{
    @Autowired
    private StatsRepository statsRepository;

    @Override
    public List<Object[]> carStats() {
        return this.statsRepository.carStats();
    }

    @Override
    public List<Object[]> saleStats(String kw, Date fromDate, Date toDate) {
        return this.statsRepository.saleStats(kw, fromDate, toDate);
    }

    @Override
    public List<Object[]> saleMonthStats(String string, Date date, Date date1) {
        return this.statsRepository.saleMonthStats(string, date, date1);
    }

    @Override
    public List<Object[]> payStats(Date fromDate, Date toDate) {
        return this.statsRepository.payStats(fromDate, toDate);
    }
    
}
