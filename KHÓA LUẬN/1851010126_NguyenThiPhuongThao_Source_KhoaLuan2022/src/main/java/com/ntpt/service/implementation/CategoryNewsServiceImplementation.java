/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.service.implementation;

import com.ntpt.pojos.CategoryNews;
import com.ntpt.repository.CategoryNewsRepository;
import com.ntpt.service.CategoryNewsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ntpth
 */
@Service
public class CategoryNewsServiceImplementation implements CategoryNewsService{
    @Autowired
    private CategoryNewsRepository cateNewsRepository;

    @Override
    public List<CategoryNews> getCategoryNews() {
        return this.cateNewsRepository.getCategoryNews();
    }

    @Override
    public CategoryNews getCategoryNewsById(int id) {
        return this.cateNewsRepository.getCategoryNewsById(id);
    }

    @Override
    public boolean addCategoryNews(CategoryNews cateNews) {
       return this.cateNewsRepository.addCategoryNews(cateNews);
    }

    @Override
    public boolean updateCategoryNews(CategoryNews cateNews, int id) {
        return this.cateNewsRepository.updateCategoryNews(cateNews, id);
    }

    @Override
    public boolean deleteCategoryNews(CategoryNews cateNews) {
        return this.cateNewsRepository.deleteCategoryNews(cateNews);
    }
    
    
}
