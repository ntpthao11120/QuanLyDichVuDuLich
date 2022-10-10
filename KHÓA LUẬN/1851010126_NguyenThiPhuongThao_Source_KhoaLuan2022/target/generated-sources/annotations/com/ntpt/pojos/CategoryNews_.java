package com.ntpt.pojos;

import com.ntpt.pojos.News;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-15T10:28:36")
@StaticMetamodel(CategoryNews.class)
public class CategoryNews_ { 

    public static volatile CollectionAttribute<CategoryNews, News> newsCateCollection;
    public static volatile SingularAttribute<CategoryNews, String> name;
    public static volatile SingularAttribute<CategoryNews, Integer> id;
    public static volatile SingularAttribute<CategoryNews, String> url;

}