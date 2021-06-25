package com.tulun.dao;

import com.tulun.model.Article;

import java.util.HashMap;
import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
public interface ArticleMapper {
    public int addArticle(Article article);
    public Article getArticleById(Integer id);

    public List<Article> getAllArticle();
    public List<Article> getAllArticleByCategoryId(Integer categoryId);

    //查询符合要求的数据总个数
    public Integer selectCountByArticle(HashMap<String, Object> param);

    //分页查询符合要求的数据
    public List<Article> selectArticleByPager(HashMap<String, Object> param);


    public int updateStatus(Article article);
}
