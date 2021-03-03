package com.aowin.service.impl;

import com.aowin.domain.User;
import com.aowin.mapper.AccountRecordMapper;
import com.aowin.mapper.UserMapper;
import com.aowin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author bingo
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AccountRecordMapper accountRecordMapper;

    @Override
    public User getUser(User user) {
        return userMapper.getUser(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean makeUpArrears(User user) {
        userMapper.makeUpArrears(user);
        accountRecordMapper.makeUpArrears(user);
        return true;
    }

    @Override
    public User getLoginUser(User user) {
        return userMapper.getLoginUser(user);
    }
}
