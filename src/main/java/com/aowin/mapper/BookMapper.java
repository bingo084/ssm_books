package com.aowin.mapper;

import com.aowin.domain.Book;

import java.util.List;

/**
 * 图书表
 * @author bingo
 */
public interface BookMapper {
    /**
     * 获取所有未借出的图书
     * @return
     */
    List<Book> getAllNotLentBooks();

    /**
     * 根据图书id借书
     * @param id
     */
    void borrowBookById(int id);

    /**
     * 根据id还书
     * @param id
     */
    void returnBookById(int id);
}
