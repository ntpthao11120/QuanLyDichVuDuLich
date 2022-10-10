///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ntpt.Utils;
//
//import com.ntpt.pojos.Car;
//import java.time.LocalDateTime;
//import java.util.List;
//import javax.transaction.Transactional;
//import org.eclipse.persistence.jpa.jpql.parser.TrimExpression;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Service;
//
///**
// *
// * @author ntpth
// */
//@Service
//public class ElasticSynchronizer {
//    private static final Logger LOG = LoggerFactory.getLogger(ElasticSynchronizer.class);
//    
//    @Scheduled(cron = "0 */3 * * * *")
//    @Transactional
//    public void sync() {
//        LOG.info("Start Syncing - {}", LocalDateTime.now());
//        this.syncUsers();
//        LOG.info(" End Syncing - {}", LocalDateTime.now());
//    }
//
//    private void syncUsers() {
//
//        Specification<Car> carSpecification = (root, criteriaQuery, criteriaBuilder) ->
//                getModificationDatePredicate(criteriaBuilder, root);
//        List<Car> userList;
//        if (userESRepo.count() == 0) {
//            userList = userDAO.findAll();
//        } else {
//            userList = userDAO.findAll(userSpecification);
//        }
//        for(User user: userList) {
//            LOG.info("Syncing User - {}", user.getId());
//            userESRepo.save(this.userMapper.toUserModel(user));
//        }
//    }
//
//    private static Predicate getModificationDatePredicate(CriteriaBuilder cb, Root<?> root) {
//        Expression<Timestamp> currentTime;
//        currentTime = cb.currentTimestamp();
//        Expression<Timestamp> currentTimeMinus = cb.literal(new Timestamp(System.currentTimeMillis() -
//                (Constants.INTERVAL_IN_MILLISECONDE)));
//        return cb.between(root.<Date>get(Constants.MODIFICATION_DATE),
//                currentTimeMinus,
//                currentTime
//        );
//    }
//}
