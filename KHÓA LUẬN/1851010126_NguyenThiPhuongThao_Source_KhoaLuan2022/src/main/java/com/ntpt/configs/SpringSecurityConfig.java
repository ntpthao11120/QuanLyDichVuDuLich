/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author ntpth
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.ntpt.repository",
    "com.ntpt.service"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;
    @Autowired
    private LogoutSuccessHandler logoutSuccess;
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    } 
    
    @Bean
    public Cloudinary cloudinary(){
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dyfc3ns2j",
            "api_key", "269964616445913",
            "api_secret", "KpNVfxeNK8Yi-GDGXih_iXcniVY",
            "secure", true
        ));
        
        return c;
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login").
                usernameParameter("username").
                passwordParameter("password");
        http.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
        
        http.formLogin().successHandler(this.loginSuccessHandler);
        
        http.logout().logoutSuccessHandler(this.logoutSuccess);
        
        http.exceptionHandling().accessDeniedPage("/login?accessDenied");
        
        http.authorizeRequests().antMatchers("/", "login", "register").permitAll()
                .antMatchers("/user").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/stats/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/user-detail").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/user-detail/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/client").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/client-detail").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/client-detail/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN', 'ROLE_CLIENT')")
                .antMatchers("/quanlytour").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/admin/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/news-manage").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/car-order/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN', 'ROLE_CLIENT')")
                .antMatchers("/dattour/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN', 'ROLE_CLIENT')")
                .antMatchers("/car-add/**").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/news-category").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/news-category-details").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/chat").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')")
                .antMatchers("/news-category-update").access("hasAnyRole('ROLE_STAFF', 'ROLE_ADMIN')");
        
        http.csrf().disable();
    }
    
    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler(){
        return new LoginSuccessHandler();
    }
    
    @Bean
    public LogoutSuccessHandler logoutSuccess(){
        return new LogoutSuccess();
    }
}
