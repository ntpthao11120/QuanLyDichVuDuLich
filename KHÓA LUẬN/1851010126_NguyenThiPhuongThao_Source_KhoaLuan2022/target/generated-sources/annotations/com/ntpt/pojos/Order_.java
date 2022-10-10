package com.ntpt.pojos;

import com.ntpt.pojos.Tour;
import com.ntpt.pojos.User;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-15T10:28:36")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, BigDecimal> total;
    public static volatile SingularAttribute<Order, Integer> adultQuantity;
    public static volatile SingularAttribute<Order, Date> createdDay;
    public static volatile SingularAttribute<Order, Integer> childQuantity;
    public static volatile SingularAttribute<Order, Integer> id;
    public static volatile SingularAttribute<Order, User> user;
    public static volatile SingularAttribute<Order, Tour> tour;

}