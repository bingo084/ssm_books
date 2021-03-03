package com.aowin.mapper;

import com.aowin.domain.MoneyType;
import com.aowin.domain.User;
import org.apache.ibatis.annotations.Param;

/**
 * 账户记录表
 * @author bingo
 */
public interface AccountRecordMapper {
    /**
     * 添加金额变动记录
     * @param userId
     * @param days
     * @param type
     */
    void addAccountRecord(@Param("userId") int userId,@Param("days") int days,@Param("type") int type);

    /**
     * 添加补交金额记录
     * @param user
     */
    void makeUpArrears(@Param("user") User user);
}
