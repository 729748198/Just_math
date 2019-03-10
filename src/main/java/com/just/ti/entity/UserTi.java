package com.just.ti.entity;

import java.util.Date;

public class UserTi {
    private Integer id;

    private Integer tiId;

    private String username;

    private Integer isDo;

    private Date dotime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTiId() {
        return tiId;
    }

    public void setTiId(Integer tiId) {
        this.tiId = tiId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getIsDo() {
        return isDo;
    }

    public void setIsDo(Integer isDo) {
        this.isDo = isDo;
    }

    public Date getDotime() {
        return dotime;
    }

    public void setDotime(Date dotime) {
        this.dotime = dotime;
    }
}