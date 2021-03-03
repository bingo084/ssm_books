package com.aowin.mapper;

import com.aowin.domain.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户表
 *
 * @author bingo
 */
public interface UserMapper {

    /**
     * 更新欠费金额
     *
     * @param userId
     * @param days
     */
    void updateOwingMoney(@Param("userId") int userId, @Param("days") int days);

    /**
     * 根据用户信息获取用户
     *
     * @param user
     * @return
     */
    User getUser(@Param("user") User user);

    /**
     * 补交后更新金额
     *
     * @param user
     */
    void makeUpArrears(@Param("user") User user);

    /**
     * 验证登录用户信息
     *
     * @param user
     * @return
     */
    User getLoginUser(@Param("user") User user);
}
