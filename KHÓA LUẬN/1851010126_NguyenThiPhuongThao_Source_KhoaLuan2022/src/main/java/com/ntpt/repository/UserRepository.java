/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository;

import com.ntpt.pojos.User;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface UserRepository {
    boolean addUser(User user);
    boolean updateUser(User user, int id);
    boolean deleteUser(User user);
    List<User> getUsers(String username);
    List<User> getUserRole(String userRole, String kw);
    User getUserById(int id);
    User getIdByUsername(String username);
}
