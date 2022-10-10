/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.User;
import com.ntpt.service.UserService;
import com.ntpt.validator.WebAppValidator;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ntpth
 */
@Controller
public class UserController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private WebAppValidator userValidator;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    } 
   
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/register")
    public String registerView(Model model){
        model.addAttribute("user", new User());
        return "register";
    }
    
    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result, HttpSession session){
            if (result.hasErrors()) 
                return "register"; 
            this.userDetailsService.addUser(user);
        return "redirect:/login";
    }
    
    @GetMapping("/user")
    public String user(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", "");
        model.addAttribute("staff", this.userDetailsService.getUserRole("ROLE_STAFF", kw));
        return "user";
    }
    
    @GetMapping("/chat")
    public String getChat(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", "");
        model.addAttribute("chatClient", this.userDetailsService.getUserRole("ROLE_CLIENT", kw));
        return "chat";
    }
    
    @GetMapping("/client")
    public String getClient(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", "");
        model.addAttribute("client", this.userDetailsService.getUserRole("ROLE_CLIENT", kw));
        return "client";
    }
    
    @GetMapping("/user-detail")
    public String userDetailView(Model model){
        model.addAttribute("userdetail", new User());
        return "user-detail";
    }

    
    @PostMapping("/user-detail/{userID}")
    public String userDetail(Model model, @ModelAttribute(value = "userdetail") @Valid User user , BindingResult result
        , @RequestParam (required = false, defaultValue = "") Map<String, String> params,
        @PathVariable (required = false, value = "") int userID, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if (result.hasErrors()) {            
                return "user-detail";
           } 

           if(userID != 0){
               this.userDetailsService.updateStaff(user, userID);
           }else{
               this.userDetailsService.addStaff(user);
           } 
        }
                
        return "redirect:/user";
    }
    
    @GetMapping("/user-detail/{userId}")
    public String getUserId(Model model, @PathVariable (value = "userId") int userId){
        model.addAttribute("userdetail", this.userDetailsService.getUserById(userId));       
        return "user-detail";
    }
    
    @GetMapping("/client-detail")
    public String clientDetailView(Model model){
        model.addAttribute("clientdetail", new User());
        return "client-detail";
    }
    
    @GetMapping("/client-detail/{clientId}")
    public String getClientId(Model model, @PathVariable (value = "clientId") int clientId){
        model.addAttribute("clientdetail", this.userDetailsService.getUserById(clientId));       
        return "client-detail";
    }
    
    @PostMapping("/client-detail/{clientID}")
    public String clientDetail(Model model, @ModelAttribute(value = "clientdetail") @Valid User user , BindingResult result
        , @RequestParam (required = false, defaultValue = "") Map<String, String> params,
        @PathVariable (required = false, value = "") int clientID,  HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            if (result.hasErrors()) {            
                return "client-detail";
           } 

           if(clientID != 0){
               this.userDetailsService.updateUser(user, clientID);
           }else{
               this.userDetailsService.addUser(user);
           } 
        }
                
        return "redirect:/client";
    }
}
