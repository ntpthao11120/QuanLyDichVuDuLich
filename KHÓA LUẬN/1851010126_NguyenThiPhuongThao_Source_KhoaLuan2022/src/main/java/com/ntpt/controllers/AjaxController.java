/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.Car;
import com.ntpt.pojos.Comment;
import com.ntpt.pojos.News;
import com.ntpt.pojos.User;
import com.ntpt.service.CarService;
import com.ntpt.service.CommentService;
import com.ntpt.service.NewsService;
import com.ntpt.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ntpth
 */
@Controller
@RequestMapping("api/")
public class AjaxController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private CarService carService;
    
    @PostMapping("delUser/{userID}")
    @ResponseBody
    public String delUser(@PathVariable (value = "userID") int userID,  HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            User user = this.userDetailsService.getUserById(userID);
            this.userDetailsService.deleteUser(user);
        }
        
        return "user";
    }
    
    @PostMapping("delNews/{newsId}")
    @ResponseBody
    public String delNews(@PathVariable(value = "newsId") int newsId,  HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            News news = this.newsService.getNewsById(newsId);
            this.newsService.delNews(news);
        }
        return "news-manage";
    }
    
    @PostMapping("delComment/{commentId}")
    @ResponseBody
    public String delComment(@PathVariable(value = "commentId") int commentId,  HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            Comment c = this.commentService.getCommentById(commentId);
            this.commentService.delComment(c);
        }
        return "news";
    }
    
    @PostMapping("delCar/{carId}")
    @ResponseBody
    public String delCar(@PathVariable(value = "carId") int carId, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            Car c = this.carService.getCarById(carId);
            this.carService.deleteCar(c);        
        }
        return "car-manage";
    }
}
