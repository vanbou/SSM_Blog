package com.tulun.service;

import com.tulun.dao.ArticleMapper;
import com.tulun.dao.ArticleTagMapper;
import com.tulun.model.Article;
import com.tulun.model.Tag;
import com.tulun.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
@Service
public class ArticleService {
    @Autowired
    ArticleMapper articleMapper;
    @Autowired
    ArticleTagMapper articleTagMapper;
    public int addArticle(Article article){
        return articleMapper.addArticle(article);
    }

    public Article getArticleById(Integer id){
        return articleMapper.getArticleById(id);
    }

    public List<Article> getAllArticle(){
        List<Article> list = articleMapper.getAllArticle();

        return dataHandler(list);
    }

    public List<Article> getAllArticleByCategoryId(Integer categoryId){
        List<Article> articles = articleMapper.getAllArticleByCategoryId(categoryId);
        return dataHandler(articles);
    }

    private List<Article> dataHandler(List<Article> articles){
        if(articles != null && articles.size()>0){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
            for (Article article:
                    articles) {
                article.setTime(simpleDateFormat.format(article.getCreateTime()));
                List<Tag> tagList = articleTagMapper.getTagByArticleId(article.getId());
                article.setTags(tagList);
            }
        }
        return articles;
    }

    //获取符合条件的数据数量
    public Integer getArticleCount(Article article,Pager pager) {
        HashMap<String, Object> hashMap = new HashMap <>();
        hashMap.put("article", article);
        Integer integer = articleMapper.selectCountByArticle(hashMap);
        return integer;
    }

    //对符合条件的数据进行分页处理
    public List<Article> getArticlesByPage(Article article,Pager pager) {
        HashMap <String, Object> hashMap = new HashMap <>();
        hashMap.put("article", article);
        hashMap.put("start",pager.getStart());
        hashMap.put("limit", pager.getLimit());

        List <Article> articles = articleMapper.selectArticleByPager(hashMap);
        return articles;
    }


    //修改状态
    public boolean updataStatus(Article a) {
        int i = articleMapper.updateStatus(a);
        if (i> 0) {
            return true;
        } else {
            return false;
        }
    }

}
