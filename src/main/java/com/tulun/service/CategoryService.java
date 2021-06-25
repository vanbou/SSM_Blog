package com.tulun.service;

import com.tulun.dao.CategoryMapper;
import com.tulun.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
@Service
public class CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    public List<Category> selectAllCategory(){
        return categoryMapper.getAllCategory();
    }

    public Category getCategoryById(Integer id){
        return categoryMapper.getCategoryById(id);
    }
}
