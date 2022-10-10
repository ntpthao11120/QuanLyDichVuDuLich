/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.User;
import com.ntpt.repository.UserRepository;
import com.ntpt.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service("userDetailsService")
public class UserServiceImplementation implements UserService{
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public boolean addUser(User user) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.CLIENT);        
        try{            
            Map r = this.cloudinary.uploader().upload(user.getFileUser().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            user.setImage((String) r.get("secure_url"));
            
            return this.userRepository.addUser(user);
        }catch(IOException ex){
            System.err.println("==ADD USER==" + ex.getMessage());
        }        
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
//    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if(users.isEmpty()) {
            throw new UsernameNotFoundException("user does not exist");
        }
        
        User user  = users.get(0);
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));
        
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

    @Override
    public List<User> getUserRole(String userRole, String kw) {
        return this.userRepository.getUserRole(userRole, kw);
    }

    @Override
    public boolean addStaff(User user) {
        
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.STAFF);                  
        try{            
            Map r = this.cloudinary.uploader().upload(user.getFileUser().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            user.setImage((String) r.get("secure_url"));
            
            return this.userRepository.addUser(user);
        }catch(IOException ex){
            System.err.println("==ADD USER==" + ex.getMessage());
        }        
        return false;     
    }

    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public boolean updateStaff(User user, int id) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.STAFF);
        return this.userRepository.updateUser(user, id);
    }

    @Override
    public boolean deleteUser(User user) {
        return this.userRepository.deleteUser(user);
    }

    @Override
    public boolean updateUser(User user, int id) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.CLIENT);        
        return this.userRepository.updateUser(user, id);
    }

    @Override
    public User getIdByUsername(String string) {
        return this.userRepository.getIdByUsername(string);
    }
    
}
