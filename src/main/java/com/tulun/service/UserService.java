package com.tulun.service;

import com.tulun.model.User;
import com.tulun.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/19
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User getUserById(Integer id){
        if(id < 0)
            return new User();
        return userMapper.getUserById(id);
    }

    public boolean checkLogin(String name, String pwd){
        if(userMapper.getUserByNameAndPwd(name, pwd) != null){
            return true;
        }
        return false;
    }
}
