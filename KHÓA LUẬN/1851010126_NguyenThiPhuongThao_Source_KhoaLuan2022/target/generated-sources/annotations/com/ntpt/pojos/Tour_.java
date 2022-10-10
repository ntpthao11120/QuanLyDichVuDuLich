package com.ntpt.pojos;

import com.ntpt.pojos.Category;
import com.ntpt.pojos.Order;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-15T10:28:36")
@StaticMetamodel(Tour.class)
public class Tour_ { 

    public static volatile SingularAttribute<Tour, String> image5;
    public static volatile SingularAttribute<Tour, String> image;
    public static volatile SingularAttribute<Tour, String> image3;
    public static volatile SingularAttribute<Tour, Integer> quantity;
    public static volatile SingularAttribute<Tour, String> image4;
    public static volatile SingularAttribute<Tour, Date> startDay;
    public static volatile SingularAttribute<Tour, BigDecimal> adultPrice;
    public static volatile SingularAttribute<Tour, String> description;
    public static volatile SingularAttribute<Tour, String> image1;
    public static volatile SingularAttribute<Tour, String> image2;
    public static volatile SingularAttribute<Tour, String> trip;
    public static volatile SingularAttribute<Tour, Date> endDay;
    public static volatile SingularAttribute<Tour, Date> createdDay;
    public static volatile SingularAttribute<Tour, String> name;
    public static volatile SingularAttribute<Tour, Integer> id;
    public static volatile SingularAttribute<Tour, BigDecimal> childPrice;
    public static volatile SingularAttribute<Tour, Category> category;
    public static volatile CollectionAttribute<Tour, Order> order;

}