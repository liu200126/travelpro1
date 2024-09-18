package cn.yunhe.travel.mapper;

import cn.yunhe.travel.pojo.Books;

import java.awt.print.Book;
import java.util.List;

public interface BookMapper {
    public List<Books> findAllBooks();
}
