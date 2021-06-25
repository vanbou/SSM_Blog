package com.tulun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
    private  String context ;

    @RequestMapping("/add")
    public String test(){
        return "add_ueditor";
    }

    //������水ť���������ύ����̨
    @RequestMapping("/addContent")
    public String addContent(String description,String content) {
        System.out.println("content:"+content);
        System.out.println("description:"+description);
        context = content;
        return "redirect:/test/detail";
    }

    //����ҳ��
    @RequestMapping("/detail")
    public String detail(Model model){
        model.addAttribute("content", context);
        return "ueditor_detail";
    }
}

