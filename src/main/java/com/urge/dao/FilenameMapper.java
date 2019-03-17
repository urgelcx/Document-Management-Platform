package com.urge.dao;

import com.urge.entity.Filename;
import com.urge.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FilenameMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Filename record);

    int insertSelective(Filename record);

    Filename selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Filename record);

    int updateByPrimaryKey(Filename record);

    List<Filename> getAllFile();

    Filename doUpLoadFile(@Param("teamname")String teamname,
                          @Param("filename")String filename,
                          @Param("uploaduser")String uploaduser,
                          @Param("fileAddress")String fileAddress,
                          @Param("summary") String summary,
                          @Param("datatime")String datatime);

    Filename findUsersById(int id);

    List<Filename> getAllFile1();

    List<Filename> getAllFile2();

//    List<Filename> searchFile(String filename);

    List<Filename> searchFileName(@Param("filename")String filename);
}