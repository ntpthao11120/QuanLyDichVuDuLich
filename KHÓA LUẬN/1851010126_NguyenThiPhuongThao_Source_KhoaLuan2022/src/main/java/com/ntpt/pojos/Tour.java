/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ntpth
 */
@Entity
@Table(name = "tour")
public class Tour implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Size(min = 10, max = 50, message = "{tour.name.sizeMsg}")
    private String name;
    private String trip;
    private Integer quantity;
    @Column(name = "adult_price")
    @NotNull(message = "{tour.price.notNullMsg}")
    private BigDecimal adultPrice;
    @Column(name = "child_price")
    @NotNull(message = "{tour.price.notNullMsg}")
    private BigDecimal childPrice;
    @Column(name = "start_day")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date startDay;
    
    @Transient  
    private String ngayBD;
    
    @Column(name = "end_day")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date endDay;
    
    @Transient
    private String ngayKT;
    
    private String description;
    private String image;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String image5;
    
    @Column(name = "created_day")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date createdDay;
    
    @Transient 
    private int maLoai;
    
    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
//    @NotNull(message = "{tour.category.notNullMsg}")
    public Category category;
    
     @OneToMany(mappedBy = "tour")
    private Collection<Order> order;
    
    @Transient
    private MultipartFile file;
    @Transient
    private MultipartFile file1;
    @Transient
    private MultipartFile file2;
    @Transient
    private MultipartFile file3;
    @Transient
    private MultipartFile file4;
    @Transient
    private MultipartFile file5;

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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the trip
     */
    public String getTrip() {
        return trip;
    }

    /**
     * @param trip the trip to set
     */
    public void setTrip(String trip) {
        this.trip = trip;
    }

    /**
     * @return the adultPrice
     */
    public BigDecimal getAdultPrice() {
        return adultPrice;
    }

    /**
     * @param adultPrice the adultPrice to set
     */
    public void setAdultPrice(BigDecimal adultPrice) {
        this.adultPrice = adultPrice;
    }

    /**
     * @return the childPrice
     */
    public BigDecimal getChildPrice() {
        return childPrice;
    }

    /**
     * @param childPrice the childPrice to set
     */
    public void setChildPrice(BigDecimal childPrice) {
        this.childPrice = childPrice;
    }

    /**
     * @return the startDay
     */
    public Date getStartDay() {
        return startDay;
    }

    /**
     * @param startDay the startDay to set
     */
    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    /**
     * @return the endDay
     */
    public Date getEndDay() {
        return endDay;
    }

    /**
     * @param endDay the endDay to set
     */
    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }


    /**
     * @return the category
     */
    public Category getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(Category category) {
        this.category = category;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the file1
     */
    public MultipartFile getFile1() {
        return file1;
    }

    /**
     * @param file1 the file1 to set
     */
    public void setFile1(MultipartFile file1) {
        this.file1 = file1;
    }

    /**
     * @return the file2
     */
    public MultipartFile getFile2() {
        return file2;
    }

    /**
     * @param file2 the file2 to set
     */
    public void setFile2(MultipartFile file2) {
        this.file2 = file2;
    }

    /**
     * @return the file3
     */
    public MultipartFile getFile3() {
        return file3;
    }

    /**
     * @param file3 the file3 to set
     */
    public void setFile3(MultipartFile file3) {
        this.file3 = file3;
    }

    /**
     * @return the file4
     */
    public MultipartFile getFile4() {
        return file4;
    }

    /**
     * @param file4 the file4 to set
     */
    public void setFile4(MultipartFile file4) {
        this.file4 = file4;
    }

    /**
     * @return the file5
     */
    public MultipartFile getFile5() {
        return file5;
    }

    /**
     * @param file5 the file5 to set
     */
    public void setFile5(MultipartFile file5) {
        this.file5 = file5;
    }

    /**
     * @return the image1
     */
    public String getImage1() {
        return image1;
    }

    /**
     * @param image1 the image1 to set
     */
    public void setImage1(String image1) {
        this.image1 = image1;
    }

    /**
     * @return the image2
     */
    public String getImage2() {
        return image2;
    }

    /**
     * @param image2 the image2 to set
     */
    public void setImage2(String image2) {
        this.image2 = image2;
    }

    /**
     * @return the image3
     */
    public String getImage3() {
        return image3;
    }

    /**
     * @param image3 the image3 to set
     */
    public void setImage3(String image3) {
        this.image3 = image3;
    }

    /**
     * @return the image4
     */
    public String getImage4() {
        return image4;
    }

    /**
     * @param image4 the image4 to set
     */
    public void setImage4(String image4) {
        this.image4 = image4;
    }

    /**
     * @return the image5
     */
    public String getImage5() {
        return image5;
    }

    /**
     * @param image5 the image5 to set
     */
    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public String setName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * @return the ngayBD
     */
    public String getNgayBD() {
        return ngayBD;
    }

    /**
     * @param ngayBD the ngayBD to set
     */
    public void setNgayBD(String ngayBD) {
        this.ngayBD = ngayBD;
    }

    /**
     * @return the ngayKT
     */
    public String getNgayKT() {
        return ngayKT;
    }

    /**
     * @param ngayKT the ngayKT to set
     */
    public void setNgayKT(String ngayKT) {
        this.ngayKT = ngayKT;
    }

    /**
     * @return the maLoai
     */
    public int getMaLoai() {
        return maLoai;
    }

    /**
     * @param maLoai the maLoai to set
     */
    public void setMaLoai(int maLoai) {
        this.maLoai = maLoai;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDay() {
        return createdDay;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDay(Date createdDay) {
        this.createdDay = createdDay;
    }

    /**
     * @return the order
     */
    public Collection<Order> getOrder() {
        return order;
    }

    /**
     * @param order the order to set
     */
    public void setOrder(Collection<Order> order) {
        this.order = order;
    }

    /**
     * @return the quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
   
}
