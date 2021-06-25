# SSM_Blog

## Introduction

This project is a personal blog system based on SSM framework, including front-end and back-end development

## The main functions are as follows:

1. Blog list display: articles are displayed in chronological order (reverse order of time: latest first display)
2. Display of blog article details: display all contents of the article, including: author, creation time, directory, label, article title and content
3. User rights management: visitors can only browse articles, administrators can publish articles, and articles can be processed offline
4. Add article function: support rich text editing. Can adjust font size, style, type code and other functions

## The development environment is as follows:

- Core framework: S pring:5.2.8.RELEASE
- Web framework: Spring MVC: 5.2.8.release
- Persistence layer framework: mybatis 3.2.4
- Database connection pool: Ali Druid: 0.2.6
- Database: mysql5.xx
- JSON data processing: Google gson 2.3

## Database design:

- User table: account ID, account name, account password
- Blog table: blog ID, blog name, blog content, publishing time, reading volume, category ID and status
- Blog / tag correspondence table: blog ID, tag ID
- Tag table: tag ID, tag name (blog and tag: one to many: a blog can correspond to multiple tags)
- Category table: category ID, category name (blog and category: one to one: one blog corresponds to one category)

```
Description of contents:
|-src
|--mian
|---Java source code root directory
|----com
|-----tulun
|------Model stores pogo class: basic getter and setter methods
|------Controller display layer class package path: front end user requests are mapped to the implementation of the class under the package path
|------Service business logic layer package path: business logic implementation, calling Dao layer services
|------DAO database operation layer package path: provides database operation classes and methods
|------Util tool package path
|---Resource configuration file root directory
|----Corresponding configuration file directory of myatis mybatis interface
|----Global configuration files of mybatis, spring core and spring MVC in spring-xxx.xml SSM
|--Webapp front end page content root directory
|---WEB-INF
|----Necessary configuration files of web.xml front end page
|-Pom.xml Maven configuration file
```

## For more information, see the blog:

https://blog.csdn.net/qq_41573860/article/details/116048792
