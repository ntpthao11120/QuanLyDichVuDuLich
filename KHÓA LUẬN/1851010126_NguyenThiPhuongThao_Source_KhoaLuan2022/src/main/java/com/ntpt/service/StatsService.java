/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface StatsService {
    List<Object[]> carStats();
    List<Object[]> saleStats(String kw, Date fromDate, Date toDate);
    List<Object[]> saleMonthStats(String kw, Date fromDate, Date toDate);
    List<Object[]> payStats(Date fromDate, Date toDate);
}
