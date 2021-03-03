package com.aowin.domain;

/**
 * @author bingo
 */

public enum BookStatus {
    /**
     * 在馆 1, 借出 -1
     */
    IN(1), NOT_IN(-1);
    private int status;

    BookStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
