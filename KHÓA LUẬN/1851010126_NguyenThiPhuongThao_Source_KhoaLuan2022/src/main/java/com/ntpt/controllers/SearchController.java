///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.ntpt.controllers;
//
//import com.ntpt.Utils.Constants;
//import com.ntpt.Utils.PathResources;
//import com.ntpt.Utils.ResultQuery;
//import com.ntpt.service.ISearchService;
//import java.io.IOException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// *
// * @author ntpth
// */
//@RestController
//@RequestMapping(PathResources.SEARCH_CONTROLLER)
//public class SearchController {
//     private ISearchService searchService;
//
//    @Autowired
//    public SearchController(ISearchService searchService) {
//        this.searchService = searchService;
//    }
//
//    @GetMapping(Constants.SEARCH_QUERY + "/{" + Constants.QUERY + "}")
//    public ResponseEntity<ResultQuery> searchQuery(@PathVariable String query) throws IOException {
//        return new ResponseEntity<> (searchService.searchFromQuery(query.trim().toLowerCase()), HttpStatus.OK);
//    }
//}
