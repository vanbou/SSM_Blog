package com.tulun.controller;
import com.tulun.config.Config;
import com.tulun.model.Result;
import com.tulun.model.User;
import com.tulun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/22
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(){
        return "user/login";
    }

    @RequestMapping("/checklogin")
    @ResponseBody
    public Result checkLogin(User user, HttpSession session){
        System.out.println("user = " + user);
        boolean checkLogin = userService.checkLogin(user.getName(), user.getPasswd());
        Result result = new Result("fail", "用户名或密码错误");

        if (checkLogin) {
            result = new Result("success","成功");
            //登录成功记录登录的缓存信息
            session.setAttribute(Config.LoginKey, user);
        }

        return result;
    }

}

