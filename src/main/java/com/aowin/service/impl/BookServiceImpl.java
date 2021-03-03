package com.aowin.service.impl;

import com.aowin.domain.*;
import com.aowin.mapper.AccountRecordMapper;
import com.aowin.mapper.BookMapper;
import com.aowin.mapper.BookRecordMapper;
import com.aowin.mapper.UserMapper;
import com.aowin.service.BookService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author bingo
 */
@Service
public class BookServiceImpl implements BookService {
    /**
     * 最大租书量
     */
    public static final long MAX_BOOK_NUM = 5;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookRecordMapper bookRecordMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AccountRecordMapper accountRecordMapper;

    @Override
    public PageInfo<Book> getAllNotLentBooks(int pageNum) {
        PageHelper.startPage(pageNum, 5);
        Page<Book> page = (Page<Book>) bookMapper.getAllNotLentBooks();
        return page.toPageInfo();
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public boolean borrowBookById(int bookId, User user) {
        List<BookRecord> notReturnedBooks = bookRecordMapper.getNotReturnedBooks(user);
        List<BookRecord> notReturnedOverdueBooks = bookRecordMapper.getNotReturnedOverdueBook(user);
        if (notReturnedBooks.size() >= MAX_BOOK_NUM || notReturnedOverdueBooks.size() > 0) {
            return false;
        } else {
            bookMapper.borrowBookById(bookId);
            bookRecordMapper.addRecord(bookId, user);
        }
        return true;
    }

    @Override
    public PageInfo<BookRecord> getNotReturnedBooks(int pageNum, User user) {
        PageHelper.startPage(pageNum, 5);
        Page<BookRecord> bookRecords = (Page<BookRecord>) bookRecordMapper.getNotReturnedBooks(user);
        return bookRecords.toPageInfo();
    }

    @Override
    public PageInfo<BookRecord> getAllReturnedBooks(int pageNum, User user) {
        PageHelper.startPage(pageNum, 5);
        Page<BookRecord> bookRecords = (Page<BookRecord>) bookRecordMapper.getAllReturnedBooks(user);
        return bookRecords.toPageInfo();
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public boolean returnBookById(int bookId, int recordId, int userId) {
        bookMapper.returnBookById(bookId);
        bookRecordMapper.updateReturnBookRecord(recordId);
        int days = bookRecordMapper.getOverdueDays(recordId);
        if (days>0) {
            userMapper.updateOwingMoney(userId, days);
            accountRecordMapper.addAccountRecord(userId, days, 1);
        }
        return true;
    }
}
