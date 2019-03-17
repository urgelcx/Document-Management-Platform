package com.urge.dao;

import com.urge.entity.Tb_user;

import java.util.List;

public interface Tb_userMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tb_user record);

    int insertSelective(Tb_user record);

    Tb_user selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tb_user record);

    int updateByPrimaryKey(Tb_user record);

    Tb_user findUsersByUsername(String username);

    List<Tb_user> getAllData();
}