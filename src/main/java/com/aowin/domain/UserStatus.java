package com.aowin.domain;

/**
 * @author bingo
 */

public enum UserStatus {
    /**
     * 正常 1，锁定 -1
     */
    NORMAL(1),LOCK(-1);
    private int status;

    UserStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
