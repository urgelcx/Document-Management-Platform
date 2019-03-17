package com.urge.service;

import com.urge.entity.Tb_user;
import java.util.List;

public interface Tb_userService {
     boolean AdminisUserExist(String username);

     String AdmingetPasswordByUsername(String username);

     void AdminaddUser(String username, String password);

     void AdminmodifyPasswordByUsername(String username, String newpassword);

     List<Tb_user> getAllData();
}