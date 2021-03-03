package com.aowin.domain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * user表对应实体类
 * @author bingo
 */
public class User {
    private Integer userId;
    private String username;
    private String password;
    private String idCard;
    private String phone;
    private Date createTime;
    private Integer status;
    private BigDecimal owingMoney;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BigDecimal getOwingMoney() {
        return owingMoney;
    }

    public void setOwingMoney(BigDecimal owingMoney) {
        this.owingMoney = owingMoney;
    }
}
