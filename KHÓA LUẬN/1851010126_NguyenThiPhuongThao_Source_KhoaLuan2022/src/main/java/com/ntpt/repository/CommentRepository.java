/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository;

import com.ntpt.pojos.Comment;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface CommentRepository {
    Comment addComment(Comment c);
    Comment getCommentById(int id);
    List<Comment> getReply(int newsId);
    boolean delComment(Comment c);
    Comment updateComment(String content, int id);
}
