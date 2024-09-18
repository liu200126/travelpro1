package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Books;
import cn.yunhe.travel.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/findAllBooks")
    public List<Books> findAllBooks(){
        List<Books> books = bookService.findAllBook();
        return books;
    }
}
