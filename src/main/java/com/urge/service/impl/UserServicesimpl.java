package com.urge.service.impl;

import com.urge.dao.UserMapper;
import com.urge.entity.User;
import com.urge.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServicesimpl implements UserServices {

    @Autowired
    private UserMapper userMapper;//自动注入的存在，无需getter和setter了

    public boolean isUserExist(String username) {
        if (userMapper.findUsersByUsername(username) == null) {
            return false;
        } else {
            return true;
        }
    }

    //根据提供的用户名拿密码
    public String getPasswordByUsername(String username) {
        return userMapper.findUsersByUsername(username).getPassword();
    }
    @Override
    public String getTelnumByUsername(String username){
        return userMapper.findUsersByUsername(username).getTelnum();
    }
    @Override
    public String getTeamnameByUsername(String username) {
        return userMapper.findUsersByUsername(username).getTeamname();
    }

    //新增一个用户
    public void addUser(String username, String password,String telnum,String teamname) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setTelnum(telnum);
        user.setTeamname(teamname);
        userMapper.insertSelective(user);
    }

    //忘记密码
    public void modifyPasswordByUsername(String username, String newpassword) {
        User user = userMapper.findUsersByUsername(username);
        user.setUsername(username);
        user.setPassword(newpassword);
        userMapper.updateByPrimaryKeySelective(user);
    }
    @Override
    public void AdminmodifyByUsername(String username, String password, String telnum, String teamname) {
        User user = userMapper.findUsersByUsername(username);
        user.setUsername(username);
        user.setPassword(password);
        user.setTelnum(telnum);
        user.setTeamname(teamname);
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void modifyByUsername(String username, String telnum, String teamname) {
        User user = userMapper.findUsersByUsername(username);
        user.setUsername(username);
        user.setTelnum(telnum);
        user.setTeamname(teamname);
        userMapper.updateByPrimaryKeySelective(user);
    }
    @Override
    public void remove(int id) {
        userMapper.deleteByPrimaryKey(id);
    }
    @Override
    public void put(int id,String username)
    {
        User user = userMapper.selectByPrimaryKey(id);
        user.setUsername(username);
    }
    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }
}
