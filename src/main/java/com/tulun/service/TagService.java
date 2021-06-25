package com.tulun.service;

import com.tulun.dao.TagMapper;
import com.tulun.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
@Service
public class TagService {
    @Autowired
    private TagMapper tagMapper;
    public List<Tag> selectAllTag(){
        return tagMapper.getAllTag();
    }
}
