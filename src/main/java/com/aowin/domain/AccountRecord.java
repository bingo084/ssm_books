package com.aowin.domain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * account_record表对应实体类
 * @author bingo
 */
public class AccountRecord {
    private Integer recordId;
    private User user;
    private BigDecimal money;
    private Date changeTime;
    private Integer type;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Date changeTime) {
        this.changeTime = changeTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
