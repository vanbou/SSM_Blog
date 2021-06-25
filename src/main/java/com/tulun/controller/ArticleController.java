package com.tulun.controller;

import com.tulun.config.Config;
import com.tulun.model.*;
import com.tulun.service.ArticleService;
import com.tulun.service.CategoryService;
import com.tulun.service.TagService;
import com.tulun.util.JsonUtil;
import com.tulun.util.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Description :
 * Created by Resumebb
 * Date :2021/4/27
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/add")
    public String add(Model model, HttpSession session) {
        User user = (User)session.getAttribute(Config.LoginKey);
        if(user == null){
            return "redirect:../login";
        }

        //获取类别数据
        List<Category> categories = categoryService.selectAllCategory();

        //获取标签数据
        List <Tag> tags = tagService.selectAllTag();

        model.addAttribute("categoryList", categories);
        model.addAttribute("tagList", tags);
        System.out.println(tags);
        return "article/add_article";
    }

    @RequestMapping("/addContent")
    @ResponseBody
    public Result addContent(String param, String content, String description) throws UnsupportedEncodingException {
        String param1 = URLDecoder.decode(param, "utf-8");
        String content1 = URLDecoder.decode(content, "utf-8");
        String description1 = URLDecoder.decode(description, "utf-8");
        //将String字符串解析为对象
        Article article = JsonUtil.fromJson(param1, Article.class);
        article.setContent(content1);
        article.setDescription(description1);
        article.setStatus(0);
        article.setCreateTime(new Date());
        article.setAuthor("杜甫");
        System.out.println(article.toString());
        int i = articleService.addArticle(article);
        if(i > 0){
            return new Result("success","处理成功");
        }
        return new Result("fail", "处理失败");
    }

    //获取文章详情
    @RequestMapping("/{id}")
    public String detail(@PathVariable("id") Integer id, Model model){
        Article article = articleService.getArticleById(id);
        System.out.println("article:"+article);

        model.addAttribute("article", article);

        return "article/article_detail";
    }


    //后台的主页面
    @RequestMapping("/back")
    public String back(Model model) {

        //类别列表
        List <Category> categories = categoryService.selectAllCategory();

        //标签列表
        List <Tag> tags = tagService.selectAllTag();

        model.addAttribute("categoryList", categories);
        model.addAttribute("tagList",tags);
        return "article/article_list";
    }

    //后台的分页页面
    @RequestMapping("/load")
    public String load(Model model, Pager<Article> pager, String param) throws UnsupportedEncodingException {
        System.out.println("参数：param："+param+"，pager："+pager.toString());

        Article article = JsonUtil.fromJson(param, Article.class);
        if (article != null && article.getTitle() != null && "".equals(article.getTitle())) {
            //标题参数不为空时，需要进行解码处理
            String title = URLDecoder.decode(article.getTitle(), "utf-8");
            article.setTitle(title);
        }

        //分页相关的
        //需要获取当前条件下数据的个数
        if (pager.getPage() == 1) {
//        当前条件下第一次查询
        Integer articleCount = articleService.getArticleCount(article, pager);
        System.out.println("符合条件："+articleCount);
        pager.setTotalCount(articleCount);
        }

        List <Article> articles = articleService.getArticlesByPage(article, pager);

        model.addAttribute("articleList",articles);


        return "article/article_pager";
    }


    @RequestMapping("/updateStatue")
    @ResponseBody
    public Result updateStatue(@Param("id") Integer id, @Param("status") Integer status) {
        Article article = new Article();
        article.setId(id);
        article.setStatus(status);
        if (articleService.updataStatus(article)) {
            return new Result("success","成功");
        } else {
            return new Result("fail","修改失败");
        }

    }


}
