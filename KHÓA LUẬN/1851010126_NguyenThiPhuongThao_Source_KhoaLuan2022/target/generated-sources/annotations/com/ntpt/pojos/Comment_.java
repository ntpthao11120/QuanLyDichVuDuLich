package com.ntpt.pojos;

import com.ntpt.pojos.Comment;
import com.ntpt.pojos.News;
import com.ntpt.pojos.User;
import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-15T10:28:35")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, News> news;
    public static volatile SingularAttribute<Comment, Comment> parent;
    public static volatile SingularAttribute<Comment, Timestamp> createdDate;
    public static volatile CollectionAttribute<Comment, Comment> commentCollection;
    public static volatile SingularAttribute<Comment, Timestamp> modifiedDate;
    public static volatile SingularAttribute<Comment, Integer> id;
    public static volatile SingularAttribute<Comment, User> userId;
    public static volatile SingularAttribute<Comment, String> content;

}