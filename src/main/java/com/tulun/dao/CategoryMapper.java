package com.tulun.dao;
import com.tulun.model.Category;
import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
public interface CategoryMapper {
    public List<Category> getAllCategory();
    public Category getCategoryById(Integer id);
}
