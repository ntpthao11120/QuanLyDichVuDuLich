///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ntpt.pojos;
//
//import com.fasterxml.jackson.annotation.JsonIgnore;
//import java.util.Date;
//import javax.persistence.FetchType;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Transient;
//import org.springframework.data.elasticsearch.annotations.Document;
//import org.springframework.web.multipart.MultipartFile;
//
///**
// *
// * @author ntpth
// */
//@Document(indexName = "car")
//public class CarModel {
//    private int id;
//    private String name;
//    private String description;
//    private Long price;
//    private String image;
//    private MultipartFile file;
//    private int maLoai;
//    private CategoryCar category;
//    
//    private Date modificationDate;
//
//    /**
//     * @return the id
//     */
//    public int getId() {
//        return id;
//    }
//
//    /**
//     * @param id the id to set
//     */
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    /**
//     * @return the name
//     */
//    public String getName() {
//        return name;
//    }
//
//    /**
//     * @param name the name to set
//     */
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    /**
//     * @return the description
//     */
//    public String getDescription() {
//        return description;
//    }
//
//    /**
//     * @param description the description to set
//     */
//    public void setDescription(String description) {
//        this.description = description;
//    }
//
//    /**
//     * @return the price
//     */
//    public Long getPrice() {
//        return price;
//    }
//
//    /**
//     * @param price the price to set
//     */
//    public void setPrice(Long price) {
//        this.price = price;
//    }
//
//    /**
//     * @return the image
//     */
//    public String getImage() {
//        return image;
//    }
//
//    /**
//     * @param image the image to set
//     */
//    public void setImage(String image) {
//        this.image = image;
//    }
//
//    /**
//     * @return the file
//     */
//    public MultipartFile getFile() {
//        return file;
//    }
//
//    /**
//     * @param file the file to set
//     */
//    public void setFile(MultipartFile file) {
//        this.file = file;
//    }
//
//    /**
//     * @return the maLoai
//     */
//    public int getMaLoai() {
//        return maLoai;
//    }
//
//    /**
//     * @param maLoai the maLoai to set
//     */
//    public void setMaLoai(int maLoai) {
//        this.maLoai = maLoai;
//    }
//
//    /**
//     * @return the category
//     */
//    public CategoryCar getCategory() {
//        return category;
//    }
//
//    /**
//     * @param category the category to set
//     */
//    public void setCategory(CategoryCar category) {
//        this.category = category;
//    }
//
//    /**
//     * @return the modificationDate
//     */
//    public Date getModificationDate() {
//        return modificationDate;
//    }
//
//    /**
//     * @param modificationDate the modificationDate to set
//     */
//    public void setModificationDate(Date modificationDate) {
//        this.modificationDate = modificationDate;
//    }
//}
