package com.aowin.domain;

/**
 * @author bingo
 */

public enum MoneyType {
    /**
     * 逾期欠费 1，补交逾期费用 2
     */
    OVERDUE_PAYMENT(1),PAY_OVERDUE_FEE(-1);
    private int type;

    MoneyType(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }
}
