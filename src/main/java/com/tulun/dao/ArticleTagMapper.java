package com.tulun.dao;

import com.tulun.model.Tag;

import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/5/1
 */
public interface ArticleTagMapper {
    public List<Tag> getTagByArticleId(Integer articleId);
}
