package com.tulun.dao;

import com.tulun.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/22
 */
public interface UserMapper {
    public User getUserById(Integer id);
    public User getUserByNameAndPwd(@Param("name") String name, @Param("pwd") String pwd);
}
