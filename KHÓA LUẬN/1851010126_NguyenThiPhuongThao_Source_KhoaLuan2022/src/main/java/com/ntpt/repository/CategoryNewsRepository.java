/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.repository;

import com.ntpt.pojos.CategoryNews;
import java.util.List;

/**
 *
 * @author ntpth
 */
public interface CategoryNewsRepository {
    List<CategoryNews> getCategoryNews();
    CategoryNews getCategoryNewsById(int id);
    boolean addCategoryNews(CategoryNews cateNews);
    boolean updateCategoryNews(CategoryNews cateNews, int id);
    boolean deleteCategoryNews(CategoryNews cateNews);
}
