package com.urge.service;

import com.urge.entity.User;
import java.util.List;

public  interface UserServices {
    boolean isUserExist(String username);
    String getPasswordByUsername(String username);

    String getTelnumByUsername(String username);

    String getTeamnameByUsername(String username);

    void addUser(String username, String password, String telnum, String teamname);

    void modifyPasswordByUsername(String username, String newpassword);

    void AdminmodifyByUsername(String username, String password, String telnum, String teamname);

    void modifyByUsername(String username, String telnum, String teamname);

    void remove(int id);
    void put(int id, String username);
    List<User> getAllUser();
}