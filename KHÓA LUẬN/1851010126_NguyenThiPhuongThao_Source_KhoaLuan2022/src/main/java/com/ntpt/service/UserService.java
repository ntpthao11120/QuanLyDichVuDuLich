/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import com.ntpt.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author ntpth
 */
public interface UserService extends UserDetailsService{
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getUserRole(String userRole, String kw);
    boolean addStaff(User user);
    boolean updateStaff(User user, int id);
    boolean deleteUser(User user);
    User getUserById(int id);
    boolean updateUser(User user, int id);
    User getIdByUsername(String username);
}
