package com.aowin.mapper;

import com.aowin.domain.BookRecord;
import com.aowin.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 图书记录表
 *
 * @author bingo
 */
public interface BookRecordMapper {
    /**
     * 获取没有归还的图书
     *
     * @param user 用户
     * @return
     */
    List<BookRecord> getNotReturnedBooks(@Param("user") User user);

    /**
     * 获取没有归还并逾期的图书
     *
     * @param user 用户
     * @return
     */
    List<BookRecord> getNotReturnedOverdueBook(@Param("user")User user);

    /**
     * 添加借书记录
     *
     * @param bookId
     * @param user
     */
    void addRecord(@Param("bookId") int bookId, @Param("user") User user);

    /**
     * 获取所有归还的图书
     * @param user
     * @return
     */
    List<BookRecord> getAllReturnedBooks(@Param("user")User user);

    /**
     * 更新还书记录
     * @param recordId
     */
    void updateReturnBookRecord(int recordId);

    /**
     * 查询逾期天数
     * @param recordId
     * @return
     */
    int getOverdueDays(int recordId);
}
