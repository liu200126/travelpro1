package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.BookMapper;
import cn.yunhe.travel.pojo.Books;
import cn.yunhe.travel.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Books> findAllBook() {
        return bookMapper.findAllBooks();
    }
}
