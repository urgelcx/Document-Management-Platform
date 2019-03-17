package com.urge.entity;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String telnum;

    private String teamname;

    public User(Integer id, String username, String password, String telnum, String teamname) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.telnum = telnum;
        this.teamname = teamname;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum == null ? null : telnum.trim();
    }

    public String getTeamname() {
        return teamname;
    }

    public void setTeamname(String teamname) {
        this.teamname = teamname == null ? null : teamname.trim();
    }
}