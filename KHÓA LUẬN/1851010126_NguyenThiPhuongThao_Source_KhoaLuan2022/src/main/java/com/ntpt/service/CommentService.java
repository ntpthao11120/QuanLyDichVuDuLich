/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service;

import com.ntpt.pojos.Comment;
import com.ntpt.pojos.User;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface CommentService {
    Comment addComment(String content, int newsId, User creator);
    Comment addReply(String content, int newsId, User creator, int parentId);
    Comment getCommentById(int id);
    List<Comment> getReply(int newsId);
    boolean delComment(Comment c);
    Comment updateComment(String content, int id);
}
