/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.pojos;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author XuXu
 */
@Entity
@Table(name = "order1")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "created_day")
    private Date createdDay;
    @Column(name = "adult_quantity")
    @Min(value = 1, message = "{order.adult.notNull}")
    private Integer adultQuantity;
    @Column(name = "child_quantity")
    private Integer childQuantity;
    private BigDecimal total;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id")
    private Tour tour;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;
    /**
     * @return the createdDay
     */
    public Date getCreatedDay() {
        return createdDay;
    }

    /**
     * @param createdDay the createdDay to set
     */
    public void setCreatedDay(Date createdDay) {
        this.createdDay = createdDay;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the tour
     */
    public Tour getTour() {
        return tour;
    }

    /**
     * @param tour the tour to set
     */
    public void setTour(Tour tour) {
        this.tour = tour;
    }

    /**
     * @return the total
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the adultQuantity
     */
    public Integer getAdultQuantity() {
        return adultQuantity;
    }

    /**
     * @param adultQuantity the adultQuantity to set
     */
    public void setAdultQuantity(Integer adultQuantity) {
        this.adultQuantity = adultQuantity;
    }

    /**
     * @return the childQuantity
     */
    public Integer getChildQuantity() {
        return childQuantity;
    }

    /**
     * @param childQuantity the childQuantity to set
     */
    public void setChildQuantity(Integer childQuantity) {
        this.childQuantity = childQuantity;
    }
    
}
