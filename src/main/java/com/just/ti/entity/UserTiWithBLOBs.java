package com.just.ti.entity;

public class UserTiWithBLOBs extends UserTi {
    private String doanswer;

    private String rightanswer;

    public String getDoanswer() {
        return doanswer;
    }

    public void setDoanswer(String doanswer) {
        this.doanswer = doanswer == null ? null : doanswer.trim();
    }

    public String getRightanswer() {
        return rightanswer;
    }

    public void setRightanswer(String rightanswer) {
        this.rightanswer = rightanswer == null ? null : rightanswer.trim();
    }

    @Override
    public String toString() {
        return "UserTiWithBLOBs{" +
                "doanswer='" + doanswer + '\'' +
                ", rightanswer='" + rightanswer + '\'' +
                '}';
    }
}