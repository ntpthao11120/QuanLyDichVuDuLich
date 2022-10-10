/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository.implementation;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntpt.pojos.Category;
import com.ntpt.pojos.Order;
import com.ntpt.pojos.Tour;
import com.ntpt.pojos.User;
import com.ntpt.repository.CategoryRepository;
import com.ntpt.repository.TourRepository;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ntpth
 */
@Repository
@Transactional
public class TourRepositoryImplementation implements TourRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public List<Tour> getTours(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tour> query = builder.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        //query = query.select(root);
        query = query.orderBy(builder.desc(root.get("createdDay")));
        
        if(kw != null){
            Predicate p = builder.like(root.get("name").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = session.createQuery(query);
        
        int max = 20;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Tour tour) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            Category  c = categoryRepository.getCategoryById(tour.getMaLoai());
            tour.setCategory(c);
            tour.setCreatedDay(new Date());
            session.save(tour);
            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==ADD TOUR ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public long countTour() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT COUNT(*) FROM Tour");
        
        return Long.parseLong(q.getSingleResult().toString()) ;
    }
    @Override
    public Tour getTourById(int tourId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tour> query = builder.createQuery(Tour.class);
        Root root = query.from(Tour.class); //FROM
        query = query.where(builder.equal(root.get("id"),tourId)); //SELECT WHERE
        Tour q = session.createQuery(query).getSingleResult(); // Trả về 1 đối tượng Tour
        return q;
    }
    //Xóa tour
    @Override
    public boolean deleteTour(int tourId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Tour tour = this.getTourById(tourId); // Trả về 1 đối tượng Tour
        try{
            session.delete(tour);            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==DELETE TOUR ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }  
        return false;
    }

    @Override
    public boolean updateTour(Tour tour, int tourid) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        //Tour t = this.getTourById(tour.getId()); // Trả về 1 đối tượng Tour
        Tour t = this.getTourById(tourid);
        try{
           if(tour.getFile().isEmpty() == false)
            {
                Map r = this.cloudinary.uploader().upload(tour.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage((String) r.get("secure_url"));
                t.setImage(tour.getImage());
            }
            if(tour.getFile1().isEmpty() == false)
            {
                Map r1 = this.cloudinary.uploader().upload(tour.getFile1().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage1((String) r1.get("secure_url"));
                t.setImage1(tour.getImage1());
            }
             if(tour.getFile2().isEmpty() == false)
            {
                Map r2 = this.cloudinary.uploader().upload(tour.getFile2().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage2((String) r2.get("secure_url"));
                t.setImage2(tour.getImage2());
            }
            if(tour.getFile3().isEmpty() == false)
            {
                Map r3 = this.cloudinary.uploader().upload(tour.getFile3().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage3((String) r3.get("secure_url"));
                t.setImage3(tour.getImage3());
            }
             if(tour.getFile4().isEmpty() == false)
            {
                Map r4 = this.cloudinary.uploader().upload(tour.getFile4().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage4((String) r4.get("secure_url"));
                t.setImage4(tour.getImage4());
            }
            if(tour.getFile5().isEmpty() == false)
            {
                Map r5 = this.cloudinary.uploader().upload(tour.getFile5().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                tour.setImage5((String) r5.get("secure_url"));
                t.setImage5(tour.getImage5());
            }
            t.setName(tour.getName());
            //t.setTrip(tour.getTrip());
            t.setDescription(tour.getDescription());
            DateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
            DateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");          
            if(tour.getNgayBD().isEmpty() == false)
            {
                 Date dateBD = format1.parse(tour.getNgayBD());
                 String d = (format2.format(dateBD));
                 Date date = format2.parse(d);
                 t.setStartDay(date);
            }
            if(tour.getNgayKT().isEmpty() == false)
            {
                Date dateKT = format1.parse(tour.getNgayKT());
                String d = (format2.format(dateKT));
                Date date = format2.parse(d);
                t.setEndDay(date);
            }
            t.setAdultPrice(tour.getAdultPrice());
            t.setChildPrice(tour.getChildPrice());
            t.setCategory(tour.getCategory());
            session.save(t);            
            return true;
        }catch(Exception ex){
            session.clear();
            System.err.println("==UPDATE TOUR ERROR==" + ex.getMessage());
            ex.printStackTrace();
        }  
        return false;
    }

  
    @Override
    public boolean order(Order order, int tourid, User creator) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
          BigDecimal giaTE = BigDecimal.ZERO;
          BigDecimal giaNL = BigDecimal.ZERO;
          Tour t = this.getTourById(tourid);
          order.setTour(t);
          if(order.getAdultQuantity() != 0){
               giaNL = t.getAdultPrice().multiply(BigDecimal.valueOf(order.getAdultQuantity()));
               order.setTotal(giaNL);
          }
           order.setUser(creator);
          if(order.getChildQuantity() != 0){
            giaTE = t.getChildPrice().multiply(BigDecimal.valueOf(order.getChildQuantity()));
            order.setTotal(order.getTotal().add(giaTE));
          }
          int soLuong = t.getQuantity() - (order.getAdultQuantity() + order.getChildQuantity());
          if(soLuong >= 0 ){
               t.setQuantity(soLuong);
               order.setCreatedDay(new Date());
               session.save(order);
               return true;
          }
         else
              return false;
        }catch(Exception ex){
            session.clear();
            System.err.println("==ADD TOUR ERROR==" + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }
    @Override
    public List<Object[]> getHotTours1(int num) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootT = query.from(Tour.class);
        Root rootO = query.from(Order.class);
        
        query = query.where(builder.equal(rootO.get("tour"), rootT.get("id")));
        query.multiselect(rootT.get("id"), rootT.get("name"), rootT.get("trip"), 
                rootT.get("image"), rootT.get("adultPrice"), rootT.get("childPrice"),
                rootT.get("startDay"), rootT.get("endDay"),
                builder.count(rootT.get("id")));
        
        query = query.groupBy(rootT.get("id"));
        query = query.orderBy(builder.desc(builder.count(rootT.get("id"))));
        
        Query q = session.createQuery(query);
        q.setMaxResults(num);
        q.setFirstResult(0);
        return q.getResultList();
    }
      @Override
    public List<Object[]> getHotTours2(int num) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootT = query.from(Tour.class);
        Root rootO = query.from(Order.class);
        
        query = query.where(builder.equal(rootO.get("tour"), rootT.get("id")));
        query.multiselect(rootT.get("id"), rootT.get("name"), rootT.get("trip"), 
                rootT.get("image"), rootT.get("adultPrice"), rootT.get("childPrice"),
                rootT.get("startDay"), rootT.get("endDay"),
                builder.count(rootT.get("id")));
        
        query = query.groupBy(rootT.get("id"));
        query = query.orderBy(builder.desc(builder.count(rootT.get("id"))));
        
        Query q = session.createQuery(query);
        q.setMaxResults(num);
        q.setFirstResult(3);
        return q.getResultList();
    }
}
