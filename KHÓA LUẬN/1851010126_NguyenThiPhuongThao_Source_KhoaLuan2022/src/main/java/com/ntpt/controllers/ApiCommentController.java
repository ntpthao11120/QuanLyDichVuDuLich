/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.controllers;

import com.ntpt.pojos.Comment;
import com.ntpt.pojos.User;
import com.ntpt.service.CommentService;
import java.security.Principal;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ntpth
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @PostMapping(path = "/api/addComment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            try{           
                String content = params.get("content");
                int newsId = Integer.parseInt(params.get("newsId"));
                
                Comment c = this.commentService.addComment(content, newsId, u);

                return new ResponseEntity<>(c, HttpStatus.CREATED);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
                
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/addReply", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addReply(@RequestBody Map<String, String> params, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            try{           
                String content = params.get("content");
                int newsId = Integer.parseInt(params.get("newsId"));
                int parentId = Integer.parseInt(params.get("parentId"));
                
                Comment c = this.commentService.addReply(content, newsId, u, parentId);

                return new ResponseEntity<>(c, HttpStatus.CREATED);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
                
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @GetMapping(path = "/api/getComment/{commentId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> getComment(@PathVariable(value = "commentId") int commentId){

        try{
            Comment c = this.commentService.getCommentById(commentId);
            
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        
    }
    
    @PostMapping(path = "/api/updateComment/{commentId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> updateComment(@RequestBody Map<String, String> params, @PathVariable (value = "commentId") int commentId, HttpSession session){
        User u = (User) session.getAttribute("currentUser");
        if(u != null){
            try{
                String content = params.get("content");

                Comment c = this.commentService.updateComment(content, commentId);

                return new ResponseEntity<>(c, HttpStatus.CREATED);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
