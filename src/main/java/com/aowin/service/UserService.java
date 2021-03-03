package com.aowin.service;

import com.aowin.domain.User;

/**
 * @author bingo
 */
public interface UserService {
    /**
     * 根据用户信息获取数据库用户
     * @param user
     * @return
     */
    User getUser(User user);

    /**
     * 补缴费用
     * @return
     * @param User
     */
    boolean makeUpArrears(User User);

    /**
     * 登录验证
     * @param user
     * @return
     */
    User getLoginUser(User user);
}
