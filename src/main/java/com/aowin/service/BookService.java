package com.aowin.service;

import com.aowin.domain.Book;
import com.aowin.domain.BookRecord;
import com.aowin.domain.User;
import com.github.pagehelper.PageInfo;

/**
 * @author bingo
 */
public interface BookService {
    /**
     * 获取所有未借出图书
     * @param page
     * @return
     */
    PageInfo getAllNotLentBooks(int page);

    /**
     * 根据图书id借书
     * @param bookId
     * @param user
     * @return
     */
    boolean borrowBookById(int bookId, User user);

    /**
     * 获取用户所有未还的图书
     * @param user
     * @param pageNum
     * @return
     */
    PageInfo<BookRecord> getNotReturnedBooks(int pageNum,User user);

    /**
     * 获取用户所有已还图书借阅记录
     * @param user
     * @param pageNum
     * @return
     */
    PageInfo<BookRecord> getAllReturnedBooks(int pageNum,User user);

    /**
     * 根据书本id还书
     * @param bookId
     * @param recordId
     * @param userId
     * @return
     */
    boolean returnBookById(int bookId, int recordId, int userId);
}
