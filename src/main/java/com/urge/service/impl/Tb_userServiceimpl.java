package com.urge.service.impl;

import com.urge.dao.Tb_userMapper;
import com.urge.entity.Tb_user;
import com.urge.service.Tb_userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class Tb_userServiceimpl implements Tb_userService {
    @Autowired
    private Tb_userMapper tb_userMapper;

    public boolean AdminisUserExist(String username) {
        if (tb_userMapper.findUsersByUsername(username) == null) {
            return false;
        } else {
            return true;
        }
    }

    //根据提供的用户名拿密码
    public String AdmingetPasswordByUsername(String username) {
        return tb_userMapper.findUsersByUsername(username).getPassword();
    }

    //新增一个用户
    public void AdminaddUser(String username, String password) {
        Tb_user user = new Tb_user();
        user.setUsername(username);
        user.setPassword(password);
        tb_userMapper.insertSelective(user);
    }

    //修改某一用户的密码
    public void AdminmodifyPasswordByUsername(String username, String newpassword) {
        Tb_user user = tb_userMapper.findUsersByUsername(username);
        user.setUsername(username);
        user.setPassword(newpassword);
        tb_userMapper.updateByPrimaryKeySelective(user);
    }
    @Override
    public List<Tb_user> getAllData() {
        return tb_userMapper.getAllData();
    }
}
